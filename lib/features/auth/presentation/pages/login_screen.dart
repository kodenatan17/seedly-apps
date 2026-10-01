import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../atomic/atomic.dart';
import '../../../../l10n/l10n.dart';
import '../bloc/auth_bloc.dart';
import '../bloc/auth_event.dart';
import '../bloc/auth_state.dart';
import '../widgets/auth_google_button.dart';
import '../widgets/password_visibility_toggle.dart';

/// "Welcome back" login screen — route entry point, exported by
/// `public_api.dart`.
///
/// Email/password submission is injected through [onLoginSubmitted] (no login
/// use case exists yet); only Google sign-in is wired to [AuthBloc].
/// Navigation stays with the host through callbacks, so the screen never
/// imports `go_router`.
class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
    this.onSignInSuccess,
    this.onLoginSubmitted,
    this.onCreateAccount,
    this.onForgotPassword,
  });

  /// Host-supplied navigation callback, mirroring `MissionListScreen`'s
  /// `onMissionSelected` — the screen itself never imports `go_router`.
  final VoidCallback? onSignInSuccess;

  /// Email/password submit. TODO: wire to a login use case once one lands.
  final void Function(String email, String password)? onLoginSubmitted;
  final VoidCallback? onCreateAccount;
  final VoidCallback? onForgotPassword;

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;
  bool _rememberMe = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _submit() {
    FocusScope.of(context).unfocus();
    widget.onLoginSubmitted?.call(
      _emailController.text.trim(),
      _passwordController.text,
    );
  }

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Scaffold(
      backgroundColor: AppColors.background,
      body: BlocConsumer<AuthBloc, AuthState>(
        listenWhen: (previous, current) => current is AuthSuccess,
        listener: (context, state) => widget.onSignInSuccess?.call(),
        builder: (context, state) {
          final isGoogleLoading = state is AuthLoading;

          return SafeArea(
            child: SingleChildScrollView(
              padding: const EdgeInsets.fromLTRB(20, 32, 20, 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const _LoginHeader(),
                  const BaseGap.v(20),
                  if (state is AuthFailure) ...[
                    _LoginErrorBanner(message: state.message),
                    const BaseGap.v(16),
                  ],
                  BaseCard(
                    borderRadius: 24,
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      children: [
                        BaseTextField(
                          controller: _emailController,
                          label: l10n.authEmailLabel,
                          labelIcon: Icons.mail_outline,
                          hintText: l10n.authEmailHint,
                          keyboardType: TextInputType.emailAddress,
                          borderRadius: 14,
                        ),
                        const BaseGap.v(16),
                        BaseTextField(
                          controller: _passwordController,
                          label: l10n.authPasswordLabel,
                          labelIcon: Icons.lock_outline,
                          hintText: l10n.authPasswordHint,
                          obscureText: _obscurePassword,
                          borderRadius: 14,
                          onSubmitted: (_) => _submit(),
                          suffixWidget: PasswordVisibilityToggle(
                            obscured: _obscurePassword,
                            onPressed: () => setState(
                              () => _obscurePassword = !_obscurePassword,
                            ),
                          ),
                        ),
                        const BaseGap.v(8),
                        BaseCheckboxRow(
                          label: l10n.authRememberMe,
                          value: _rememberMe,
                          onChanged: (value) =>
                              setState(() => _rememberMe = value),
                          trailing: BaseTextLink(
                            l10n.authForgotPasswordLink,
                            style: AppTypography.labelS,
                            onTap: widget.onForgotPassword,
                          ),
                        ),
                        const BaseGap.v(16),
                        BaseButton(
                          label: l10n.authLogInButton,
                          trailingIcon: Icons.spa,
                          size: BaseButtonSize.large,
                          isExpanded: true,
                          borderRadius: BorderRadius.circular(16),
                          onPressed: isGoogleLoading ? null : _submit,
                        ),
                        const BaseGap.v(20),
                        BaseDividerLabel(l10n.authOrDivider),
                        const BaseGap.v(20),
                        AuthGoogleButton(
                          label: l10n.authSignInWithGoogle,
                          isLoading: isGoogleLoading,
                          onPressed: () => context.read<AuthBloc>().add(
                            const GoogleSignInRequested(),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const BaseGap.v(24),
                  Wrap(
                    alignment: WrapAlignment.center,
                    crossAxisAlignment: WrapCrossAlignment.center,
                    children: [
                      BaseText(
                        l10n.authNewToSeedly,
                        style: AppTypography.bodyM,
                        color: AppColors.textSecondary,
                      ),
                      BaseTextLink(
                        l10n.authCreateAnAccountLink,
                        onTap: widget.onCreateAccount,
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class _LoginHeader extends StatelessWidget {
  const _LoginHeader();

  @override
  Widget build(BuildContext context) {
    final l10n = context.l10n;

    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              BaseText(
                l10n.authWelcomeBackTitle,
                style: AppTypography.headingXL,
              ),
              const BaseGap.v(8),
              BaseText(
                l10n.authWelcomeBackSubtitle,
                style: AppTypography.bodyM,
                color: AppColors.textSecondary,
              ),
            ],
          ),
        ),
        const BaseGap.h(12),
        // TODO: swap for the mockup's greenhouse photo once that asset lands
        // in `assets/images/`.
        SizedBox(
          width: 96,
          height: 96,
          child: BaseCard(
            gradient: AppGradients.journeyHeader,
            borderRadius: 20,
            boxShadow: AppShadows.none,
            padding: EdgeInsets.zero,
            child: const Center(
              child: BaseIcon(
                Icons.local_florist,
                size: 28,
                color: AppColors.white,
                backgroundGradient: AppGradients.avatar,
                backgroundSize: 52,
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class _LoginErrorBanner extends StatelessWidget {
  const _LoginErrorBanner({required this.message});

  final String message;

  @override
  Widget build(BuildContext context) {
    return BaseCard(
      backgroundColor: AppColors.error.withValues(alpha: 0.12),
      boxShadow: AppShadows.none,
      borderRadius: 16,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const BaseIcon(
            Icons.priority_high,
            size: 18,
            color: AppColors.error,
            backgroundColor: AppColors.white,
            backgroundSize: 32,
          ),
          const BaseGap.h(12),
          Expanded(
            child: BaseText(
              message,
              style: AppTypography.bodyS,
              color: AppColors.error,
            ),
          ),
        ],
      ),
    );
  }
}
