import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../bloc/garden/garden_bloc.dart';
import '../bloc/garden/garden_event.dart';
import '../bloc/garden/garden_state.dart';
import '../widgets/garden_hero_empty_card.dart';
import '../widgets/garden_info_banner.dart';

/// Garden landing screen — route entry point, exported by `public_api.dart`.
///
/// Renders the first-login empty-garden hero when the user has no planted
/// containers yet (`GardenEmpty`); a minimal "garden is growing" summary
/// once they do (`GardenLoaded` — no dedicated mockup was provided for this
/// state, so it stays intentionally simple pending a full dashboard design).
/// Navigation is injected through callbacks; the screen never imports
/// go_router.
class GardenScreen extends StatefulWidget {
  const GardenScreen({
    super.key,
    this.userName = 'Nurul',
    this.onAddFirstPlant,
    this.onScanQr,
    this.onOpenProfile,
    this.onOpenSettings,
    this.onViewMyPlants,
    this.onNavTap,
  });

  /// Display name for the greeting. Placeholder until the Auth/profile
  /// feature exposes the signed-in user's name.
  final String userName;
  final VoidCallback? onAddFirstPlant;
  final VoidCallback? onScanQr;
  final VoidCallback? onOpenProfile;
  final VoidCallback? onOpenSettings;
  final VoidCallback? onViewMyPlants;

  /// Bottom nav tap — only the Garden tab (index 1) is a real destination
  /// today; other tabs belong to features that don't exist yet.
  final ValueChanged<int>? onNavTap;

  @override
  State<GardenScreen> createState() => _GardenScreenState();
}

class _GardenScreenState extends State<GardenScreen> {
  static const int _gardenTabIndex = 1;

  @override
  void initState() {
    super.initState();
    context.read<GardenBloc>().add(const GardenRequested());
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: RefreshIndicator(
                onRefresh: () async {
                  context.read<GardenBloc>().add(const GardenRefreshed());
                },
                child: SingleChildScrollView(
                  physics: const AlwaysScrollableScrollPhysics(),
                  padding: const EdgeInsets.fromLTRB(16, 8, 16, 16),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      _BrandHeader(
                        onOpenProfile: widget.onOpenProfile,
                        onOpenSettings: widget.onOpenSettings,
                      ),
                      const BaseGap.v(20),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: BaseText(
                              l10n.welcomeGreeting(widget.userName),
                              style: AppTypography.headingL,
                            ),
                          ),
                          BaseIcon(
                            Icons.yard,
                            size: 20,
                            color: AppColors.greenDark,
                            backgroundColor: AppColors.greenLight,
                            backgroundSize: 44,
                          ),
                        ],
                      ),
                      const BaseGap.v(20),
                      BlocBuilder<GardenBloc, GardenState>(
                        builder: (context, state) {
                          return switch (state) {
                            GardenLoading() => const Padding(
                              padding: EdgeInsets.only(top: 80),
                              child: Center(child: CircularProgressIndicator()),
                            ),
                            GardenEmpty() => GardenHeroEmptyCard(
                              onAddFirstPlant: widget.onAddFirstPlant ?? () {},
                              onScanQr: widget.onScanQr ?? () {},
                            ),
                            GardenLoaded(:final totalPlants) =>
                              _GardenSummaryCard(
                                totalPlants: totalPlants,
                                onViewMyPlants: widget.onViewMyPlants,
                              ),
                            GardenError(:final message) => _GardenErrorCard(
                              message: message,
                              onRetry: () => context.read<GardenBloc>().add(
                                const GardenRefreshed(),
                              ),
                            ),
                          };
                        },
                      ),
                      const BaseGap.v(16),
                      GardenInfoBanner(
                        icon: Icons.sentiment_satisfied_alt,
                        title: l10n.zeroStressTitle,
                        description: l10n.zeroStressDescription,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            BaseBottomNavBar(
              currentIndex: _gardenTabIndex,
              onTap: widget.onNavTap ?? (_) {},
              items: [
                BaseBottomNavItem(
                  icon: Icons.eco_outlined,
                  activeIcon: Icons.eco,
                  label: l10n.navHome,
                ),
                BaseBottomNavItem(
                  icon: Icons.yard_outlined,
                  activeIcon: Icons.yard,
                  label: l10n.navGarden,
                ),
                BaseBottomNavItem(
                  icon: Icons.check_circle_outline,
                  activeIcon: Icons.check_circle,
                  label: l10n.navMissions,
                ),
                BaseBottomNavItem(
                  icon: Icons.chat_bubble_outline,
                  activeIcon: Icons.chat_bubble,
                  label: l10n.navChat,
                ),
                BaseBottomNavItem(
                  icon: Icons.person_outline,
                  activeIcon: Icons.person,
                  label: l10n.navProfile,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _BrandHeader extends StatelessWidget {
  const _BrandHeader({this.onOpenProfile, this.onOpenSettings});

  final VoidCallback? onOpenProfile;
  final VoidCallback? onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
          onTap: onOpenProfile,
          customBorder: const CircleBorder(),
          child: const BaseIcon(
            Icons.face,
            size: 20,
            color: AppColors.greenDark,
            backgroundColor: AppColors.greenLight,
            backgroundSize: 40,
          ),
        ),
        Expanded(
          child: BaseText(
            'GROWPICO',
            style: AppTypography.headingS,
            color: AppColors.greenDark,
            letterSpacing: 2,
            textAlign: TextAlign.center,
          ),
        ),
        InkWell(
          onTap: onOpenSettings,
          customBorder: const CircleBorder(),
          child: const BaseIcon(Icons.settings_outlined, size: 22),
        ),
      ],
    );
  }
}

class _GardenSummaryCard extends StatelessWidget {
  const _GardenSummaryCard({required this.totalPlants, this.onViewMyPlants});

  final int totalPlants;
  final VoidCallback? onViewMyPlants;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseIcon(
            Icons.local_florist,
            size: 28,
            color: AppColors.white,
            backgroundGradient: AppGradients.avatar,
            backgroundSize: 56,
          ),
          const BaseGap.v(16),
          BaseText(l10n.gardenHasPlantsTitle, style: AppTypography.headingS),
          const BaseGap.v(6),
          BaseText(
            l10n.gardenHasPlantsDescription(totalPlants),
            style: AppTypography.bodyM,
            color: AppColors.textSecondary,
          ),
          const BaseGap.v(16),
          BaseButton(
            label: l10n.viewMyPlantsButton,
            isExpanded: true,
            onPressed: onViewMyPlants,
          ),
        ],
      ),
    );
  }
}

class _GardenErrorCard extends StatelessWidget {
  const _GardenErrorCard({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      child: Column(
        children: [
          const Icon(Icons.cloud_off, size: 36, color: AppColors.textMuted),
          const BaseGap.v(12),
          BaseText(
            message,
            style: AppTypography.bodyM,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(16),
          BaseButton(
            label: context.l10n.retryButtonLabel,
            variant: BaseButtonVariant.tonal,
            onPressed: onRetry,
          ),
        ],
      ),
    );
  }
}
