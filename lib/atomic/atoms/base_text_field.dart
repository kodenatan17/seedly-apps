import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../colors/colors.dart';
import '../typograph/typograph.dart';
import 'base_gap.dart';
import 'base_text.dart';

/// Text input atom.
class BaseTextField extends StatelessWidget {
  const BaseTextField({
    super.key,
    this.controller,
    this.label,
    this.labelIcon,
    this.labelTrailing,
    this.hintText,
    this.errorText,
    this.prefixIcon,
    this.suffixWidget,
    this.keyboardType,
    this.textCapitalization = TextCapitalization.none,
    this.textAlign = TextAlign.start,
    this.maxLength,
    this.obscureText = false,
    this.enabled = true,
    this.autofocus = false,
    this.style = AppTypography.bodyL,
    this.borderRadius = 16,
    this.backgroundColor = AppColors.surface,
    this.inputFormatters,
    this.onChanged,
    this.onSubmitted,
  });

  final TextEditingController? controller;
  final String? label;

  /// Small glyph rendered before the [label], e.g. a mail or lock outline.
  final IconData? labelIcon;

  /// Rendered at the end of the label row, e.g. a "min 8 chars" hint.
  final Widget? labelTrailing;
  final String? hintText;
  final String? errorText;
  final IconData? prefixIcon;

  /// Rendered in the field's trailing slot, e.g. a paste button.
  final Widget? suffixWidget;
  final TextInputType? keyboardType;
  final TextCapitalization textCapitalization;
  final TextAlign textAlign;
  final int? maxLength;
  final bool obscureText;
  final bool enabled;
  final bool autofocus;
  final TextStyle style;
  final double borderRadius;
  final Color backgroundColor;
  final List<TextInputFormatter>? inputFormatters;
  final ValueChanged<String>? onChanged;
  final ValueChanged<String>? onSubmitted;

  @override
  Widget build(BuildContext context) {
    final radius = BorderRadius.circular(borderRadius);
    final field = TextField(
      controller: controller,
      keyboardType: keyboardType,
      textCapitalization: textCapitalization,
      textAlign: textAlign,
      maxLength: maxLength,
      obscureText: obscureText,
      enabled: enabled,
      autofocus: autofocus,
      style: style,
      inputFormatters: inputFormatters,
      onChanged: onChanged,
      onSubmitted: onSubmitted,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: style.copyWith(color: AppColors.textMuted),
        errorText: errorText,
        counterText: '',
        prefixIcon: prefixIcon == null
            ? null
            : Icon(prefixIcon, color: AppColors.textMuted),
        suffixIcon: suffixWidget,
        filled: true,
        fillColor: backgroundColor,
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 16,
          vertical: 16,
        ),
        border: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(color: AppColors.border),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(color: AppColors.green, width: 1.5),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: radius,
          borderSide: const BorderSide(color: AppColors.error),
        ),
      ),
    );

    if (label == null && labelTrailing == null) return field;
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            if (labelIcon != null) ...[
              Icon(labelIcon, size: 14, color: AppColors.textMuted),
              const BaseGap.h(6),
            ],
            if (label != null)
              Expanded(child: BaseText(label!, style: AppTypography.labelM)),
            ?labelTrailing,
          ],
        ),
        const SizedBox(height: 8),
        field,
      ],
    );
  }
}
