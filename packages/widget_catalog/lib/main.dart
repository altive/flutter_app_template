import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:themes/themes.dart';
import 'package:widgetbook/widgetbook.dart';
import 'package:widgetbook_annotation/widgetbook_annotation.dart';

import 'main.directories.g.dart';

void main() {
  runApp(const MainApp());
}

/// Widget Catalog app.
@App()
class MainApp extends StatelessWidget {
  /// Creates a new instance of [MainApp].
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Widgetbook.material(
      directories: directories,
      lightTheme: lightThemeData,
      darkTheme: darkThemeData,
      addons: [
        MaterialThemeAddon(
          themes: [
            WidgetbookTheme(name: 'Light', data: lightThemeData),
            WidgetbookTheme(name: 'Dark', data: darkThemeData),
          ],
        ),
        TextScaleAddon(
          scales: [1.0, 2.0],
        ),
        LocalizationAddon(
          locales: [
            const Locale('en', 'US'),
            const Locale('ja', 'JP'),
          ],
          localizationsDelegates: [
            DefaultWidgetsLocalizations.delegate,
            DefaultMaterialLocalizations.delegate,
            DefaultCupertinoLocalizations.delegate,
          ],
        ),
        InspectorAddon(enabled: true),
        DeviceFrameAddon(
          initialDevice: Devices.ios.iPhoneSE,
          devices: [
            Devices.ios.iPhoneSE,
            Devices.ios.iPhone13ProMax,
          ],
        ),
        GridAddon(44),
        AlignmentAddon(),
      ],
      appBuilder: (context, child) {
        return Scaffold(
          body: child,
        );
      },
    );
  }
}
