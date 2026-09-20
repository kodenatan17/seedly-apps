import 'package:flutter/material.dart';

import '../typograph/typograph.dart';

/// Text atom.
///
/// Pass a token via [style] (defaults to [AppTypography.bodyM]) and override
/// individual properties with the named parameters — only non-null overrides
/// are applied on top of the base style.
class BaseText extends StatelessWidget {
  const BaseText(
    this.text, {
    super.key,
    this.style,
    this.color,
    this.fontSize,
    this.fontWeight,
    this.fontStyle,
    this.height,
    this.letterSpacing,
    this.decoration,
    this.textAlign,
    this.maxLines,
    this.overflow,
    this.softWrap = true,
  });

  final String text;
  final TextStyle? style;
  final Color? color;
  final double? fontSize;
  final FontWeight? fontWeight;
  final FontStyle? fontStyle;
  final double? height;
  final double? letterSpacing;
  final TextDecoration? decoration;
  final TextAlign? textAlign;
  final int? maxLines;
  final TextOverflow? overflow;
  final bool softWrap;

  @override
  Widget build(BuildContext context) {
    final effectiveStyle = (style ?? AppTypography.bodyM).copyWith(
      color: color,
      fontSize: fontSize,
      fontWeight: fontWeight,
      fontStyle: fontStyle,
      height: height,
      letterSpacing: letterSpacing,
      decoration: decoration,
    );

    return Text(
      text,
      style: effectiveStyle,
      textAlign: textAlign,
      maxLines: maxLines,
      overflow: overflow ?? (maxLines != null ? TextOverflow.ellipsis : null),
      softWrap: softWrap,
    );
  }
}
