import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../widgets/auth_google_button.dart';
import '../widgets/password_visibility_toggle.dart';

/// "Create your SEEDLY account" registration screen — route entry point,
/// exported by `public_api.dart`.
///
/// Presentation only: the form validates locally and hands the credentials to
/// [onCreateAccount]. TODO: wire to a register use case once one lands, then
/// move the submit/loading state into [AuthBloc].
class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
    this.onCreateAccount,
    this.onSignInWithGoogle,
    this.onLogIn,
  });

  final void Function(String email, String password)? onCreateAccount;
  final VoidCallback? onSignInWithGoogle;
  final VoidCallback? onLogIn;

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmController = TextEditingController();
  bool _obscurePassword = true;
  bool _agreedToTerms = false;
  String? _emailError;
  String? _passwordError;
  String? _confirmError;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _confirmController.dispose();
    super.dispose();
  }

  bool get _confirmMatches =>
      _confirmController.text.isNotEmpty &&
      _confirmController.text == _passwordController.text;

  void _submit() {
    FocusScope.of(context).unfocus();
    final l10n = context.l10n;
    final email = _emailController.text.trim();
    final password = _passwordController.text;

    setState(() {
      _emailError = email.isEmpty ? l10n.authEmailRequiredError : null;
      _passwordError = password.length < 8
          ? l10n.authPasswordMinLengthError
          : null;
      _confirmError = _confirmController.text == password
          ? null
          : l10n.authPasswordMismatchError;
    });

    if (_emailError != null || _passwordError != null || _confirmError != null) {
      return;
    }
    widget.onCreateAccount?.call(email, password);
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;
    final password = _passwordController.text;
    final strength = _strengthOf(context);

    return Scaffold(
      backgroundColor: AppColors.background,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.fromLTRB(20, 24, 20, 32),
          child: Column(
            children: [
              const _RegisterHero(),
              const BaseGap.v(20),
              BaseText(
                l10n.authRegisterTitle,
                style: AppTypography.headingL,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(8),
              BaseText(
                l10n.authRegisterSubtitle,
                style: AppTypography.bodyM,
                color: AppColors.textSecondary,
                textAlign: TextAlign.center,
              ),
              const BaseGap.v(24),
              BaseCard(
                borderRadius: 28,
                padding: const EdgeInsets.all(20),
                child: Column(
                  children: [
                    BaseTextField(
                      controller: _emailController,
                      label: l10n.authEmailLabel,
                      labelIcon: Icons.mail_outline,
                      hintText: l10n.authRegisterEmailHint,
                      keyboardType: TextInputType.emailAddress,
                      borderRadius: 14,
                      errorText: _emailError,
                      onChanged: (_) {
                        if (_emailError != null) {
                          setState(() => _emailError = null);
                        }
                      },
                    ),
                    const BaseGap.v(16),
                    BaseTextField(
                      controller: _passwordController,
                      label: l10n.authPasswordLabel,
                      labelIcon: Icons.lock_outline,
                      labelTrailing: BaseText(
                        l10n.authMinCharsHint,
                        style: AppTypography.caption,
                      ),
                      hintText: l10n.authPasswordHint,
                      obscureText: _obscurePassword,
                      borderRadius: 14,
                      errorText: _passwordError,
                      onChanged: (_) => setState(() {
                        _passwordError = null;
                        _confirmError = null;
                      }),
                      suffixWidget: PasswordVisibilityToggle(
                        obscured: _obscurePassword,
                        onPressed: () => setState(
                          () => _obscurePassword = !_obscurePassword,
                        ),
                      ),
                    ),
                    if (password.isNotEmpty) ...[
                      const BaseGap.v(12),
                      _PasswordStrengthCard(
                        strength: strength,
                        levelLabel: l10n.authPasswordLevelLabel(
                          strength.level,
                          strength.tier,
                        ),
                      ),
                    ],
                    BaseTextField(
                      controller: _confirmController,
                      label: l10n.authConfirmPasswordLabel,
                      labelIcon: Icons.verified_user_outlined,
                      hintText: l10n.authPasswordHint,
                      obscureText: true,
                      borderRadius: 14,
                      errorText: _confirmError,
                      onChanged: (_) {
                        if (_confirmError != null) {
                          setState(() => _confirmError = null);
                        }
                      },
                      suffixWidget: _confirmSuffix,
                    ),
                    const BaseGap.v(12),
                    BaseCheckboxRow(
                      label: l10n.authTermsAgreement,
                      value: _agreedToTerms,
                      onChanged: (value) =>
                          setState(() => _agreedToTerms = value),
                    ),
                    const BaseGap.v(16),
                    BaseButton(
                      label: l10n.authCreateAccountButton,
                      trailingIcon: Icons.spa,
                      size: BaseButtonSize.large,
                      isExpanded: true,
                      borderRadius: BorderRadius.circular(16),
                      onPressed: _agreedToTerms ? _submit : null,
                    ),
                    const BaseGap.v(20),
                    BaseDividerLabel(l10n.authOrRegisterWith),
                    const BaseGap.v(20),
                    AuthGoogleButton(
                      label: l10n.authContinueWithGoogle,
                      onPressed: widget.onSignInWithGoogle,
                    ),
                  ],
                ),
              ),
              const BaseGap.v(20),
              BaseInfoBanner(
                icon: Icons.privacy_tip_outlined,
                description: l10n.authPrivacyNote,
              ),
              const BaseGap.v(20),
              Wrap(
                alignment: WrapAlignment.center,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: [
                  BaseText(
                    l10n.authAlreadyHaveAccount,
                    style: AppTypography.bodyM,
                    color: AppColors.textSecondary,
                  ),
                  BaseTextLink(l10n.authLogInLink, onTap: widget.onLogIn),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// Strength tiers follow the mockup: 3 checks (length, capital, digit or
  /// symbol) map to Seed / Sprout / Bloom.
  _PasswordStrength _strengthOf(BuildContext context) {
    final l10n = context.l10n;
    final password = _passwordController.text;
    final score = [
      password.length >= 8,
      RegExp(r'[A-Z]').hasMatch(password),
      RegExp(r'[0-9]|[^A-Za-z0-9]').hasMatch(password),
    ].where((isMet) => isMet).length;

    return switch (score) {
      0 || 1 => _PasswordStrength(
        label: l10n.authWeakPasswordLabel,
        level: 1,
        tier: l10n.authPasswordTierSeed,
        value: 1 / 3,
        color: AppColors.error,
      ),
      2 => _PasswordStrength(
        label: l10n.authMediumPasswordLabel,
        level: 2,
        tier: l10n.authPasswordTierSprout,
        value: 2 / 3,
        color: AppColors.gold,
      ),
      _ => _PasswordStrength(
        label: l10n.authStrongPasswordLabel,
        level: 3,
        tier: l10n.authPasswordTierBloom,
        value: 1,
        color: AppColors.greenBright,
      ),
    };
  }

  Widget? get _confirmSuffix {
    if (_confirmController.text.isEmpty) return null;
    return Icon(
      _confirmMatches ? Icons.check_circle : Icons.error_outline,
      color: _confirmMatches ? AppColors.success : AppColors.error,
    );
  }
}

/// App mark: sprout in a soft green disc with a gold badge tucked behind it.
class _RegisterHero extends StatelessWidget {
  const _RegisterHero();

  @override
  Widget build(BuildContext context) {
    return Stack(
      clipBehavior: Clip.none,
      children: [
        const BaseIcon(
          Icons.spa,
          size: 30,
          color: AppColors.greenDark,
          backgroundColor: AppColors.greenLight,
          backgroundSize: 88,
        ),
        const Positioned(
          right: -6,
          bottom: 4,
          child: BaseIcon(
            Icons.star,
            size: 14,
            color: AppColors.yellowText,
            backgroundColor: AppColors.yellow,
            backgroundSize: 26,
          ),
        ),
      ],
    );
  }
}

class _PasswordStrength {
  const _PasswordStrength({
    required this.label,
    required this.level,
    required this.tier,
    required this.value,
    required this.color,
  });

  final String label;
  final int level;
  final String tier;
  final double value;
  final Color color;
}

/// Inline strength read-out under the password field: badge, tier label and
/// fill bar sharing the tier colour.
class _PasswordStrengthCard extends StatelessWidget {
  const _PasswordStrengthCard({
    required this.strength,
    required this.levelLabel,
  });

  final _PasswordStrength strength;
  final String levelLabel;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: AppColors.blueSurface,
      boxShadow: AppShadows.none,
      borderRadius: 14,
      padding: const EdgeInsets.fromLTRB(14, 12, 14, 14),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Flexible(
                child: BaseBadge(
                  label: strength.label,
                  icon: Icons.verified,
                  iconSize: 12,
                  textStyle: AppTypography.labelS,
                  backgroundColor: strength.color.withValues(alpha: 0.16),
                  foregroundColor: strength.color,
                ),
              ),
              const BaseGap.h(8),
              Flexible(
                child: BaseText(
                  levelLabel,
                  style: AppTypography.labelS,
                  color: AppColors.textSecondary,
                  maxLines: 1,
                  textAlign: TextAlign.end,
                ),
              ),
            ],
          ),
          const BaseGap.v(10),
          BaseProgressBar(value: strength.value, valueColor: strength.color),
        ],
      ),
    );
  }
}

