// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widget_catalog/widgets/apple_auth_button.dart' as _i2;
import 'package:widget_catalog/widgets/bubble_border.dart' as _i4;
import 'package:widget_catalog/widgets/google_auth_button.dart' as _i3;
import 'package:widgetbook/widgetbook.dart' as _i1;

final directories = <_i1.WidgetbookNode>[
  _i1.WidgetbookCategory(
    name: 'Interactions',
    children: [
      _i1.WidgetbookFolder(
        name: 'buttons',
        children: [
          _i1.WidgetbookLeafComponent(
            name: 'AppleAuthButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i2.appleAuthButton,
            ),
          ),
          _i1.WidgetbookLeafComponent(
            name: 'GoogleAuthButton',
            useCase: _i1.WidgetbookUseCase(
              name: 'Default',
              builder: _i3.googleAuthButton,
            ),
          ),
        ],
      )
    ],
  ),
  _i1.WidgetbookFolder(
    name: 'painting',
    children: [
      _i1.WidgetbookComponent(
        name: 'ShapeDecoration',
        useCases: [
          _i1.WidgetbookUseCase(
            name: 'Left',
            builder: _i4.leftBubbleBorder,
          ),
          _i1.WidgetbookUseCase(
            name: 'Right',
            builder: _i4.rightBubbleBorder,
          ),
        ],
      )
    ],
  ),
];
