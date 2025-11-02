// dart format width=80

/// GENERATED CODE - DO NOT MODIFY BY HAND
/// *****************************************************
///  FlutterGen
/// *****************************************************

// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: deprecated_member_use,directives_ordering,implicit_dynamic_list_literal,unnecessary_import

import 'package:flutter/widgets.dart';

class $AssetsIconsGen {
  const $AssetsIconsGen();

  /// File path: assets/icons/Search.png
  AssetGenImage get search => const AssetGenImage('assets/icons/Search.png');

  /// File path: assets/icons/arrow_icon.png
  AssetGenImage get arrowIcon =>
      const AssetGenImage('assets/icons/arrow_icon.png');

  /// List of all assets
  List<AssetGenImage> get values => [search, arrowIcon];
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/appLogoImage.png
  AssetGenImage get appLogoImage =>
      const AssetGenImage('assets/images/appLogoImage.png');

  /// File path: assets/images/busniessImage.png
  AssetGenImage get busniessImage =>
      const AssetGenImage('assets/images/busniessImage.png');

  /// File path: assets/images/entertainmentImage.png
  AssetGenImage get entertainmentImage =>
      const AssetGenImage('assets/images/entertainmentImage.png');

  /// File path: assets/images/exmple.png
  AssetGenImage get exmple => const AssetGenImage('assets/images/exmple.png');

  /// File path: assets/images/generalImage.png
  AssetGenImage get generalImage =>
      const AssetGenImage('assets/images/generalImage.png');

  /// File path: assets/images/healthImage.png
  AssetGenImage get healthImage =>
      const AssetGenImage('assets/images/healthImage.png');

  /// File path: assets/images/scienceImage.png
  AssetGenImage get scienceImage =>
      const AssetGenImage('assets/images/scienceImage.png');

  /// File path: assets/images/sportImage.png
  AssetGenImage get sportImage =>
      const AssetGenImage('assets/images/sportImage.png');

  /// File path: assets/images/technologyImage.png
  AssetGenImage get technologyImage =>
      const AssetGenImage('assets/images/technologyImage.png');

  /// List of all assets
  List<AssetGenImage> get values => [
    appLogoImage,
    busniessImage,
    entertainmentImage,
    exmple,
    generalImage,
    healthImage,
    scienceImage,
    sportImage,
    technologyImage,
  ];
}

class Assets {
  const Assets._();

  static const $AssetsIconsGen icons = $AssetsIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
}

class AssetGenImage {
  const AssetGenImage(
    this._assetName, {
    this.size,
    this.flavors = const {},
    this.animation,
  });

  final String _assetName;

  final Size? size;
  final Set<String> flavors;
  final AssetGenImageAnimation? animation;

  Image image({
    Key? key,
    AssetBundle? bundle,
    ImageFrameBuilder? frameBuilder,
    ImageErrorWidgetBuilder? errorBuilder,
    String? semanticLabel,
    bool excludeFromSemantics = false,
    double? scale,
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
    bool gaplessPlayback = true,
    bool isAntiAlias = false,
    String? package,
    FilterQuality filterQuality = FilterQuality.medium,
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

  ImageProvider provider({AssetBundle? bundle, String? package}) {
    return AssetImage(_assetName, bundle: bundle, package: package);
  }

  String get path => _assetName;

  String get keyName => _assetName;
}

class AssetGenImageAnimation {
  const AssetGenImageAnimation({
    required this.isAnimation,
    required this.duration,
    required this.frames,
  });

  final bool isAnimation;
  final Duration duration;
  final int frames;
}
