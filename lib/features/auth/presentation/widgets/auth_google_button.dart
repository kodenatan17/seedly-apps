import 'package:flutter/material.dart';

import '../../../../atomic/atomic.dart';

/// Social sign-in row shared by the login and register screens: white pill,
/// hairline border, brand glyph in a tinted circle.
class AuthGoogleButton extends StatelessWidget {
  const AuthGoogleButton({
    super.key,
    required this.label,
    required this.onPressed,
    this.isLoading = false,
  });

  final String label;
  final VoidCallback? onPressed;
  final bool isLoading;

  @override
  Widget build(BuildContext context) {
    return BaseButton(
      label: label,
      onPressed: onPressed,
      isLoading: isLoading,
      size: BaseButtonSize.large,
      isExpanded: true,
      backgroundColor: AppColors.surface,
      foregroundColor: AppColors.textPrimary,
      borderRadius: BorderRadius.circular(16),
      // TODO: swap for the official Google glyph asset once it lands in
      // `assets/icons/`; Material's `Icons.g_mobiledata` stands in for now.
      leadingIcon: Icons.g_mobiledata,
    );
  }
}
