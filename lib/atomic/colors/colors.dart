import 'package:flutter/material.dart';

/// Brand colour tokens.
///
/// Values are lifted from the product mockups so widgets never hardcode a
/// hex literal — reference a semantic token here instead.
abstract final class AppColors {
  // --- greens (brand) ------------------------------------------------------
  static const Color greenDarkest = Color(0xFF0F5132);
  static const Color greenDark = Color(0xFF1B6B3A);
  static const Color green = Color(0xFF2E7D32);
  static const Color greenBright = Color(0xFF4ADE80);
  static const Color greenMint = Color(0xFF34D399);
  static const Color greenBorder = Color(0xFFA7F3D0);
  static const Color greenLight = Color(0xFFDCFCE7);
  static const Color greenPale = Color(0xFFE8F5E9);
  static const Color greenSurface = Color(0xFFF0FDF4);

  // --- blues ---------------------------------------------------------------
  static const Color blueDark = Color(0xFF1D4ED8);
  static const Color blue = Color(0xFF2563EB);
  static const Color blueLight = Color(0xFFDBEAFE);
  static const Color bluePale = Color(0xFFEFF6FF);
  static const Color blueSurface = Color(0xFFEEF2FF);

  // --- yellow / gold -------------------------------------------------------
  static const Color gold = Color(0xFFF59E0B);
  static const Color yellow = Color(0xFFFBBF24);
  static const Color yellowLight = Color(0xFFFDE68A);
  static const Color yellowPale = Color(0xFFFEF3C7);
  static const Color yellowSurface = Color(0xFFFFFBEB);
  static const Color yellowText = Color(0xFF92400E);

  // --- lavender ------------------------------------------------------------
  static const Color lavender = Color(0xFFEEF0FA);
  static const Color lavenderIcon = Color(0xFF6366F1);

  // --- neutrals ------------------------------------------------------------
  static const Color background = Color(0xFFF7F8FC);
  static const Color surface = Color(0xFFFFFFFF);
  static const Color white = Color(0xFFFFFFFF);
  static const Color textPrimary = Color(0xFF111827);
  static const Color textSecondary = Color(0xFF4B5563);
  static const Color textTertiary = Color(0xFF6B7280);
  static const Color textMuted = Color(0xFF9CA3AF);
  static const Color border = Color(0xFFE5E7EB);
  static const Color divider = Color(0xFFF3F4F6);
  static const Color lockedSurface = Color(0xFFF3F4F6);
  static const Color lockedIcon = Color(0xFFD1D5DB);
  static const Color transparent = Color(0x00000000);

  // --- semantic ------------------------------------------------------------
  static const Color success = Color(0xFF22C55E);
  static const Color error = Color(0xFFEF4444);
  static const Color shadow = Color(0x140F172A);
  static const Color whiteOverlay = Color(0x33FFFFFF);
  static const Color whiteMuted = Color(0xB3FFFFFF);
}

/// Reusable gradient definitions built from [AppColors].
abstract final class AppGradients {
  static const LinearGradient avatar = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.greenMint, AppColors.greenBright],
  );

  static const LinearGradient journeyHeader = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.greenSurface, AppColors.greenLight],
  );

  static const LinearGradient legendaryBorder = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.yellowLight, AppColors.gold],
  );

  static const LinearGradient legendaryCard = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    colors: [AppColors.yellowSurface, AppColors.yellowPale],
  );

  static const LinearGradient unlockedGlow = LinearGradient(
    begin: Alignment.topCenter,
    end: Alignment.bottomCenter,
    stops: [0.0, 0.25, 0.45],
    colors: [AppColors.yellowPale, AppColors.greenSurface, AppColors.white],
  );

  static const LinearGradient cta = LinearGradient(
    begin: Alignment.topLeft,
    end: Alignment.bottomRight,
    colors: [AppColors.greenDark, AppColors.greenDarkest],
  );
}

/// Shared shadow presets.
abstract final class AppShadows {
  static const List<BoxShadow> none = [];

  static const List<BoxShadow> card = [
    BoxShadow(color: AppColors.shadow, blurRadius: 16, offset: Offset(0, 4)),
  ];

  static const List<BoxShadow> glowGreen = [
    BoxShadow(color: Color(0x334ADE80), blurRadius: 20, spreadRadius: 2),
  ];
}
