import 'package:flutter_local_notifications_platform_interface/flutter_local_notifications_platform_interface.dart';
import 'package:mockito/mockito.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockFlutterLocalNotificationPlugin extends Mock
    with
        // ignore: prefer_mixin
        MockPlatformInterfaceMixin
    implements
        FlutterLocalNotificationsPlatform {}
