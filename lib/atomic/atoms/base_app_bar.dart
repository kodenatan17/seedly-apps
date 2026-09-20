import 'package:flutter/material.dart';

import '../colors/colors.dart';
import '../typograph/typograph.dart';
import 'base_text.dart';

/// App bar atom with optional back (leading) and close (trailing) buttons.
///
/// When [onBack] / [onClose] are omitted the buttons fall back to
/// `Navigator.maybePop`, so the widget works without a host-supplied callback.
class BaseAppBar extends StatelessWidget implements PreferredSizeWidget {
  const BaseAppBar({
    super.key,
    required this.title,
    this.onBack,
    this.onClose,
    this.showBack = true,
    this.showClose = true,
    this.backgroundColor = AppColors.background,
    this.centerTitle = true,
    this.titleStyle = AppTypography.headingS,
    this.actions = const [],
  });

  final String title;
  final VoidCallback? onBack;
  final VoidCallback? onClose;
  final bool showBack;
  final bool showClose;
  final Color backgroundColor;
  final bool centerTitle;
  final TextStyle titleStyle;

  /// Extra trailing widgets rendered before the close button.
  final List<Widget> actions;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);

  @override
  Widget build(BuildContext context) {
    void pop() => Navigator.of(context).maybePop();

    return AppBar(
      backgroundColor: backgroundColor,
      surfaceTintColor: AppColors.transparent,
      elevation: 0,
      scrolledUnderElevation: 0,
      centerTitle: centerTitle,
      automaticallyImplyLeading: false,
      leading: showBack
          ? IconButton(
              icon: const Icon(Icons.arrow_back),
              color: AppColors.textPrimary,
              onPressed: onBack ?? pop,
            )
          : null,
      title: BaseText(title, style: titleStyle),
      actions: [
        ...actions,
        if (showClose)
          IconButton(
            icon: const Icon(Icons.close),
            color: AppColors.textPrimary,
            onPressed: onClose ?? pop,
          ),
      ],
    );
  }
}
