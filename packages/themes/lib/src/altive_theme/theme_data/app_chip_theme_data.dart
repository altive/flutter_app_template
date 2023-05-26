import 'package:flutter/material.dart';

ChipThemeData appChipThemeData({
  required ColorScheme colorScheme,
}) {
  return ChipThemeData(
    side: const BorderSide(color: Colors.black12),
    shape: const StadiumBorder(),
    backgroundColor: colorScheme.primary.withOpacity(0.2),
    checkmarkColor: colorScheme.onPrimary,
    selectedColor: colorScheme.primary,
  );
}
