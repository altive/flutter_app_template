/// Generated file. Do not edit.
///
/// Original: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 52 (26 per locale)
///
/// Built on 2023-12-12 at 06:26 UTC

// coverage:ignore-file
// ignore_for_file: type=lint

import 'package:flutter/widgets.dart';
import 'package:slang/builder/model/node.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

const AppLocale _baseLocale = AppLocale.ja;

/// Supported locales, see extension methods below.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  ja(languageCode: 'ja', build: Translations.build),
  en(languageCode: 'en', build: _StringsEn.build);

  const AppLocale(
      {required this.languageCode,
      this.scriptCode,
      this.countryCode,
      required this.build}); // ignore: unused_element

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;
  @override
  final TranslationBuilder<AppLocale, Translations> build;

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.translationMap[this]!;
}

/// Method A: Simple
///
/// No rebuild after locale change.
/// Translation happens during initialization of the widget (call of t).
/// Configurable via 'translate_var'.
///
/// Usage:
/// String a = t.someKey.anotherKey;
/// String b = t['someKey.anotherKey']; // Only for edge cases!
Translations get t => LocaleSettings.instance.currentTranslations;

/// Method B: Advanced
///
/// All widgets using this method will trigger a rebuild when locale changes.
/// Use this if you have e.g. a settings page where the user can select the locale during runtime.
///
/// Step 1:
/// wrap your App with
/// TranslationProvider(
/// 	child: MyApp()
/// );
///
/// Step 2:
/// final t = Translations.of(context); // Get t variable.
/// String a = t.someKey.anotherKey; // Use t variable.
/// String b = t['someKey.anotherKey']; // Only for edge cases!
class TranslationProvider
    extends BaseTranslationProvider<AppLocale, Translations> {
  TranslationProvider({required super.child})
      : super(settings: LocaleSettings.instance);

  static InheritedLocaleData<AppLocale, Translations> of(
          BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context);
}

/// Method B shorthand via [BuildContext] extension method.
/// Configurable via 'translate_var'.
///
/// Usage (e.g. in a widget's build method):
/// context.t.someKey.anotherKey
extension BuildContextTranslationsExtension on BuildContext {
  Translations get t => TranslationProvider.of(this).translations;
}

/// Manages all translation instances and the current locale
class LocaleSettings
    extends BaseFlutterLocaleSettings<AppLocale, Translations> {
  LocaleSettings._() : super(utils: AppLocaleUtils.instance);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static AppLocale setLocale(AppLocale locale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale setLocaleRaw(String rawLocale,
          {bool? listenToDeviceLocale = false}) =>
      instance.setLocaleRaw(rawLocale,
          listenToDeviceLocale: listenToDeviceLocale);
  static AppLocale useDeviceLocale() => instance.useDeviceLocale();
  @Deprecated('Use [AppLocaleUtils.supportedLocales]')
  static List<Locale> get supportedLocales => instance.supportedLocales;
  @Deprecated('Use [AppLocaleUtils.supportedLocalesRaw]')
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
  static void setPluralResolver(
          {String? language,
          AppLocale? locale,
          PluralResolver? cardinalResolver,
          PluralResolver? ordinalResolver}) =>
      instance.setPluralResolver(
        language: language,
        locale: locale,
        cardinalResolver: cardinalResolver,
        ordinalResolver: ordinalResolver,
      );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
      : super(baseLocale: _baseLocale, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts(
          {required String languageCode,
          String? scriptCode,
          String? countryCode}) =>
      instance.parseLocaleParts(
          languageCode: languageCode,
          scriptCode: scriptCode,
          countryCode: countryCode);
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}

// translations

// Path: <root>
class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.ja,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <ja>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  dynamic operator [](String key) => $meta.getTranslation(key);

  late final Translations _root = this; // ignore: unused_field

  // Translations
  String get title => 'Flutter App Template';
  late final _StringsAccountJa account = _StringsAccountJa._(_root);
  late final _StringsAppJa app = _StringsAppJa._(_root);
  late final _StringsAuthorJa author = _StringsAuthorJa._(_root);
  late final _StringsButtonJa button = _StringsButtonJa._(_root);
  late final _StringsHomeJa home = _StringsHomeJa._(_root);
  late final _StringsNotJa not = _StringsNotJa._(_root);
  late final _StringsPinkieJa pinkie = _StringsPinkieJa._(_root);
  late final _StringsSettingsJa settings = _StringsSettingsJa._(_root);
  late final _StringsThemeJa theme = _StringsThemeJa._(_root);
  late final _StringsTopJa top = _StringsTopJa._(_root);
}

// Path: account
class _StringsAccountJa {
  _StringsAccountJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsAccountPageJa page = _StringsAccountPageJa._(_root);
}

// Path: app
class _StringsAppJa {
  _StringsAppJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsAppInfoJa info = _StringsAppInfoJa._(_root);
}

// Path: author
class _StringsAuthorJa {
  _StringsAuthorJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get name => 'Altive株式会社';
}

// Path: button
class _StringsButtonJa {
  _StringsButtonJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get cancel => 'キャンセル';
  late final _StringsButtonSignJa sign = _StringsButtonSignJa._(_root);
}

// Path: home
class _StringsHomeJa {
  _StringsHomeJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsHomePageJa page = _StringsHomePageJa._(_root);
}

// Path: not
class _StringsNotJa {
  _StringsNotJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsNotFoundJa found = _StringsNotFoundJa._(_root);
}

// Path: pinkie
class _StringsPinkieJa {
  _StringsPinkieJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsPinkieMewJa mew = _StringsPinkieMewJa._(_root);
}

// Path: settings
class _StringsSettingsJa {
  _StringsSettingsJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsPageJa page = _StringsSettingsPageJa._(_root);
}

// Path: theme
class _StringsThemeJa {
  _StringsThemeJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsThemeModeJa mode = _StringsThemeModeJa._(_root);
  late final _StringsThemeSelectionJa selection =
      _StringsThemeSelectionJa._(_root);
}

// Path: top
class _StringsTopJa {
  _StringsTopJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsTopLevelJa level = _StringsTopLevelJa._(_root);
}

// Path: account.page
class _StringsAccountPageJa {
  _StringsAccountPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsAccountPageAppJa app = _StringsAccountPageAppJa._(_root);
}

// Path: app.info
class _StringsAppInfoJa {
  _StringsAppInfoJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsAppInfoAppJa app = _StringsAppInfoAppJa._(_root);
}

// Path: button.sign
class _StringsButtonSignJa {
  _StringsButtonSignJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get out => 'サインアウト';
}

// Path: home.page
class _StringsHomePageJa {
  _StringsHomePageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsHomePageAppJa app = _StringsHomePageAppJa._(_root);
  late final _StringsHomePageListJa list = _StringsHomePageListJa._(_root);
}

// Path: not.found
class _StringsNotFoundJa {
  _StringsNotFoundJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsNotFoundPageJa page = _StringsNotFoundPageJa._(_root);
}

// Path: pinkie.mew
class _StringsPinkieMewJa {
  _StringsPinkieMewJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsPinkieMewPageJa page = _StringsPinkieMewPageJa._(_root);
}

// Path: settings.page
class _StringsSettingsPageJa {
  _StringsSettingsPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsPageAppJa app = _StringsSettingsPageAppJa._(_root);
  late final _StringsSettingsPageListJa list =
      _StringsSettingsPageListJa._(_root);
}

// Path: theme.mode
class _StringsThemeModeJa {
  _StringsThemeModeJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsThemeModeTitleJa title = _StringsThemeModeTitleJa._(_root);
  late final _StringsThemeModeSubtitleJa subtitle =
      _StringsThemeModeSubtitleJa._(_root);
}

// Path: theme.selection
class _StringsThemeSelectionJa {
  _StringsThemeSelectionJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsThemeSelectionPageJa page =
      _StringsThemeSelectionPageJa._(_root);
}

// Path: top.level
class _StringsTopLevelJa {
  _StringsTopLevelJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsTopLevelTabJa tab = _StringsTopLevelTabJa._(_root);
}

// Path: account.page.app
class _StringsAccountPageAppJa {
  _StringsAccountPageAppJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsAccountPageAppBarJa bar =
      _StringsAccountPageAppBarJa._(_root);
}

// Path: app.info.app
class _StringsAppInfoAppJa {
  _StringsAppInfoAppJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsAppInfoAppBarJa bar = _StringsAppInfoAppBarJa._(_root);
}

// Path: home.page.app
class _StringsHomePageAppJa {
  _StringsHomePageAppJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsHomePageAppBarJa bar = _StringsHomePageAppBarJa._(_root);
}

// Path: home.page.list
class _StringsHomePageListJa {
  _StringsHomePageListJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsHomePageListAppJa app = _StringsHomePageListAppJa._(_root);
}

// Path: not.found.page
class _StringsNotFoundPageJa {
  _StringsNotFoundPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => '404 Not Found';
  late final _StringsNotFoundPageHeaderJa header =
      _StringsNotFoundPageHeaderJa._(_root);
  String get description => 'is not found.';
  late final _StringsNotFoundPageBackJa back =
      _StringsNotFoundPageBackJa._(_root);
}

// Path: pinkie.mew.page
class _StringsPinkieMewPageJa {
  _StringsPinkieMewPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Pinkie and Mew';
}

// Path: settings.page.app
class _StringsSettingsPageAppJa {
  _StringsSettingsPageAppJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsPageAppBarJa bar =
      _StringsSettingsPageAppBarJa._(_root);
}

// Path: settings.page.list
class _StringsSettingsPageListJa {
  _StringsSettingsPageListJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsPageListThemeJa theme =
      _StringsSettingsPageListThemeJa._(_root);
  late final _StringsSettingsPageListAccountJa account =
      _StringsSettingsPageListAccountJa._(_root);
}

// Path: theme.mode.title
class _StringsThemeModeTitleJa {
  _StringsThemeModeTitleJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get system => 'System';
  String get light => 'Light theme';
  String get dark => 'Dark theme';
}

// Path: theme.mode.subtitle
class _StringsThemeModeSubtitleJa {
  _StringsThemeModeSubtitleJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get system => 'システム設定に従う';
  String get light => '明るいテーマ';
  String get dark => '暗いテーマ';
}

// Path: theme.selection.page
class _StringsThemeSelectionPageJa {
  _StringsThemeSelectionPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsThemeSelectionPageAppJa app =
      _StringsThemeSelectionPageAppJa._(_root);
}

// Path: top.level.tab
class _StringsTopLevelTabJa {
  _StringsTopLevelTabJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsTopLevelTabHomeJa home =
      _StringsTopLevelTabHomeJa._(_root);
  late final _StringsTopLevelTabRiverpodJa riverpod =
      _StringsTopLevelTabRiverpodJa._(_root);
  late final _StringsTopLevelTabSettingsJa settings =
      _StringsTopLevelTabSettingsJa._(_root);
}

// Path: account.page.app.bar
class _StringsAccountPageAppBarJa {
  _StringsAccountPageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'アカウント';
}

// Path: app.info.app.bar
class _StringsAppInfoAppBarJa {
  _StringsAppInfoAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'アプリ情報';
}

// Path: home.page.app.bar
class _StringsHomePageAppBarJa {
  _StringsHomePageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Home';
}

// Path: home.page.list.app
class _StringsHomePageListAppJa {
  _StringsHomePageListAppJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsHomePageListAppInfoJa info =
      _StringsHomePageListAppInfoJa._(_root);
}

// Path: not.found.page.header
class _StringsNotFoundPageHeaderJa {
  _StringsNotFoundPageHeaderJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'ごめんなさい🙏';
}

// Path: not.found.page.back
class _StringsNotFoundPageBackJa {
  _StringsNotFoundPageBackJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsNotFoundPageBackButtonJa button =
      _StringsNotFoundPageBackButtonJa._(_root);
}

// Path: settings.page.app.bar
class _StringsSettingsPageAppBarJa {
  _StringsSettingsPageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => '設定';
}

// Path: settings.page.list.theme
class _StringsSettingsPageListThemeJa {
  _StringsSettingsPageListThemeJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsSettingsPageListThemeSelectorJa selector =
      _StringsSettingsPageListThemeSelectorJa._(_root);
}

// Path: settings.page.list.account
class _StringsSettingsPageListAccountJa {
  _StringsSettingsPageListAccountJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'アカウント';
}

// Path: theme.selection.page.app
class _StringsThemeSelectionPageAppJa {
  _StringsThemeSelectionPageAppJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsThemeSelectionPageAppBarJa bar =
      _StringsThemeSelectionPageAppBarJa._(_root);
}

// Path: top.level.tab.home
class _StringsTopLevelTabHomeJa {
  _StringsTopLevelTabHomeJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'Home';
}

// Path: top.level.tab.riverpod
class _StringsTopLevelTabRiverpodJa {
  _StringsTopLevelTabRiverpodJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final _StringsTopLevelTabRiverpodExampleJa example =
      _StringsTopLevelTabRiverpodExampleJa._(_root);
}

// Path: top.level.tab.settings
class _StringsTopLevelTabSettingsJa {
  _StringsTopLevelTabSettingsJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'Setting';
}

// Path: home.page.list.app.info
class _StringsHomePageListAppInfoJa {
  _StringsHomePageListAppInfoJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'アプリ情報';
}

// Path: not.found.page.back.button
class _StringsNotFoundPageBackButtonJa {
  _StringsNotFoundPageBackButtonJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'is not found.';
}

// Path: settings.page.list.theme.selector
class _StringsSettingsPageListThemeSelectorJa {
  _StringsSettingsPageListThemeSelectorJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'テーマ選択';
}

// Path: theme.selection.page.app.bar
class _StringsThemeSelectionPageAppBarJa {
  _StringsThemeSelectionPageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'テーマ選択';
}

// Path: top.level.tab.riverpod.example
class _StringsTopLevelTabRiverpodExampleJa {
  _StringsTopLevelTabRiverpodExampleJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'Riverpod';
}

// Path: <root>
class _StringsEn implements Translations {
  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  _StringsEn.build(
      {Map<String, Node>? overrides,
      PluralResolver? cardinalResolver,
      PluralResolver? ordinalResolver})
      : assert(overrides == null,
            'Set "translation_overrides: true" in order to enable this feature.'),
        $meta = TranslationMetadata(
          locale: AppLocale.en,
          overrides: overrides ?? {},
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        ) {
    $meta.setFlatMapFunction(_flatMapFunction);
  }

  /// Metadata for the translations of <en>.
  @override
  final TranslationMetadata<AppLocale, Translations> $meta;

  /// Access flat map
  @override
  dynamic operator [](String key) => $meta.getTranslation(key);

  @override
  late final _StringsEn _root = this; // ignore: unused_field

  // Translations
  @override
  String get title => 'Flutter App Template';
  @override
  late final _StringsAccountEn account = _StringsAccountEn._(_root);
  @override
  late final _StringsAppEn app = _StringsAppEn._(_root);
  @override
  late final _StringsAuthorEn author = _StringsAuthorEn._(_root);
  @override
  late final _StringsButtonEn button = _StringsButtonEn._(_root);
  @override
  late final _StringsHomeEn home = _StringsHomeEn._(_root);
  @override
  late final _StringsNotEn not = _StringsNotEn._(_root);
  @override
  late final _StringsPinkieEn pinkie = _StringsPinkieEn._(_root);
  @override
  late final _StringsSettingsEn settings = _StringsSettingsEn._(_root);
  @override
  late final _StringsThemeEn theme = _StringsThemeEn._(_root);
  @override
  late final _StringsTopEn top = _StringsTopEn._(_root);
}

// Path: account
class _StringsAccountEn implements _StringsAccountJa {
  _StringsAccountEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsAccountPageEn page = _StringsAccountPageEn._(_root);
}

// Path: app
class _StringsAppEn implements _StringsAppJa {
  _StringsAppEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsAppInfoEn info = _StringsAppInfoEn._(_root);
}

// Path: author
class _StringsAuthorEn implements _StringsAuthorJa {
  _StringsAuthorEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get name => 'Altive inc';
}

// Path: button
class _StringsButtonEn implements _StringsButtonJa {
  _StringsButtonEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get cancel => 'Cancel';
  @override
  late final _StringsButtonSignEn sign = _StringsButtonSignEn._(_root);
}

// Path: home
class _StringsHomeEn implements _StringsHomeJa {
  _StringsHomeEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsHomePageEn page = _StringsHomePageEn._(_root);
}

// Path: not
class _StringsNotEn implements _StringsNotJa {
  _StringsNotEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsNotFoundEn found = _StringsNotFoundEn._(_root);
}

// Path: pinkie
class _StringsPinkieEn implements _StringsPinkieJa {
  _StringsPinkieEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsPinkieMewEn mew = _StringsPinkieMewEn._(_root);
}

// Path: settings
class _StringsSettingsEn implements _StringsSettingsJa {
  _StringsSettingsEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsPageEn page = _StringsSettingsPageEn._(_root);
}

// Path: theme
class _StringsThemeEn implements _StringsThemeJa {
  _StringsThemeEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsThemeModeEn mode = _StringsThemeModeEn._(_root);
  @override
  late final _StringsThemeSelectionEn selection =
      _StringsThemeSelectionEn._(_root);
}

// Path: top
class _StringsTopEn implements _StringsTopJa {
  _StringsTopEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsTopLevelEn level = _StringsTopLevelEn._(_root);
}

// Path: account.page
class _StringsAccountPageEn implements _StringsAccountPageJa {
  _StringsAccountPageEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsAccountPageAppEn app = _StringsAccountPageAppEn._(_root);
}

// Path: app.info
class _StringsAppInfoEn implements _StringsAppInfoJa {
  _StringsAppInfoEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsAppInfoAppEn app = _StringsAppInfoAppEn._(_root);
}

// Path: button.sign
class _StringsButtonSignEn implements _StringsButtonSignJa {
  _StringsButtonSignEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get out => 'Sign out';
}

// Path: home.page
class _StringsHomePageEn implements _StringsHomePageJa {
  _StringsHomePageEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsHomePageAppEn app = _StringsHomePageAppEn._(_root);
  @override
  late final _StringsHomePageListEn list = _StringsHomePageListEn._(_root);
}

// Path: not.found
class _StringsNotFoundEn implements _StringsNotFoundJa {
  _StringsNotFoundEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsNotFoundPageEn page = _StringsNotFoundPageEn._(_root);
}

// Path: pinkie.mew
class _StringsPinkieMewEn implements _StringsPinkieMewJa {
  _StringsPinkieMewEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsPinkieMewPageEn page = _StringsPinkieMewPageEn._(_root);
}

// Path: settings.page
class _StringsSettingsPageEn implements _StringsSettingsPageJa {
  _StringsSettingsPageEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsPageAppEn app = _StringsSettingsPageAppEn._(_root);
  @override
  late final _StringsSettingsPageListEn list =
      _StringsSettingsPageListEn._(_root);
}

// Path: theme.mode
class _StringsThemeModeEn implements _StringsThemeModeJa {
  _StringsThemeModeEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsThemeModeTitleEn title = _StringsThemeModeTitleEn._(_root);
  @override
  late final _StringsThemeModeSubtitleEn subtitle =
      _StringsThemeModeSubtitleEn._(_root);
}

// Path: theme.selection
class _StringsThemeSelectionEn implements _StringsThemeSelectionJa {
  _StringsThemeSelectionEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsThemeSelectionPageEn page =
      _StringsThemeSelectionPageEn._(_root);
}

// Path: top.level
class _StringsTopLevelEn implements _StringsTopLevelJa {
  _StringsTopLevelEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsTopLevelTabEn tab = _StringsTopLevelTabEn._(_root);
}

// Path: account.page.app
class _StringsAccountPageAppEn implements _StringsAccountPageAppJa {
  _StringsAccountPageAppEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsAccountPageAppBarEn bar =
      _StringsAccountPageAppBarEn._(_root);
}

// Path: app.info.app
class _StringsAppInfoAppEn implements _StringsAppInfoAppJa {
  _StringsAppInfoAppEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsAppInfoAppBarEn bar = _StringsAppInfoAppBarEn._(_root);
}

// Path: home.page.app
class _StringsHomePageAppEn implements _StringsHomePageAppJa {
  _StringsHomePageAppEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsHomePageAppBarEn bar = _StringsHomePageAppBarEn._(_root);
}

// Path: home.page.list
class _StringsHomePageListEn implements _StringsHomePageListJa {
  _StringsHomePageListEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsHomePageListAppEn app = _StringsHomePageListAppEn._(_root);
}

// Path: not.found.page
class _StringsNotFoundPageEn implements _StringsNotFoundPageJa {
  _StringsNotFoundPageEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => '404 Not Found';
  @override
  late final _StringsNotFoundPageHeaderEn header =
      _StringsNotFoundPageHeaderEn._(_root);
  @override
  String get description => 'is not found.';
  @override
  late final _StringsNotFoundPageBackEn back =
      _StringsNotFoundPageBackEn._(_root);
}

// Path: pinkie.mew.page
class _StringsPinkieMewPageEn implements _StringsPinkieMewPageJa {
  _StringsPinkieMewPageEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Pinkie and Mew';
}

// Path: settings.page.app
class _StringsSettingsPageAppEn implements _StringsSettingsPageAppJa {
  _StringsSettingsPageAppEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsPageAppBarEn bar =
      _StringsSettingsPageAppBarEn._(_root);
}

// Path: settings.page.list
class _StringsSettingsPageListEn implements _StringsSettingsPageListJa {
  _StringsSettingsPageListEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsPageListThemeEn theme =
      _StringsSettingsPageListThemeEn._(_root);
  @override
  late final _StringsSettingsPageListAccountEn account =
      _StringsSettingsPageListAccountEn._(_root);
}

// Path: theme.mode.title
class _StringsThemeModeTitleEn implements _StringsThemeModeTitleJa {
  _StringsThemeModeTitleEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'System';
  @override
  String get light => 'Light theme';
  @override
  String get dark => 'Dark theme';
}

// Path: theme.mode.subtitle
class _StringsThemeModeSubtitleEn implements _StringsThemeModeSubtitleJa {
  _StringsThemeModeSubtitleEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get system => 'Follows the system settings of the device';
  @override
  String get light => 'Light';
  @override
  String get dark => 'Dark';
}

// Path: theme.selection.page
class _StringsThemeSelectionPageEn implements _StringsThemeSelectionPageJa {
  _StringsThemeSelectionPageEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsThemeSelectionPageAppEn app =
      _StringsThemeSelectionPageAppEn._(_root);
}

// Path: top.level.tab
class _StringsTopLevelTabEn implements _StringsTopLevelTabJa {
  _StringsTopLevelTabEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsTopLevelTabHomeEn home =
      _StringsTopLevelTabHomeEn._(_root);
  @override
  late final _StringsTopLevelTabRiverpodEn riverpod =
      _StringsTopLevelTabRiverpodEn._(_root);
  @override
  late final _StringsTopLevelTabSettingsEn settings =
      _StringsTopLevelTabSettingsEn._(_root);
}

// Path: account.page.app.bar
class _StringsAccountPageAppBarEn implements _StringsAccountPageAppBarJa {
  _StringsAccountPageAppBarEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Account';
}

// Path: app.info.app.bar
class _StringsAppInfoAppBarEn implements _StringsAppInfoAppBarJa {
  _StringsAppInfoAppBarEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'App information';
}

// Path: home.page.app.bar
class _StringsHomePageAppBarEn implements _StringsHomePageAppBarJa {
  _StringsHomePageAppBarEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Home';
}

// Path: home.page.list.app
class _StringsHomePageListAppEn implements _StringsHomePageListAppJa {
  _StringsHomePageListAppEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsHomePageListAppInfoEn info =
      _StringsHomePageListAppInfoEn._(_root);
}

// Path: not.found.page.header
class _StringsNotFoundPageHeaderEn implements _StringsNotFoundPageHeaderJa {
  _StringsNotFoundPageHeaderEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Sorry...';
}

// Path: not.found.page.back
class _StringsNotFoundPageBackEn implements _StringsNotFoundPageBackJa {
  _StringsNotFoundPageBackEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsNotFoundPageBackButtonEn button =
      _StringsNotFoundPageBackButtonEn._(_root);
}

// Path: settings.page.app.bar
class _StringsSettingsPageAppBarEn implements _StringsSettingsPageAppBarJa {
  _StringsSettingsPageAppBarEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Settings';
}

// Path: settings.page.list.theme
class _StringsSettingsPageListThemeEn
    implements _StringsSettingsPageListThemeJa {
  _StringsSettingsPageListThemeEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsSettingsPageListThemeSelectorEn selector =
      _StringsSettingsPageListThemeSelectorEn._(_root);
}

// Path: settings.page.list.account
class _StringsSettingsPageListAccountEn
    implements _StringsSettingsPageListAccountJa {
  _StringsSettingsPageListAccountEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Account';
}

// Path: theme.selection.page.app
class _StringsThemeSelectionPageAppEn
    implements _StringsThemeSelectionPageAppJa {
  _StringsThemeSelectionPageAppEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsThemeSelectionPageAppBarEn bar =
      _StringsThemeSelectionPageAppBarEn._(_root);
}

// Path: top.level.tab.home
class _StringsTopLevelTabHomeEn implements _StringsTopLevelTabHomeJa {
  _StringsTopLevelTabHomeEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Home';
}

// Path: top.level.tab.riverpod
class _StringsTopLevelTabRiverpodEn implements _StringsTopLevelTabRiverpodJa {
  _StringsTopLevelTabRiverpodEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  late final _StringsTopLevelTabRiverpodExampleEn example =
      _StringsTopLevelTabRiverpodExampleEn._(_root);
}

// Path: top.level.tab.settings
class _StringsTopLevelTabSettingsEn implements _StringsTopLevelTabSettingsJa {
  _StringsTopLevelTabSettingsEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Settings';
}

// Path: home.page.list.app.info
class _StringsHomePageListAppInfoEn implements _StringsHomePageListAppInfoJa {
  _StringsHomePageListAppInfoEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'App Info';
}

// Path: not.found.page.back.button
class _StringsNotFoundPageBackButtonEn
    implements _StringsNotFoundPageBackButtonJa {
  _StringsNotFoundPageBackButtonEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'is not found.';
}

// Path: settings.page.list.theme.selector
class _StringsSettingsPageListThemeSelectorEn
    implements _StringsSettingsPageListThemeSelectorJa {
  _StringsSettingsPageListThemeSelectorEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Theme Selector';
}

// Path: theme.selection.page.app.bar
class _StringsThemeSelectionPageAppBarEn
    implements _StringsThemeSelectionPageAppBarJa {
  _StringsThemeSelectionPageAppBarEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get title => 'Theme Selector';
}

// Path: top.level.tab.riverpod.example
class _StringsTopLevelTabRiverpodExampleEn
    implements _StringsTopLevelTabRiverpodExampleJa {
  _StringsTopLevelTabRiverpodExampleEn._(this._root);

  @override
  final _StringsEn _root; // ignore: unused_field

  // Translations
  @override
  String get label => 'Riverpod';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.

extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'title':
        return 'Flutter App Template';
      case 'account.page.app.bar.title':
        return 'アカウント';
      case 'app.info.app.bar.title':
        return 'アプリ情報';
      case 'author.name':
        return 'Altive株式会社';
      case 'button.cancel':
        return 'キャンセル';
      case 'button.sign.out':
        return 'サインアウト';
      case 'home.page.app.bar.title':
        return 'Home';
      case 'home.page.list.app.info.label':
        return 'アプリ情報';
      case 'not.found.page.title':
        return '404 Not Found';
      case 'not.found.page.header.label':
        return 'ごめんなさい🙏';
      case 'not.found.page.description':
        return 'is not found.';
      case 'not.found.page.back.button.label':
        return 'is not found.';
      case 'pinkie.mew.page.title':
        return 'Pinkie and Mew';
      case 'settings.page.app.bar.title':
        return '設定';
      case 'settings.page.list.theme.selector.label':
        return 'テーマ選択';
      case 'settings.page.list.account.label':
        return 'アカウント';
      case 'theme.mode.title.system':
        return 'System';
      case 'theme.mode.title.light':
        return 'Light theme';
      case 'theme.mode.title.dark':
        return 'Dark theme';
      case 'theme.mode.subtitle.system':
        return 'システム設定に従う';
      case 'theme.mode.subtitle.light':
        return '明るいテーマ';
      case 'theme.mode.subtitle.dark':
        return '暗いテーマ';
      case 'theme.selection.page.app.bar.title':
        return 'テーマ選択';
      case 'top.level.tab.home.label':
        return 'Home';
      case 'top.level.tab.riverpod.example.label':
        return 'Riverpod';
      case 'top.level.tab.settings.label':
        return 'Setting';
      default:
        return null;
    }
  }
}

extension on _StringsEn {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'title':
        return 'Flutter App Template';
      case 'account.page.app.bar.title':
        return 'Account';
      case 'app.info.app.bar.title':
        return 'App information';
      case 'author.name':
        return 'Altive inc';
      case 'button.cancel':
        return 'Cancel';
      case 'button.sign.out':
        return 'Sign out';
      case 'home.page.app.bar.title':
        return 'Home';
      case 'home.page.list.app.info.label':
        return 'App Info';
      case 'not.found.page.title':
        return '404 Not Found';
      case 'not.found.page.header.label':
        return 'Sorry...';
      case 'not.found.page.description':
        return 'is not found.';
      case 'not.found.page.back.button.label':
        return 'is not found.';
      case 'pinkie.mew.page.title':
        return 'Pinkie and Mew';
      case 'settings.page.app.bar.title':
        return 'Settings';
      case 'settings.page.list.theme.selector.label':
        return 'Theme Selector';
      case 'settings.page.list.account.label':
        return 'Account';
      case 'theme.mode.title.system':
        return 'System';
      case 'theme.mode.title.light':
        return 'Light theme';
      case 'theme.mode.title.dark':
        return 'Dark theme';
      case 'theme.mode.subtitle.system':
        return 'Follows the system settings of the device';
      case 'theme.mode.subtitle.light':
        return 'Light';
      case 'theme.mode.subtitle.dark':
        return 'Dark';
      case 'theme.selection.page.app.bar.title':
        return 'Theme Selector';
      case 'top.level.tab.home.label':
        return 'Home';
      case 'top.level.tab.riverpod.example.label':
        return 'Riverpod';
      case 'top.level.tab.settings.label':
        return 'Settings';
      default:
        return null;
    }
  }
}
