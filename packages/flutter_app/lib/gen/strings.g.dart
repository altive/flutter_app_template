/// Generated file. Do not edit.
///
/// Source: lib/i18n
/// To regenerate, run: `dart run slang`
///
/// Locales: 2
/// Strings: 58 (29 per locale)
///
/// Built on 2025-03-24 at 03:00 UTC

// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'package:slang_flutter/slang_flutter.dart';
export 'package:slang_flutter/slang_flutter.dart';

import 'strings_en.g.dart' deferred as l_en;
part 'strings_ja.g.dart';

/// Supported locales.
///
/// Usage:
/// - LocaleSettings.setLocale(AppLocale.ja) // set locale
/// - Locale locale = AppLocale.ja.flutterLocale // get flutter locale from enum
/// - if (LocaleSettings.currentLocale == AppLocale.ja) // locale check
enum AppLocale with BaseAppLocale<AppLocale, Translations> {
  ja(languageCode: 'ja'),
  en(languageCode: 'en');

  const AppLocale({
    required this.languageCode,
    this.scriptCode, // ignore: unused_element, unused_element_parameter
    this.countryCode, // ignore: unused_element, unused_element_parameter
  });

  @override
  final String languageCode;
  @override
  final String? scriptCode;
  @override
  final String? countryCode;

  @override
  Future<Translations> build({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) async {
    switch (this) {
      case AppLocale.ja:
        return TranslationsJa(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.en:
        await l_en.loadLibrary();
        return l_en.TranslationsEn(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
    }
  }

  @override
  Translations buildSync({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) {
    switch (this) {
      case AppLocale.ja:
        return TranslationsJa(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
      case AppLocale.en:
        return l_en.TranslationsEn(
          overrides: overrides,
          cardinalResolver: cardinalResolver,
          ordinalResolver: ordinalResolver,
        );
    }
  }

  /// Gets current instance managed by [LocaleSettings].
  Translations get translations =>
      LocaleSettings.instance.getTranslations(this);
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
    BuildContext context,
  ) => InheritedLocaleData.of<AppLocale, Translations>(context);
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
  LocaleSettings._() : super(utils: AppLocaleUtils.instance, lazy: true);

  static final instance = LocaleSettings._();

  // static aliases (checkout base methods for documentation)
  static AppLocale get currentLocale => instance.currentLocale;
  static Stream<AppLocale> getLocaleStream() => instance.getLocaleStream();
  static Future<AppLocale> setLocale(
    AppLocale locale, {
    bool? listenToDeviceLocale = false,
  }) => instance.setLocale(locale, listenToDeviceLocale: listenToDeviceLocale);
  static Future<AppLocale> setLocaleRaw(
    String rawLocale, {
    bool? listenToDeviceLocale = false,
  }) => instance.setLocaleRaw(
    rawLocale,
    listenToDeviceLocale: listenToDeviceLocale,
  );
  static Future<AppLocale> useDeviceLocale() => instance.useDeviceLocale();
  static Future<void> setPluralResolver({
    String? language,
    AppLocale? locale,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) => instance.setPluralResolver(
    language: language,
    locale: locale,
    cardinalResolver: cardinalResolver,
    ordinalResolver: ordinalResolver,
  );

  // synchronous versions
  static AppLocale setLocaleSync(
    AppLocale locale, {
    bool? listenToDeviceLocale = false,
  }) => instance.setLocaleSync(
    locale,
    listenToDeviceLocale: listenToDeviceLocale,
  );
  static AppLocale setLocaleRawSync(
    String rawLocale, {
    bool? listenToDeviceLocale = false,
  }) => instance.setLocaleRawSync(
    rawLocale,
    listenToDeviceLocale: listenToDeviceLocale,
  );
  static AppLocale useDeviceLocaleSync() => instance.useDeviceLocaleSync();
  static void setPluralResolverSync({
    String? language,
    AppLocale? locale,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
  }) => instance.setPluralResolverSync(
    language: language,
    locale: locale,
    cardinalResolver: cardinalResolver,
    ordinalResolver: ordinalResolver,
  );
}

/// Provides utility functions without any side effects.
class AppLocaleUtils extends BaseAppLocaleUtils<AppLocale, Translations> {
  AppLocaleUtils._()
    : super(baseLocale: AppLocale.ja, locales: AppLocale.values);

  static final instance = AppLocaleUtils._();

  // static aliases (checkout base methods for documentation)
  static AppLocale parse(String rawLocale) => instance.parse(rawLocale);
  static AppLocale parseLocaleParts({
    required String languageCode,
    String? scriptCode,
    String? countryCode,
  }) => instance.parseLocaleParts(
    languageCode: languageCode,
    scriptCode: scriptCode,
    countryCode: countryCode,
  );
  static AppLocale findDeviceLocale() => instance.findDeviceLocale();
  static List<Locale> get supportedLocales => instance.supportedLocales;
  static List<String> get supportedLocalesRaw => instance.supportedLocalesRaw;
}
