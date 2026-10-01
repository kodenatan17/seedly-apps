import 'package:flutter/material.dart';
import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

class NotificationSettingsScreen extends StatefulWidget {
  const NotificationSettingsScreen({super.key, this.onBack, this.onNavTap});

  final VoidCallback? onBack;
  final ValueChanged<int>? onNavTap;

  @override
  State<NotificationSettingsScreen> createState() =>
      _NotificationSettingsScreenState();
}

class _NotificationSettingsScreenState
    extends State<NotificationSettingsScreen> {
  final Map<String, bool> _prefs = {
    'watering': true,
    'sunlight': true,
    'dailyMission': true,
    'weeklyGrowth': false,
    'iot': true,
  };

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: BaseAppBar(title: '', showClose: false, onBack: widget.onBack),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            BaseText(l10n.notificationPrefsTitle, style: AppTypography.headingL),
            const BaseGap.v(6),
            BaseText(
              l10n.notificationPrefsSubtitle,
              style: AppTypography.bodyM,
              color: AppColors.textSecondary,
            ),
            _Group(
              label: l10n.notificationPrefsGroupPlantCare,
              rows: [
                _PrefRow(
                  icon: Icons.water_drop,
                  iconBg: AppColors.yellowPale,
                  iconColor: AppColors.yellowText,
                  title: l10n.notificationPrefsWateringTitle,
                  subtitle: l10n.notificationPrefsWateringSubtitle,
                  value: _prefs['watering']!,
                  onChanged: (v) => setState(() => _prefs['watering'] = v),
                ),
                _PrefRow(
                  icon: Icons.wb_sunny_outlined,
                  iconBg: AppColors.yellowPale,
                  iconColor: AppColors.yellowText,
                  title: l10n.notificationPrefsSunlightTitle,
                  subtitle: l10n.notificationPrefsSunlightSubtitle,
                  value: _prefs['sunlight']!,
                  onChanged: (v) => setState(() => _prefs['sunlight'] = v),
                ),
              ],
            ),
            _Group(
              label: l10n.notificationPrefsGroupMissions,
              rows: [
                _PrefRow(
                  icon: Icons.flag_outlined,
                  iconBg: AppColors.blueLight,
                  iconColor: AppColors.blueDark,
                  title: l10n.notificationPrefsDailyMissionTitle,
                  subtitle: l10n.notificationPrefsDailyMissionSubtitle,
                  value: _prefs['dailyMission']!,
                  onChanged: (v) => setState(() => _prefs['dailyMission'] = v),
                ),
                _PrefRow(
                  icon: Icons.trending_up,
                  iconBg: AppColors.greenLight,
                  iconColor: AppColors.greenDark,
                  title: l10n.notificationPrefsWeeklyGrowthTitle,
                  subtitle: l10n.notificationPrefsWeeklyGrowthSubtitle,
                  value: _prefs['weeklyGrowth']!,
                  onChanged: (v) => setState(() => _prefs['weeklyGrowth'] = v),
                ),
              ],
            ),
            _Group(
              label: l10n.notificationPrefsGroupHardware,
              rows: [
                _PrefRow(
                  icon: Icons.wifi_off,
                  iconBg: AppColors.error.withValues(alpha: 0.12),
                  iconColor: AppColors.error,
                  title: l10n.notificationPrefsIotTitle,
                  subtitle: l10n.notificationPrefsIotSubtitle,
                  value: _prefs['iot']!,
                  onChanged: (v) => setState(() => _prefs['iot'] = v),
                ),
              ],
            ),
            const BaseGap.v(20),
            BaseInfoBanner(
              icon: Icons.eco,
              iconColor: AppColors.greenDark,
              iconBackgroundColor: AppColors.greenLight,
              backgroundColor: AppColors.lavender,
              description: l10n.notificationPrefsFooterNote,
            ),
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
              currentIndex: 0,
              onTap: (i) => widget.onNavTap?.call(i),
            ),
          ],
        ),
      ),
    );
  }
}

class _Group extends StatelessWidget {
  const _Group({required this.label, required this.rows});

  final String label;
  final List<_PrefRow> rows;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        const BaseGap.v(20),
        Row(
          children: [
            const BaseIcon(Icons.eco, size: 16, color: AppColors.green),
            const BaseGap.h(8),
            BaseText(
              label.toUpperCase(),
              style: AppTypography.labelS,
              color: AppColors.greenDark,
            ),
          ],
        ),
        const BaseGap.v(8),
        BaseCard(
          borderRadius: 20,
          child: Column(
            children: [
              for (var i = 0; i < rows.length; i++) ...[
                if (i > 0)
                  const Divider(height: 1, color: AppColors.divider),
                rows[i],
              ],
            ],
          ),
        ),
      ],
    );
  }
}

class _PrefRow extends StatelessWidget {
  const _PrefRow({
    required this.icon,
    required this.iconBg,
    required this.iconColor,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  final IconData icon;
  final Color iconBg;
  final Color iconColor;
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BaseIcon(
          icon,
          backgroundColor: iconBg,
          color: iconColor,
          backgroundSize: 44,
        ),
        const BaseGap.h(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(title, style: AppTypography.titleS),
              BaseText(
                subtitle,
                style: AppTypography.bodyS,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
        Switch.adaptive(value: value, activeThumbColor: AppColors.greenDark, onChanged: onChanged),
      ],
    );
  }
}
