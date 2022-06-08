/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: directives_ordering,unnecessary_import

import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/services.dart';

class $ResourcesGen {
  const $ResourcesGen();

  $ResourcesIconsGen get icons => const $ResourcesIconsGen();
  $ResourcesImagesGen get images => const $ResourcesImagesGen();
}

class $ResourcesIconsGen {
  const $ResourcesIconsGen();

  /// File path: resources/icons/align-left-two.svg
  SvgGenImage get alignLeftTwo =>
      const SvgGenImage('resources/icons/align-left-two.svg');

  /// File path: resources/icons/book.svg
  SvgGenImage get book => const SvgGenImage('resources/icons/book.svg');

  /// File path: resources/icons/like.svg
  SvgGenImage get like => const SvgGenImage('resources/icons/like.svg');

  /// File path: resources/icons/preview-close.svg
  SvgGenImage get previewClose =>
      const SvgGenImage('resources/icons/preview-close.svg');

  /// File path: resources/icons/preview-open.svg
  SvgGenImage get previewOpen =>
      const SvgGenImage('resources/icons/preview-open.svg');

  /// File path: resources/icons/search.svg
  SvgGenImage get search => const SvgGenImage('resources/icons/search.svg');

  /// File path: resources/icons/user.svg
  SvgGenImage get user => const SvgGenImage('resources/icons/user.svg');
}

class $ResourcesImagesGen {
  const $ResourcesImagesGen();

  /// File path: resources/images/Ellipse 5.png
  AssetGenImage get ellipse5 =>
      const AssetGenImage('resources/images/Ellipse 5.png');

  /// File path: resources/images/Search.png
  AssetGenImage get search =>
      const AssetGenImage('resources/images/Search.png');

  /// File path: resources/images/logoBlue.png
  AssetGenImage get logoBlue =>
      const AssetGenImage('resources/images/logoBlue.png');

  /// File path: resources/images/logoOrange.png
  AssetGenImage get logoOrange =>
      const AssetGenImage('resources/images/logoOrange.png');

  /// File path: resources/images/logoWhite.png
  AssetGenImage get logoWhite =>
      const AssetGenImage('resources/images/logoWhite.png');
}

class Assets {
  Assets._();

  static const $ResourcesGen resources = $ResourcesGen();
}

class AssetGenImage {
  const AssetGenImage(this._assetName);

  final String _assetName;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale = 1.0,
    double? width,
    double? height,
    Color? color,
    Animation<double>? opacity,
    BlendMode? colorBlendMode,
    BoxFit? fit,
    AlignmentGeometry alignment = Alignment.center,
    ImageRepeat repeat = ImageRepeat.noRepeat,
    Rect? centerSlice,
    bool matchTextDirection = false,
    bool gaplessPlayback = false,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.low,
    int? cacheWidth,
    int? cacheHeight,
  }) {
    return Image.asset(
      _assetName,
      key: key,
      bundle: bundle,
      frameBuilder: frameBuilder,
      errorBuilder: errorBuilder,
      semanticLabel: semanticLabel,
      excludeFromSemantics: excludeFromSemantics,
      scale: scale,
      width: width,
      height: height,
      color: color,
      opacity: opacity,
      colorBlendMode: colorBlendMode,
      fit: fit,
      alignment: alignment,
      repeat: repeat,
      centerSlice: centerSlice,
      matchTextDirection: matchTextDirection,
      gaplessPlayback: gaplessPlayback,
      isAntiAlias: isAntiAlias,
      package: package,
      filterQuality: filterQuality,
      cacheWidth: cacheWidth,
      cacheHeight: cacheHeight,
    );
  }

  String get path => _assetName;
}

class SvgGenImage {
  const SvgGenImage(this._assetName);

  final String _assetName;

  SvgPicture svg({
    Key? key,
    bool matchTextDirection = false,
    AssetBundle? bundle,
    String? package,
    double? width,
    double? height,
    BoxFit fit = BoxFit.contain,
    AlignmentGeometry alignment = Alignment.center,
    bool allowDrawingOutsideViewBox = false,
    WidgetBuilder? placeholderBuilder,
    Color? color,
    BlendMode colorBlendMode = BlendMode.srcIn,
    String? semanticsLabel,
    bool excludeFromSemantics = false,
    Clip clipBehavior = Clip.hardEdge,
    bool cacheColorFilter = false,
    SvgTheme? theme,
  }) {
    return SvgPicture.asset(
      _assetName,
      key: key,
      matchTextDirection: matchTextDirection,
      bundle: bundle,
      package: package,
      width: width,
      height: height,
      fit: fit,
      alignment: alignment,
      allowDrawingOutsideViewBox: allowDrawingOutsideViewBox,
      placeholderBuilder: placeholderBuilder,
      color: color,
      colorBlendMode: colorBlendMode,
      semanticsLabel: semanticsLabel,
      excludeFromSemantics: excludeFromSemantics,
      clipBehavior: clipBehavior,
      cacheColorFilter: cacheColorFilter,
      theme: theme,
    );
  }

  String get path => _assetName;
}
