import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:util/util.dart';

void main() {
  test('color converter ...', () async {
    const converter = ColorConverter();
    const object = Color(0xFFFF0000);
    final sut = converter.toJson(object);
    expect(sut, 0xFFFF0000);
    expect(Color(sut), isSameColorAs(const Color(0xFFFF0000)));
  });
}
