import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../typograph/typograph.dart';

/// Application [ThemeData] assembled from the atomic tokens.
abstract final class AppTheme {
  static ThemeData get light {
    final scheme = ColorScheme.fromSeed(seedColor: AppColors.green).copyWith(
      primary: AppColors.green,
      onPrimary: AppColors.white,
      primaryContainer: AppColors.greenLight,
      onPrimaryContainer: AppColors.greenDark,
      secondary: AppColors.blue,
      onSecondary: AppColors.white,
      secondaryContainer: AppColors.blueLight,
      onSecondaryContainer: AppColors.blueDark,
      tertiary: AppColors.gold,
      tertiaryContainer: AppColors.yellowPale,
      onTertiaryContainer: AppColors.yellowText,
      surface: AppColors.surface,
      onSurface: AppColors.textPrimary,
      onSurfaceVariant: AppColors.textSecondary,
      surfaceContainerHighest: AppColors.divider,
      outline: AppColors.border,
      outlineVariant: AppColors.divider,
      error: AppColors.error,
    );

    return ThemeData(
      useMaterial3: true,
      colorScheme: scheme,
      scaffoldBackgroundColor: AppColors.background,
      fontFamily: AppTypography.fontFamily,
      textTheme: AppTypography.textTheme,
      dividerColor: AppColors.divider,
      appBarTheme: const AppBarTheme(
        backgroundColor: AppColors.background,
        surfaceTintColor: AppColors.transparent,
        foregroundColor: AppColors.textPrimary,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: true,
        titleTextStyle: AppTypography.headingS,
      ),
      cardTheme: CardThemeData(
        color: AppColors.surface,
        surfaceTintColor: AppColors.transparent,
        elevation: 0,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
      ),
      progressIndicatorTheme: const ProgressIndicatorThemeData(
        color: AppColors.greenBright,
        linearTrackColor: AppColors.divider,
      ),
    );
  }
}
