import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../models/garden_seed_metadata.dart';

/// Vertical "Expected Journey" timeline on
/// `garden_choose_container_screen.dart`. The first stage is drawn as
/// current (filled dot), the rest as upcoming (outlined dot).
class JourneyTimeline extends StatelessWidget {
  const JourneyTimeline({super.key, required this.stages});

  final List<GardenJourneyStage> stages;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < stages.length; i++)
          _JourneyRow(
            stage: stages[i],
            isCurrent: i == 0,
            isLast: i == stages.length - 1,
          ),
      ],
    );
  }
}

class _JourneyRow extends StatelessWidget {
  const _JourneyRow({
    required this.stage,
    required this.isCurrent,
    required this.isLast,
  });

  final GardenJourneyStage stage;
  final bool isCurrent;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    return IntrinsicHeight(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SizedBox(
            width: 16,
            child: Column(
              children: [
                Container(
                  width: 12,
                  height: 12,
                  margin: const EdgeInsets.only(top: 4),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: isCurrent ? AppColors.greenDark : AppColors.white,
                    border: Border.all(
                      color: isCurrent ? AppColors.greenDark : AppColors.border,
                      width: 2,
                    ),
                  ),
                ),
                if (!isLast)
                  Expanded(
                    child: Container(
                      width: 2,
                      margin: const EdgeInsets.symmetric(vertical: 2),
                      color: AppColors.border,
                    ),
                  ),
              ],
            ),
          ),
          const BaseGap.h(12),
          Expanded(
            child: Padding(
              padding: EdgeInsets.only(bottom: isLast ? 0 : 16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  BaseText(stage.label, style: AppTypography.titleS),
                  const BaseGap.v(2),
                  BaseText(
                    stage.durationLabel,
                    style: AppTypography.bodyS,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
