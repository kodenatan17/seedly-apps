import 'package:flutter/material.dart';
import 'package:dotted_border/dotted_border.dart';
import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({
    super.key,
    this.onBack,
    this.onNavTap,
    this.onCheckPaymentStatus,
    this.onSimulateSuccess,
    this.onSelectMethod,
  });

  final VoidCallback? onBack;
  final ValueChanged<int>? onNavTap;
  final VoidCallback? onCheckPaymentStatus;
  final VoidCallback? onSimulateSuccess;
  final ValueChanged<String>? onSelectMethod;

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return Scaffold(
      appBar: BaseAppBar(title: '', showClose: false, onBack: onBack),
      body: SingleChildScrollView(
        padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            BaseBadge(
              label: l10n.subscriptionMemberBadge,
              icon: Icons.workspace_premium,
              backgroundColor: AppColors.greenBright,
              foregroundColor: AppColors.white,
            ),
            const BaseGap.v(12),
            BaseText(
              l10n.subscriptionHeroTitle,
              style: AppTypography.headingL,
              textAlign: TextAlign.center,
            ),
            const BaseGap.v(6),
            BaseText(
              l10n.subscriptionHeroSubtitle,
              style: AppTypography.bodyM,
              color: AppColors.textSecondary,
              textAlign: TextAlign.center,
            ),
            const BaseGap.v(20),
            const _PlanCard(),
            const BaseGap.v(20),
            _PaymentCard(onSelectMethod: onSelectMethod),
            const BaseGap.v(20),
            BaseButton(
              label: l10n.subscriptionCheckStatusButton,
              onPressed: onCheckPaymentStatus,
              variant: BaseButtonVariant.tonal,
              size: BaseButtonSize.large,
              isExpanded: true,
              borderRadius: BorderRadius.circular(16),
              leadingIcon: Icons.sync,
            ),
            const BaseGap.v(12),
            BaseButton(
              label: l10n.subscriptionSimulateSuccessButton,
              onPressed: onSimulateSuccess,
              variant: BaseButtonVariant.primary,
              size: BaseButtonSize.large,
              isExpanded: true,
              borderRadius: BorderRadius.circular(16),
              leadingIcon: Icons.check_circle_outline,
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
              currentIndex: 3,
              onTap: (i) => onNavTap?.call(i),
            ),
          ],
        ),
      ),
    );
  }
}

class _PlanCard extends StatelessWidget {
  const _PlanCard();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseText(
                l10n.subscriptionPlanName,
                style: AppTypography.headingM,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  BaseText(
                    l10n.subscriptionPlanPrice,
                    style: AppTypography.headingM,
                    color: AppColors.greenDark,
                  ),
                  BaseText(
                    l10n.subscriptionPlanPeriod,
                    style: AppTypography.caption,
                    color: AppColors.textSecondary,
                  ),
                ],
              ),
            ],
          ),
          const BaseGap.v(4),
          BaseText(
            l10n.subscriptionPlanNote,
            style: AppTypography.bodyS,
            color: AppColors.textSecondary,
          ),
          const BaseGap.v(16),
          BaseCard(
            backgroundColor: AppColors.lavender,
            boxShadow: AppShadows.none,
            borderRadius: 18,
            child: Column(
              children: [
                _PerkRow(
                  icon: Icons.auto_awesome,
                  bg: AppColors.greenLight,
                  fg: AppColors.greenDark,
                  title: l10n.subscriptionPerkChatTitle,
                  body: l10n.subscriptionPerkChatBody,
                ),
                const BaseGap.v(12),
                _PerkRow(
                  icon: Icons.eco,
                  bg: AppColors.yellowPale,
                  fg: AppColors.yellowText,
                  title: l10n.subscriptionPerkContentTitle,
                  body: l10n.subscriptionPerkContentBody,
                ),
                const BaseGap.v(12),
                _PerkRow(
                  icon: Icons.palette_outlined,
                  bg: AppColors.blueLight,
                  fg: AppColors.blueDark,
                  title: l10n.subscriptionPerkDecorTitle,
                  body: l10n.subscriptionPerkDecorBody,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _PerkRow extends StatelessWidget {
  const _PerkRow({
    required this.icon,
    required this.bg,
    required this.fg,
    required this.title,
    required this.body,
  });

  final IconData icon;
  final Color bg;
  final Color fg;
  final String title;
  final String body;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        BaseIcon(icon, backgroundColor: bg, color: fg, backgroundSize: 40),
        const BaseGap.h(12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(title, style: AppTypography.titleS),
              BaseText(
                body,
                style: AppTypography.bodyS,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class _PaymentCard extends StatelessWidget {
  const _PaymentCard({this.onSelectMethod});

  final ValueChanged<String>? onSelectMethod;

  static const _methods = [
    'GoPay',
    'OVO',
    'BCA Mobile',
    "Mandiri Livin'",
    'QRIS',
  ];

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    return BaseCard(
      borderRadius: 24,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              BaseBadge(
                label: l10n.subscriptionPaymentMethodBadge,
                backgroundColor: AppColors.white,
                foregroundColor: AppColors.textPrimary,
                borderRadius: 10,
                textStyle: AppTypography.labelM,
              ),
              BaseBadge(
                label: l10n.subscriptionTimerBadge,
                icon: Icons.timer,
                backgroundColor: AppColors.yellow,
                foregroundColor: AppColors.yellowText,
              ),
            ],
          ),
          const BaseGap.v(16),
          Center(
            child: DottedBorder(
              borderType: BorderType.RRect,
              radius: const Radius.circular(20),
              dashPattern: const [6, 4],
              color: AppColors.border,
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: BaseCard(
                  backgroundColor: AppColors.white,
                  borderRadius: 20,
                  child: const Stack(
                    alignment: Alignment.center,
                    children: [
                      BaseIcon(
                        Icons.qr_code_2,
                        size: 96,
                        color: AppColors.textPrimary,
                      ),
                      BaseIcon(
                        Icons.spa,
                        size: 18,
                        color: AppColors.greenDark,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          // ponytail: QR placeholder — render real Midtrans QR when backend payment intent lands. TODO
          const BaseGap.v(12),
          BaseText(
            l10n.subscriptionScanInstruction,
            style: AppTypography.bodyS,
            color: AppColors.textSecondary,
            textAlign: TextAlign.center,
          ),
          const BaseGap.v(12),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            alignment: WrapAlignment.center,
            children: [
              for (final m in _methods)
                GestureDetector(
                  onTap: () => onSelectMethod?.call(m),
                  child: BaseBadge(
                    label: m,
                    backgroundColor: AppColors.white,
                    foregroundColor: AppColors.textPrimary,
                  ),
                ),
            ],
          ),
        ],
      ),
    );
  }
}
