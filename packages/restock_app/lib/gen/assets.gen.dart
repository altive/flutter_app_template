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

class $EnvGen {
  const $EnvGen();

  /// File path: env/.env.sample
  String get env => 'env/.env.sample';

  /// File path: env/development.env
  String get development => 'env/development.env';

  /// File path: env/production.env
  String get production => 'env/production.env';
}

class $AssetsAppIconsGen {
  const $AssetsAppIconsGen();

  /// File path: assets/app_icons/Icon-development.png
  AssetGenImage get iconDevelopment =>
      const AssetGenImage('assets/app_icons/Icon-development.png');

  /// File path: assets/app_icons/Icon-staging.png
  AssetGenImage get iconStaging =>
      const AssetGenImage('assets/app_icons/Icon-staging.png');

  /// File path: assets/app_icons/adaptive-icon-background.png
  AssetGenImage get adaptiveIconBackground =>
      const AssetGenImage('assets/app_icons/adaptive-icon-background.png');

  /// File path: assets/app_icons/adaptive-icon-foreground.png
  AssetGenImage get adaptiveIconForeground =>
      const AssetGenImage('assets/app_icons/adaptive-icon-foreground.png');

  /// File path: assets/app_icons/icon-production.png
  AssetGenImage get iconProduction =>
      const AssetGenImage('assets/app_icons/icon-production.png');

  /// File path: assets/app_icons/icon.png
  AssetGenImage get icon => const AssetGenImage('assets/app_icons/icon.png');
}

class $AssetsImagesGen {
  const $AssetsImagesGen();

  /// File path: assets/images/apple_logo_black.svg
  SvgGenImage get appleLogoBlack =>
      const SvgGenImage('assets/images/apple_logo_black.svg');

  /// File path: assets/images/apple_logo_grey.svg
  SvgGenImage get appleLogoGrey =>
      const SvgGenImage('assets/images/apple_logo_grey.svg');

  /// File path: assets/images/apple_logo_white.svg
  SvgGenImage get appleLogoWhite =>
      const SvgGenImage('assets/images/apple_logo_white.svg');

  /// File path: assets/images/ball_and_cat.png
  AssetGenImage get ballAndCat =>
      const AssetGenImage('assets/images/ball_and_cat.png');

  /// File path: assets/images/basket_and_woman.png
  AssetGenImage get basketAndWoman =>
      const AssetGenImage('assets/images/basket_and_woman.png');

  /// File path: assets/images/box_mountain.png
  AssetGenImage get boxMountain =>
      const AssetGenImage('assets/images/box_mountain.png');

  /// File path: assets/images/cart_and_woman.png
  AssetGenImage get cartAndWoman =>
      const AssetGenImage('assets/images/cart_and_woman.png');

  /// File path: assets/images/google_logo.svg
  SvgGenImage get googleLogo =>
      const SvgGenImage('assets/images/google_logo.svg');

  /// File path: assets/images/no_image_gray.png
  AssetGenImage get noImageGray =>
      const AssetGenImage('assets/images/no_image_gray.png');

  /// File path: assets/images/no_stock_image.png
  AssetGenImage get noStockImage =>
      const AssetGenImage('assets/images/no_stock_image.png');

  /// File path: assets/images/notebook_and_pen.png
  AssetGenImage get notebookAndPen =>
      const AssetGenImage('assets/images/notebook_and_pen.png');

  /// File path: assets/images/notification_image.png
  AssetGenImage get notificationImage =>
      const AssetGenImage('assets/images/notification_image.png');

  /// File path: assets/images/online_meeting.png
  AssetGenImage get onlineMeeting =>
      const AssetGenImage('assets/images/online_meeting.png');

  /// File path: assets/images/reception_featured_dark.png
  AssetGenImage get receptionFeaturedDark =>
      const AssetGenImage('assets/images/reception_featured_dark.png');

  /// File path: assets/images/reception_featured_light.png
  AssetGenImage get receptionFeaturedLight =>
      const AssetGenImage('assets/images/reception_featured_light.png');

  /// File path: assets/images/res_center_facing.png
  AssetGenImage get resCenterFacing =>
      const AssetGenImage('assets/images/res_center_facing.png');

  /// File path: assets/images/tissue_box.png
  AssetGenImage get tissueBox =>
      const AssetGenImage('assets/images/tissue_box.png');

  /// File path: assets/images/toilet_paper.png
  AssetGenImage get toiletPaper =>
      const AssetGenImage('assets/images/toilet_paper.png');
}

class Assets {
  Assets._();

  static const $AssetsAppIconsGen appIcons = $AssetsAppIconsGen();
  static const $AssetsImagesGen images = $AssetsImagesGen();
  static const $EnvGen env = $EnvGen();
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

  String get keyName => _assetName;
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
