import 'package:flutter/material.dart';
import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

class AccountDetailScreen extends StatefulWidget {
  const AccountDetailScreen({
    super.key,
    this.onBack,
    this.onNavTap,
    this.onUpdateProfile,
    this.onAddPot,
    this.onPotTap,
  });

  final VoidCallback? onBack;
  final ValueChanged<int>? onNavTap;
  final VoidCallback? onUpdateProfile;
  final VoidCallback? onAddPot;
  final VoidCallback? onPotTap;

  @override
  State<AccountDetailScreen> createState() => _AccountDetailScreenState();
}

class _AccountDetailScreenState extends State<AccountDetailScreen> {
  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: BaseAppBar(
        title: l10n.accountDetailTitle,
        showClose: false,
        onBack: widget.onBack,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const _AccountHero(),
            const BaseGap.v(16),
            _PersonalInfoCard(onUpdateProfile: widget.onUpdateProfile),
            const BaseGap.v(16),
            _AssociatedPotsCard(
              onAddPot: widget.onAddPot,
              onPotTap: widget.onPotTap,
            ),
            const BaseGap.v(16),
            const _CareFooter(),
            const BaseGap.v(24),
            BaseBottomNavBar(
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
              currentIndex: 3,
              onTap: (i) => widget.onNavTap?.call(i),
            ),
          ],
        ),
      ),
    );
  }
}

class _AccountHero extends StatelessWidget {
  const _AccountHero();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            children: [
              const BaseIcon(
                Icons.person,
                size: 34,
                color: AppColors.white,
                backgroundGradient: AppGradients.avatar,
                backgroundSize: 84,
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: BaseIcon(
                  Icons.camera_alt,
                  backgroundColor: AppColors.gold,
                  backgroundSize: 26,
                  size: 14,
                  color: AppColors.white,
                ),
              ),
            ],
          ),
          // ponytail: avatar placeholder (BaseIcon on gradient) — swap real photo when upload lands. TODO
          const BaseGap.v(12),
          BaseText(
            l10n.accountDetailDisplayNameHint,
            style: AppTypography.headingL,
          ),
          const BaseGap.v(6),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const BaseIcon(Icons.eco, size: 14, color: AppColors.green),
              const BaseGap.h(6),
              Flexible(
                child: BaseText(
                  l10n.accountDetailMemberSince,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                ),
              ),
            ],
          ),
          const BaseGap.v(12),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 8,
            runSpacing: 8,
            children: [
              BaseBadge(
                label: l10n.accountDetailLevelBadge,
                icon: Icons.military_tech,
                backgroundColor: AppColors.yellowPale,
                foregroundColor: AppColors.yellowText,
              ),
              BaseBadge(
                label: l10n.accountDetailStreakBadge,
                icon: Icons.local_fire_department,
                backgroundColor: AppColors.yellowPale,
                foregroundColor: AppColors.yellowText,
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class _PersonalInfoCard extends StatelessWidget {
  const _PersonalInfoCard({this.onUpdateProfile});

  final VoidCallback? onUpdateProfile;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: BaseText(
                  l10n.accountDetailPersonalInfoTitle,
                  style: AppTypography.headingS,
                ),
              ),
              const BaseIcon(
                Icons.badge_outlined,
                size: 20,
                color: AppColors.green,
              ),
            ],
          ),
          const BaseGap.v(12),
          BaseTextField(
            label: l10n.accountDetailDisplayNameLabel,
            labelIcon: Icons.badge_outlined,
            prefixIcon: Icons.person_outline,
            hintText: l10n.accountDetailDisplayNameHint,
          ),
          const BaseGap.v(12),
          BaseTextField(
            label: l10n.accountDetailEmailLabel,
            labelIcon: Icons.mail_outline,
            prefixIcon: Icons.mail_outline,
            hintText: l10n.accountDetailEmailHint,
            keyboardType: TextInputType.emailAddress,
          ),
          const BaseGap.v(16),
          BaseButton(
            label: l10n.accountDetailUpdateButton,
            onPressed: onUpdateProfile,
            variant: BaseButtonVariant.primary,
            size: BaseButtonSize.large,
            isExpanded: true,
            borderRadius: BorderRadius.circular(16),
            leadingIcon: Icons.check_circle_outline,
          ),
        ],
      ),
    );
  }
}

class _AssociatedPotsCard extends StatelessWidget {
  const _AssociatedPotsCard({this.onAddPot, this.onPotTap});

  final VoidCallback? onAddPot;
  final VoidCallback? onPotTap;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                child: BaseText(
                  l10n.accountDetailPotsTitle,
                  style: AppTypography.headingS,
                ),
              ),
              BaseTextLink(
                l10n.accountDetailAddNewLink,
                onTap: onAddPot,
                style: AppTypography.labelS,
                color: AppColors.greenDark,
              ),
            ],
          ),
          const BaseGap.v(12),
          BaseCard(
            backgroundColor: AppColors.lavender,
            boxShadow: AppShadows.none,
            borderRadius: 18,
            onTap: onPotTap,
            child: Row(
              children: [
                const BaseIcon(
                  Icons.eco_outlined,
                  backgroundColor: AppColors.yellowPale,
                  color: AppColors.yellowText,
                  backgroundSize: 44,
                ),
                const BaseGap.h(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        l10n.accountDetailPotAName,
                        style: AppTypography.titleS,
                      ),
                      BaseText(
                        l10n.accountDetailPotASpecies,
                        style: AppTypography.bodyS,
                        color: AppColors.textSecondary,
                      ),
                      BaseText(
                        l10n.accountDetailPotASoil,
                        style: AppTypography.bodyS,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
          const BaseGap.v(12),
          BaseCard(
            backgroundColor: AppColors.lavender,
            boxShadow: AppShadows.none,
            borderRadius: 18,
            onTap: onPotTap,
            child: Row(
              children: [
                const BaseIcon(
                  Icons.thermostat,
                  backgroundColor: AppColors.blueLight,
                  color: AppColors.blueDark,
                  backgroundSize: 44,
                ),
                const BaseGap.h(12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      BaseText(
                        l10n.accountDetailPotBName,
                        style: AppTypography.titleS,
                      ),
                      BaseText(
                        l10n.accountDetailPotBSpecies,
                        style: AppTypography.bodyS,
                        color: AppColors.textSecondary,
                      ),
                      BaseText(
                        l10n.accountDetailPotBSoil,
                        style: AppTypography.bodyS,
                        color: AppColors.textSecondary,
                      ),
                    ],
                  ),
                ),
                Container(
                  width: 10,
                  height: 10,
                  decoration: const BoxDecoration(
                    color: AppColors.green,
                    shape: BoxShape.circle,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _CareFooter extends StatelessWidget {
  const _CareFooter();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const BaseIcon(Icons.favorite, size: 14, color: AppColors.green),
        const BaseGap.h(6),
        Flexible(
          child: BaseText(
            l10n.accountDetailFooterNote,
            style: AppTypography.bodyS,
            color: AppColors.textSecondary,
          ),
        ),
      ],
    );
  }
}
