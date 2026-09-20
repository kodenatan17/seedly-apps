import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../colors/colors.dart';

enum BaseImageType { asset, network, svgAsset, svgNetwork }

/// Image atom covering raster assets, network images and SVGs behind one API.
///
/// [placeholder] is shown while loading; [errorWidget] replaces a raster image
/// that fails to decode. `flutter_svg` 2.0.x exposes no error builder, so
/// [errorWidget] does not apply to the two SVG variants.
class BaseImage extends StatelessWidget {
  const BaseImage.asset(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.placeholder,
    this.errorWidget,
    this.semanticLabel,
  }) : type = BaseImageType.asset;

  const BaseImage.network(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.cover,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.placeholder,
    this.errorWidget,
    this.semanticLabel,
  }) : type = BaseImageType.network;

  const BaseImage.svgAsset(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.placeholder,
    this.errorWidget,
    this.semanticLabel,
  }) : type = BaseImageType.svgAsset;

  const BaseImage.svgNetwork(
    this.source, {
    super.key,
    this.width,
    this.height,
    this.fit = BoxFit.contain,
    this.color,
    this.borderRadius = BorderRadius.zero,
    this.placeholder,
    this.errorWidget,
    this.semanticLabel,
  }) : type = BaseImageType.svgNetwork;

  /// Asset path or URL depending on [type].
  final String source;
  final BaseImageType type;
  final double? width;
  final double? height;
  final BoxFit fit;

  /// Tint applied to the image (`srcIn` blend for SVGs).
  final Color? color;
  final BorderRadius borderRadius;
  final Widget? placeholder;
  final Widget? errorWidget;
  final String? semanticLabel;

  @override
  Widget build(BuildContext context) {
    final image = switch (type) {
      BaseImageType.asset => Image.asset(
        source,
        width: width,
        height: height,
        fit: fit,
        color: color,
        semanticLabel: semanticLabel,
        frameBuilder: _frameBuilder,
        errorBuilder: _errorBuilder,
      ),
      BaseImageType.network => Image.network(
        source,
        width: width,
        height: height,
        fit: fit,
        color: color,
        semanticLabel: semanticLabel,
        loadingBuilder: _loadingBuilder,
        errorBuilder: _errorBuilder,
      ),
      BaseImageType.svgAsset => SvgPicture.asset(
        source,
        width: width,
        height: height,
        fit: fit,
        colorFilter: _colorFilter,
        semanticsLabel: semanticLabel,
        placeholderBuilder: _svgPlaceholderBuilder,
      ),
      BaseImageType.svgNetwork => SvgPicture.network(
        source,
        width: width,
        height: height,
        fit: fit,
        colorFilter: _colorFilter,
        semanticsLabel: semanticLabel,
        placeholderBuilder: _svgPlaceholderBuilder,
      ),
    };

    return ClipRRect(borderRadius: borderRadius, child: image);
  }

  ColorFilter? get _colorFilter =>
      color == null ? null : ColorFilter.mode(color!, BlendMode.srcIn);

  WidgetBuilder? get _svgPlaceholderBuilder =>
      placeholder == null ? null : (_) => placeholder!;

  Widget _frameBuilder(
    BuildContext context,
    Widget child,
    int? frame,
    bool wasSynchronouslyLoaded,
  ) {
    if (wasSynchronouslyLoaded || frame != null) return child;
    return placeholder ?? child;
  }

  Widget _loadingBuilder(
    BuildContext context,
    Widget child,
    ImageChunkEvent? loadingProgress,
  ) {
    if (loadingProgress == null) return child;
    return placeholder ?? child;
  }

  Widget _errorBuilder(
    BuildContext context,
    Object error,
    StackTrace? stackTrace,
  ) {
    return errorWidget ??
        SizedBox(
          width: width,
          height: height,
          child: const Icon(
            Icons.broken_image_outlined,
            color: AppColors.textMuted,
          ),
        );
  }
}
