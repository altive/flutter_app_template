import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

enum DeviceSizeGroup {
  /// iPhone 5s サイズ以下
  smallPhone,

  /// iPhone 6, iPhone X サイズ、
  mediumPhone,

  /// iPhone Plus, iPhone XR, iPhone Max
  largePhone,

  /// iPad mini
  smallTablet,

  /// tablet,
  mediumTablet,

  /// Pro tablet
  largeTablet,
}

extension DeviceSizeGroupExt on DeviceSizeGroup {
  /// 端末の幅サイズで判定して分類を返す
  static DeviceSizeGroup fromWidth(double width) => () {
        if (width <= 320) {
          return DeviceSizeGroup.smallPhone;
        } else if (width <= 375) {
          return DeviceSizeGroup.mediumPhone;
        } else if (width <= 414) {
          return DeviceSizeGroup.largePhone;
        } else if (width <= 768) {
          return DeviceSizeGroup.smallTablet;
        } else if (width <= 834) {
          return DeviceSizeGroup.mediumTablet;
        } else if (width <= 1024) {
          return DeviceSizeGroup.largeTablet;
        }
        return DeviceSizeGroup.largeTablet;
      }();
}

final deviceSizeProvider = Provider.family(
  (ref, MediaQueryData mediaQueryData) => DeviceSizeChecker(
    ref,
    mediaQueryData: mediaQueryData,
  ),
);

class DeviceSizeChecker {
  const DeviceSizeChecker(
    this._ref, {
    required this.mediaQueryData,
  });

  // ignore: unused_field
  final Ref _ref;
  final MediaQueryData mediaQueryData;

  /// 横幅から判定したデバイスの分類を返す
  DeviceSizeGroup get getDeviceSize {
    return DeviceSizeGroupExt.fromWidth(mediaQueryData.size.width);
  }

  bool get isSmallPhone => getDeviceSize == DeviceSizeGroup.smallPhone;
}
