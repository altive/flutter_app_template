import 'package:flutter/widgets.dart';

extension StringExtension on String {
  /// Counts each emoji as one character, and if the string length is equal to
  /// or greater than [maxLength], truncates at [maxLength] and appends `...`.
  String trimAtMaxLength(int maxLength) {
    return characters.length > maxLength
        ? '${characters.getRange(0, maxLength - 1)}...'
        : this;
  }
}
