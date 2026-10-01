import 'dart:async';

import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

/// "Check your email" screen — route entry point, exported by
/// `public_api.dart`.
///
/// Slice of the step-2 mockup: the copy, the 3-step recap card and the resend
/// cooldown. Presentation only — the host opens the mail app and drives the
/// resend. TODO: wire the resend to `RequestOtpUseCase` and surface its
/// loading/error state once the bloc owns that flow.
class OtpScreen extends StatefulWidget {
  const OtpScreen({
    super.key,
    this.email = '',
    this.onBack,
    this.onChangeEmail,
    this.onOpenMailApp,
    this.onResendLink,
    this.resendCooldownSeconds = 57,
    this.step = 2,
    this.totalSteps = 2,
  });

  /// Address the confirmation link was sent to; the chip is hidden when empty.
  final String email;
  final VoidCallback? onBack;
  final VoidCallback? onChangeEmail;
  final VoidCallback? onOpenMailApp;
  final VoidCallback? onResendLink;

  /// Seconds before "Resend link" becomes tappable again.
  final int resendCooldownSeconds;
  final int step;
  final int totalSteps;

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  Timer? _timer;
  late int _secondsLeft = widget.resendCooldownSeconds;

  @override
  void initState() {
    super.initState();
    _startCooldown();
  }

  @override
  void dispose() {
    _timer?.cancel();
    super.dispose();
  }

  void _startCooldown() {
    _timer?.cancel();
    if (widget.resendCooldownSeconds <= 0) return;
    _secondsLeft = widget.resendCooldownSeconds;
    _timer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (_secondsLeft <= 1) {
        timer.cancel();
        setState(() => _secondsLeft = 0);
      } else {
        setState(() => _secondsLeft--);
      }
    });
  }

  void _resend() {
    widget.onResendLink?.call();
    setState(_startCooldown);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: BaseAppBar(
        title: '',
        centerTitle: false,
        showClose: false,
        onBack: widget.onBack,
        actions: [
          BaseBadge(
            icon: Icons.verified,
            iconSize: 12,
            label: l10n.authStepProgress(widget.step, widget.totalSteps),
            backgroundColor: AppColors.greenLight,
            foregroundColor: AppColors.greenDark,
          ),
          const BaseGap.h(16),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 8, 20, 32),
          child: Column(
            children: [
              const _CheckEmailHero(),
              const BaseGap.v(20),
              BaseText(
                l10n.authCheckEmailTitle,
                style: AppTypography.headingL,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(8),
              BaseText(
                l10n.authCheckEmailSubtitle,
                style: AppTypography.bodyM,
                color: AppColors.textSecondary,
                textAlign: TextAlign.center,
              ),
              if (widget.email.isNotEmpty) ...[
                const BaseGap.v(12),
                BaseBadge(
                  icon: Icons.mail_outline,
                  label: widget.email,
                  backgroundColor: AppColors.greenPale,
                  foregroundColor: AppColors.greenDark,
                  textStyle: AppTypography.labelM,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 14,
                    vertical: 8,
                  ),
                ),
              ],
              const BaseGap.v(16),
              BaseText(
                l10n.authCheckEmailHint,
                style: AppTypography.bodyS,
                color: AppColors.textSecondary,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(24),
              BaseCard(
                borderRadius: 24,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        const BaseIcon(
                          Icons.rule,
                          size: 18,
                          color: AppColors.greenDark,
                        ),
                        const BaseGap.h(8),
                        Expanded(
                          child: BaseText(
                            l10n.authQuickStepsTitle,
                            style: AppTypography.headingS,
                          ),
                        ),
                        BaseBadge(
                          label: l10n.authEasyPeasyBadge,
                          backgroundColor: AppColors.greenBright,
                          foregroundColor: AppColors.white,
                          textStyle: AppTypography.caption,
                        ),
                      ],
                    ),
                    const BaseGap.v(16),
                    _SproutStepTile(
                      index: 1,
                      title: l10n.authOpenEmailAppTitle,
                      description: l10n.authOpenEmailAppDescription,
                      icon: Icons.mail_outline,
                    ),
                    const BaseGap.v(12),
                    _SproutStepTile(
                      index: 2,
                      title: l10n.authVerifyAccountTitle,
                      description: l10n.authVerifyAccountDescription,
                      icon: Icons.touch_app_outlined,
                    ),
                    const BaseGap.v(12),
                    _SproutStepTile(
                      index: 3,
                      title: l10n.authReturnToPlantTitle,
                      description: l10n.authReturnToPlantDescription,
                      icon: Icons.yard_outlined,
                    ),
                  ],
                ),
              ),
              const BaseGap.v(24),
              BaseButton(
                label: l10n.authOpenMailAppButton,
                leadingIcon: Icons.mail_outline,
                size: BaseButtonSize.large,
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                onPressed: widget.onOpenMailApp,
              ),
              const BaseGap.v(12),
              BaseButton(
                label: _secondsLeft > 0
                    ? l10n.authResendLinkCountdown(_secondsLeft)
                    : l10n.authResendLinkButton,
                leadingIcon: Icons.refresh,
                variant: BaseButtonVariant.tonal,
                size: BaseButtonSize.large,
                isExpanded: true,
                borderRadius: BorderRadius.circular(16),
                onPressed: _secondsLeft > 0 ? null : _resend,
              ),
              const BaseGap.v(12),
              BaseTextLink(
                l10n.authChangeEmailLink,
                onTap: widget.onChangeEmail,
              ),
              const BaseGap.v(20),
              BaseInfoBanner(
                icon: Icons.push_pin,
                description: l10n.authSpamNote,
                iconColor: AppColors.yellowText,
                iconBackgroundColor: AppColors.yellow,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

/// Envelope medallion with the mockup's floating badges around it.
class _CheckEmailHero extends StatelessWidget {
  const _CheckEmailHero();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const BaseIcon(
          Icons.mark_email_read_outlined,
          size: 40,
          color: AppColors.greenDark,
          backgroundColor: AppColors.greenLight,
          backgroundSize: 112,
        ),
        const Positioned(
          left: -14,
          top: 8,
          child: BaseIcon(
            Icons.favorite,
            size: 12,
            color: AppColors.greenDark,
            backgroundColor: AppColors.white,
            backgroundSize: 26,
          ),
        ),
        const Positioned(
          right: -16,
          top: 20,
          child: BaseIcon(
            Icons.wb_sunny_outlined,
            size: 12,
            color: AppColors.yellowText,
            backgroundColor: AppColors.yellow,
            backgroundSize: 24,
          ),
        ),
        const Positioned(
          right: 6,
          bottom: -8,
          child: BaseIcon(
            Icons.eco,
            size: 12,
            color: AppColors.greenDark,
            backgroundColor: AppColors.white,
            backgroundSize: 26,
          ),
        ),
      ],
    );
  }
}

/// One numbered instruction inside the "Quick 3-step sprout" card.
class _SproutStepTile extends StatelessWidget {
  const _SproutStepTile({
    required this.index,
    required this.title,
    required this.description,
    required this.icon,
  });

  final int index;
  final String title;
  final String description;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: AppColors.lavender,
      boxShadow: AppShadows.none,
      borderRadius: 16,
      padding: const EdgeInsets.all(12),
      child: Row(
        children: [
          SizedBox.square(
            dimension: 28,
            child: DecoratedBox(
              decoration: const BoxDecoration(
                color: AppColors.surface,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: BaseText(
                  '$index',
                  style: AppTypography.labelM,
                  color: AppColors.greenDark,
                ),
              ),
            ),
          ),
          const BaseGap.h(12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BaseText(title, style: AppTypography.titleS),
                const BaseGap.v(2),
                BaseText(
                  description,
                  style: AppTypography.bodyS,
                  color: AppColors.textSecondary,
                ),
              ],
            ),
          ),
          const BaseGap.h(8),
          Icon(icon, size: 18, color: AppColors.textMuted),
        ],
      ),
    );
  }
}

