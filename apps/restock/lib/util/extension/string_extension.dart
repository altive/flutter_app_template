import 'package:flutter/widgets.dart';

extension StringExtension on String {
  /// 絵文字1つを1文字としてカウントし、[maxLength]以上の文字列長の場合は、
  /// [maxLength]で切り詰めてから `...` を付与して返す。
  String trimAtMaxLength(int maxLength) {
    return characters.length > maxLength
        ? '${characters.getRange(0, maxLength - 1)}...'
        : this;
  }
}
