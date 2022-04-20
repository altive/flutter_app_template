import 'dart:ui';

import 'package:flutter/services.dart';
import 'package:share_plus/share_plus.dart';

import 'logger.dart';

/// Shareパッケージでシェアする
void share({
  required String text,
  required Rect sharePositionOrigin,
}) {
  try {
    Share.share(
      text,
      sharePositionOrigin: sharePositionOrigin,
    );
  } on PlatformException catch (exception) {
    logger.warning(exception);
  } on FormatException catch (exception) {
    logger.warning(exception);
  }
}
