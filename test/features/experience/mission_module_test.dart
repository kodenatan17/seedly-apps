import 'package:get_it/get_it.dart';
import 'package:seedly_app/cores/dependency/injection.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:seedly_app/features/experience/infrastructure/mappers/mission_dto_mapper.dart';
import 'package:seedly_app/features/experience/applications/entities/mission_definition.dart';
import 'package:seedly_app/features/experience/applications/entities/mission_instance.dart';
import 'package:seedly_app/features/experience/applications/entities/mission_scope.dart';
import 'package:seedly_app/features/experience/applications/entities/mission_status.dart';
import 'package:seedly_app/features/experience/applications/repositories/mission_repository.dart';
import 'package:seedly_app/features/experience/applications/usecases/get_mission_detail_usecase.dart';
import 'package:seedly_app/features/experience/applications/usecases/get_missions_usecase.dart';
import 'package:seedly_app/features/experience/presentation/bloc/mission_bloc.dart';
import 'package:seedly_app/features/experience/presentation/bloc/mission_event.dart';
import 'package:seedly_app/features/experience/presentation/bloc/mission_state.dart';

/// One self-check file covering the module's non-trivial logic:
/// DTO parsing (strict), Bloc's loading → loaded transition, and DI registration.
void main() {
  setUp(() {
    GetIt.instance.reset();
  });

  group('MissionDI & Composition Root', () {
    test('registerCoreDependencies registers mission dependencies idempotently', () {
      expect(GetIt.instance.isRegistered<MissionRepository>(), isFalse);

      registerCoreDependencies();

      expect(GetIt.instance.isRegistered<MissionRepository>(), isTrue);
      expect(GetIt.instance.isRegistered<GetMissionsUseCase>(), isTrue);

      // Verify idempotency (re-registering does not throw)
      expect(registerCoreDependencies, returnsNormally);
      expect(GetIt.instance.isRegistered<MissionRepository>(), isTrue);
    });
  });

  group('MissionDtoMapper', () {
    const mapper = MissionDtoMapper();

    test('parses a full instance payload', () {
      final mission = mapper.toInstance({
        'id': 'inst-1',
        'definition': {
          'key': 'keep_plant_happy',
          'title': 'Keep Your Plant Happy',
          'subtitle': 'A week of good care.',
          'xpReward': 100,
        },
        'scope': {'type': 'PLANT', 'plantId': 'plant-1'},
        'status': 'ACTIVE',
        'activatedAt': '2026-09-03T08:00:00Z',
        'objectives': [
          {
            'key': 'good_env_days',
            'title': '7 days of healthy conditions',
            'sourceType': 'CONTAINER_ENV',
            'countRequired': 7,
            'evidencedCount': 4,
            'status': 'IN_PROGRESS',
          },
        ],
        'progress': {'objectivesCompleted': 0, 'objectivesTotal': 2},
      });

      expect(mission.id, 'inst-1');
      expect(mission.definition.key, 'keep_plant_happy');
      expect(mission.scope.type, MissionScope.plant);
      expect(mission.scope.plantId, 'plant-1');
      expect(mission.objectives.single.progress, closeTo(4 / 7, 0.0001));
      expect(mission.isCompleted, isFalse);
    });

    test('throws on a malformed payload instead of half-parsing', () {
      expect(
        () => mapper.toInstance({'id': 'inst-1'}),
        throwsFormatException,
      );
    });
  });

  group('MissionBloc (read-only)', () {
    test('emits Loading then Loaded via the read use case', () async {
      final repo = _FakeRepo([
        MissionInstance(
          id: 'a',
          definition: const MissionDefinition(
            key: 'k',
            title: 'T',
            xpReward: 10,
          ),
          scope: const MissionScopeRef(type: MissionScope.user),
          status: MissionStatus.active,
          activatedAt: DateTime(2026),
        ),
      ]);
      final bloc = MissionBloc(
        getMissions: GetMissionsUseCase(repo),
        getMissionDetail: GetMissionDetailUseCase(repo),
      );

      final states = <MissionState>[];
      final sub = bloc.stream.listen(states.add);
      bloc.add(const MissionRequested());
      await Future<void>.delayed(Duration.zero);
      await sub.cancel();

      expect(states.first, isA<MissionLoading>());
      expect(states.last, isA<MissionLoaded>());
      expect((states.last as MissionLoaded).missions, hasLength(1));
    });
  });
}

/// Minimal fake exposing only the read methods the Bloc uses.
class _FakeRepo implements MissionRepository {
  _FakeRepo(this._missions);

  final List<MissionInstance> _missions;

  @override
  Future<List<MissionInstance>> getMissions() async => _missions;

  @override
  Future<MissionInstance> getMissionDetail(String id) async =>
      _missions.firstWhere((m) => m.id == id);

  @override
  Future<List<MissionInstance>> getActiveMissions() async =>
      _missions.where((m) => !m.isCompleted).toList(growable: false);

  @override
  Future<MissionHistoryPage> getMissionHistory({String? cursor}) async =>
      MissionHistoryPage(items: _missions);
}
