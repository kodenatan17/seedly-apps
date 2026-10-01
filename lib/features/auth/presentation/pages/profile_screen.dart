import 'package:flutter/material.dart';
import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key, this.onNavTap, this.onOpenSettings, this.onUpgrade});

  final ValueChanged<int>? onNavTap;
  final ValueChanged<String>? onOpenSettings;
  final VoidCallback? onUpgrade;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Row(
                children: [
                  const BaseIcon(
                    Icons.person,
                    backgroundGradient: AppGradients.avatar,
                    backgroundSize: 40,
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
                  IconButton(
                    icon: const Icon(
                      Icons.settings,
                      color: AppColors.greenDark,
                    ),
                    onPressed: () => onOpenSettings?.call('account'),
                  ),
                ],
              ),
              const BaseGap.v(16),
              const _ProfileHero(),
              const BaseGap.v(16),
              _UpsellCard(onUpgrade: onUpgrade),
              const BaseGap.v(24),
              BaseText(
                l10n.profileSettingsLabel,
                style: AppTypography.overline,
                color: AppColors.textMuted,
              ),
              const BaseGap.v(8),
              _SettingsCard(onOpenSettings: onOpenSettings),
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
                onTap: (i) => onNavTap?.call(i),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _ProfileHero extends StatelessWidget {
  const _ProfileHero();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      gradient: AppGradients.legendaryCard,
      boxShadow: AppShadows.none,
      borderRadius: 24,
      padding: const EdgeInsets.symmetric(vertical: 24, horizontal: 16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Stack(
            alignment: Alignment.center,
            children: [
              const BaseIcon(
                Icons.person,
                size: 44,
                backgroundGradient: AppGradients.avatar,
                backgroundSize: 104,
              ),
              const Positioned(
                right: 0,
                bottom: 0,
                child: BaseIcon(
                  Icons.emoji_events,
                  size: 20,
                  color: AppColors.yellowText,
                  backgroundColor: AppColors.yellowPale,
                  backgroundSize: 30,
                ),
              ),
            ],
          ),
          // ponytail: avatar placeholder — swap real photo when upload lands. TODO
          const BaseGap.v(12),
          BaseText(
            l10n.profileGreeting,
            style: AppTypography.headingL,
            textAlign: TextAlign.center,
          ),
          BaseText(
            l10n.profileLevelLabel,
            style: AppTypography.bodyM,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _UpsellCard extends StatelessWidget {
  const _UpsellCard({this.onUpgrade});

  final VoidCallback? onUpgrade;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      gradient: AppGradients.legendaryCard,
      boxShadow: AppShadows.none,
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BaseBadge(
            label: l10n.profilePlusBadge,
            icon: Icons.lock,
            backgroundColor: AppColors.yellow,
            foregroundColor: AppColors.yellowText,
          ),
          const BaseGap.v(12),
          BaseText(
            l10n.profileUpsellTitle,
            style: AppTypography.headingM,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(6),
          BaseText(
            l10n.profileUpsellBody,
            style: AppTypography.bodyM,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(16),
          BaseCard(
            backgroundColor: AppColors.white,
            borderRadius: 16,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(
                  l10n.profileChatUsage,
                  style: AppTypography.bodyS,
                ),
                const BaseGap.v(8),
                const BaseProgressBar(
                  value: 1,
                  height: 6,
                  valueColor: AppColors.error,
                  backgroundColor: AppColors.white,
                ),
              ],
            ),
          ),
          const BaseGap.v(16),
          BaseButton(
            label: l10n.profileUpgradeButton,
            onPressed: onUpgrade,
            variant: BaseButtonVariant.primary,
            size: BaseButtonSize.large,
            isExpanded: true,
            borderRadius: BorderRadius.circular(999),
            leadingIcon: Icons.bolt,
          ),
          const BaseGap.v(8),
          BaseText(
            l10n.profileCancelAnytime,
            style: AppTypography.caption,
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}

class _SettingsCard extends StatelessWidget {
  const _SettingsCard({this.onOpenSettings});

  final ValueChanged<String>? onOpenSettings;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      borderRadius: 20,
      child: Column(
        children: [
          _SettingsTile(
            icon: Icons.group_outlined,
            iconBg: AppColors.blueLight,
            iconColor: AppColors.blueDark,
            title: l10n.profileSettingsAccount,
            target: 'account',
            onOpenSettings: onOpenSettings,
          ),
          const Divider(height: 1, color: AppColors.divider),
          _SettingsTile(
            icon: Icons.notifications_none,
            iconBg: AppColors.yellowPale,
            iconColor: AppColors.yellowText,
            title: l10n.profileSettingsNotifications,
            target: 'notifications',
            onOpenSettings: onOpenSettings,
          ),
          const Divider(height: 1, color: AppColors.divider),
          _SettingsTile(
            icon: Icons.help_outline,
            iconBg: AppColors.greenLight,
            iconColor: AppColors.greenDark,
            title: l10n.profileSettingsHelp,
            target: 'help',
            onOpenSettings: onOpenSettings,
          ),
        ],
      ),
    );
  }
}

class _SettingsTile extends StatelessWidget {
  const _SettingsTile({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.target,
    this.onOpenSettings,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String target;
  final ValueChanged<String>? onOpenSettings;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onOpenSettings?.call(target),
      child: Row(
        children: [
          BaseIcon(
            icon,
            backgroundColor: iconBg,
            color: iconColor,
            backgroundSize: 44,
          ),
          const BaseGap.h(12),
          Expanded(child: BaseText(title, style: AppTypography.titleS)),
          const Icon(Icons.chevron_right, color: AppColors.textMuted),
        ],
      ),
    );
  }
}
