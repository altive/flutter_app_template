import 'dart:async';

import 'package:configurator/src/config.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Config', () {
    test('should initialize with correct value', () async {
      final controller = StreamController<void>();
      addTearDown(controller.close);
      final config = Config<int>(
        value: 10,
        subscription: controller.stream.listen((event) {}),
      );
      addTearDown(config.dispose);

      expect(config.value, 10);
    });

    test('should update value when stream emits', () async {
      final controller = StreamController<int>();
      addTearDown(controller.close);
      var value = 10;
      Config<int>(
        value: value,
        subscription: controller.stream.listen((event) {
          value = event;
        }),
      );

      controller.add(20);

      await pumpEventQueue();

      expect(value, 20);
    });

    test('should close subscription when dispose is called', () async {
      final controller = StreamController<int>();
      addTearDown(controller.close);
      var value = 10;
      final config = Config<int>(
        value: 10,
        subscription: controller.stream.listen((event) {
          value = event;
        }),
      );

      controller.add(20);
      await pumpEventQueue();
      expect(value, 20);

      await config.dispose();

      controller.add(30);
      await pumpEventQueue();
      expect(value, 20);
    });
  });
}
