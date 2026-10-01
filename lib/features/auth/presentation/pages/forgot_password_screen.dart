import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';

/// "Reset Your Password" screen — route entry point, exported by
/// `public_api.dart`.
///
/// Presentation only. TODO: wire to a forgot-password use case once one lands.
class ForgotPasswordScreen extends StatefulWidget {
  const ForgotPasswordScreen({
    super.key,
    this.onBack,
    this.onSendResetLink,
    this.onContactSupport,
  });

  final VoidCallback? onBack;
  final ValueChanged<String>? onSendResetLink;
  final VoidCallback? onContactSupport;

  @override
  State<ForgotPasswordScreen> createState() => _ForgotPasswordScreenState();
}

class _ForgotPasswordScreenState extends State<ForgotPasswordScreen> {
  final _emailController = TextEditingController();
  String? _emailError;

  @override
  void dispose() {
    _emailController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    final email = _emailController.text.trim();
    setState(() {
      _emailError = email.isEmpty ? context.l10n.authEmailRequiredError : null;
    });
    if (_emailError != null) return;
    widget.onSendResetLink?.call(email);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 16, 20, 32),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: widget.onBack,
                  customBorder: const CircleBorder(),
                  child: const BaseIcon(
                    Icons.arrow_back,
                    size: 20,
                    color: AppColors.textPrimary,
                    backgroundColor: AppColors.lavender,
                    backgroundSize: 40,
                  ),
                ),
              ),
              const BaseGap.v(32),
              BaseCard(
                borderRadius: 28,
                padding: const EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    BaseText(
                      l10n.authResetPasswordTitle,
                      style: AppTypography.headingL,
                    ),
                    const BaseGap.v(8),
                    BaseText(
                      l10n.authResetPasswordSubtitle,
                      style: AppTypography.bodyM,
                      color: AppColors.textSecondary,
                    ),
                    const BaseGap.v(20),
                    BaseTextField(
                      controller: _emailController,
                      label: l10n.authAccountEmailLabel,
                      labelTrailing: BaseText(
                        l10n.authAccountEmailBadge,
                        style: AppTypography.caption,
                      ),
                      prefixIcon: Icons.mail_outline,
                      hintText: l10n.authAccountEmailHint,
                      keyboardType: TextInputType.emailAddress,
                      borderRadius: 14,
                      errorText: _emailError,
                      textCapitalization: TextCapitalization.none,
                      onChanged: (_) {
                        if (_emailError != null) {
                          setState(() => _emailError = null);
                        }
                      },
                      onSubmitted: (_) => _submit(),
                    ),
                    const BaseGap.v(20),
                    BaseButton(
                      label: l10n.authSendResetLinkButton,
                      leadingIcon: Icons.send,
                      size: BaseButtonSize.large,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(16),
                      onPressed: _submit,
                    ),
                    const BaseGap.v(16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Icon(
                          Icons.verified_user_outlined,
                          size: 16,
                          color: AppColors.greenDark,
                        ),
                        const BaseGap.h(6),
                        BaseText(
                          l10n.authEncryptedKidSafe,
                          style: AppTypography.labelS,
                          color: AppColors.greenDark,
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const BaseGap.v(80),
              BaseCard(
                onTap: widget.onContactSupport,
                backgroundColor: AppColors.lavender,
                boxShadow: AppShadows.none,
                borderRadius: 20,
                child: Column(
                  children: [
                    const BaseIcon(
                      Icons.support_agent,
                      size: 22,
                      color: AppColors.blueDark,
                      backgroundColor: AppColors.blueLight,
                      backgroundSize: 48,
                    ),
                    const BaseGap.v(12),
                    BaseText(
                      l10n.authNeedHandTitle,
                      style: AppTypography.headingS,
                      textAlign: TextAlign.center,
                    ),
                    const BaseGap.v(4),
                    BaseText(
                      l10n.authNeedHandDescription(l10n.authSupportEmail),
                      style: AppTypography.bodyS,
                      color: AppColors.textSecondary,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ),
              const BaseGap.v(24),
              Center(
                child: BaseTextLink(
                  '← ${l10n.authBackToLogIn}',
                  onTap: widget.onBack,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
