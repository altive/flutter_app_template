// dart format width=80
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_import, prefer_relative_imports, directives_ordering

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AppGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:widget_catalog/widgets/apple_auth_button.dart'
    as _widget_catalog_widgets_apple_auth_button;
import 'package:widget_catalog/widgets/bubble_border.dart'
    as _widget_catalog_widgets_bubble_border;
import 'package:widget_catalog/widgets/google_auth_button.dart'
    as _widget_catalog_widgets_google_auth_button;
import 'package:widgetbook/widgetbook.dart' as _widgetbook;

final directories = <_widgetbook.WidgetbookNode>[
  _widgetbook.WidgetbookCategory(
    name: 'Interactions',
    children: [
      _widgetbook.WidgetbookFolder(
        name: 'buttons',
        children: [
          _widgetbook.WidgetbookComponent(
            name: 'AppleAuthButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widget_catalog_widgets_apple_auth_button.appleAuthButton,
              ),
            ],
          ),
          _widgetbook.WidgetbookComponent(
            name: 'GoogleAuthButton',
            useCases: [
              _widgetbook.WidgetbookUseCase(
                name: 'Default',
                builder:
                    _widget_catalog_widgets_google_auth_button.googleAuthButton,
              ),
            ],
          ),
        ],
      ),
    ],
  ),
  _widgetbook.WidgetbookFolder(
    name: 'painting',
    children: [
      _widgetbook.WidgetbookComponent(
        name: 'ShapeDecoration',
        useCases: [
          _widgetbook.WidgetbookUseCase(
            name: 'Left',
            builder: _widget_catalog_widgets_bubble_border.leftBubbleBorder,
          ),
          _widgetbook.WidgetbookUseCase(
            name: 'Right',
            builder: _widget_catalog_widgets_bubble_border.rightBubbleBorder,
          ),
        ],
      ),
    ],
  ),
];
