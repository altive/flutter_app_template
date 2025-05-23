///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element

class Translations implements BaseTranslations<AppLocale, Translations> {
  /// Returns the current translations of the given [context].
  ///
  /// Usage:
  /// final t = Translations.of(context);
  static Translations of(BuildContext context) =>
      InheritedLocaleData.of<AppLocale, Translations>(context).translations;

  /// You can call this constructor and build your own translation instance of this locale.
  /// Constructing via the enum [AppLocale.build] is preferred.
  Translations({
    Map<String, Node>? overrides,
    PluralResolver? cardinalResolver,
    PluralResolver? ordinalResolver,
    TranslationMetadata<AppLocale, Translations>? meta,
  }) : assert(
         overrides == null,
         'Set "translation_overrides: true" in order to enable this feature.',
       ),
       $meta =
           meta ??
           TranslationMetadata(
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

  Translations $copyWith({
    TranslationMetadata<AppLocale, Translations>? meta,
  }) => Translations(meta: meta ?? this.$meta);

  // Translations
  String get title => 'Flutter App Template';
  late final TranslationsAccountPageJa accountPage =
      TranslationsAccountPageJa._(_root);
  late final TranslationsAppInfoJa appInfo = TranslationsAppInfoJa._(_root);
  late final TranslationsAuthorJa author = TranslationsAuthorJa._(_root);
  late final TranslationsButtonJa button = TranslationsButtonJa._(_root);
  late final TranslationsHomePageJa homePage = TranslationsHomePageJa._(_root);
  late final TranslationsPubDevPackagesPageJa pubDevPackagesPage =
      TranslationsPubDevPackagesPageJa._(_root);
  late final TranslationsNotFoundPageJa notFoundPage =
      TranslationsNotFoundPageJa._(_root);
  late final TranslationsSettingsPageJa settingsPage =
      TranslationsSettingsPageJa._(_root);
  late final TranslationsThemeJa theme = TranslationsThemeJa._(_root);
}

// Path: accountPage
class TranslationsAccountPageJa {
  TranslationsAccountPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsAccountPageAppBarJa appBar =
      TranslationsAccountPageAppBarJa._(_root);
}

// Path: appInfo
class TranslationsAppInfoJa {
  TranslationsAppInfoJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsAppInfoAppBarJa appBar = TranslationsAppInfoAppBarJa._(
    _root,
  );
}

// Path: author
class TranslationsAuthorJa {
  TranslationsAuthorJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get name => 'Altive株式会社';
}

// Path: button
class TranslationsButtonJa {
  TranslationsButtonJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get cancel => 'キャンセル';
  late final TranslationsButtonSignJa sign = TranslationsButtonSignJa._(_root);
}

// Path: homePage
class TranslationsHomePageJa {
  TranslationsHomePageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsHomePageAppBarJa appBar =
      TranslationsHomePageAppBarJa._(_root);
  late final TranslationsHomePageListJa list = TranslationsHomePageListJa._(
    _root,
  );
}

// Path: pubDevPackagesPage
class TranslationsPubDevPackagesPageJa {
  TranslationsPubDevPackagesPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsPubDevPackagesPageAppBarJa appBar =
      TranslationsPubDevPackagesPageAppBarJa._(_root);
  late final TranslationsPubDevPackagesPageSearchBarJa searchBar =
      TranslationsPubDevPackagesPageSearchBarJa._(_root);
  late final TranslationsPubDevPackagesPageBodyJa body =
      TranslationsPubDevPackagesPageBodyJa._(_root);
  late final TranslationsPubDevPackagesPageDialogJa dialog =
      TranslationsPubDevPackagesPageDialogJa._(_root);
}

// Path: notFoundPage
class TranslationsNotFoundPageJa {
  TranslationsNotFoundPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => '404 Not Found';
  late final TranslationsNotFoundPageHeaderJa header =
      TranslationsNotFoundPageHeaderJa._(_root);
  String get description => 'is not found.';
  late final TranslationsNotFoundPageBackButtonJa backButton =
      TranslationsNotFoundPageBackButtonJa._(_root);
}

// Path: settingsPage
class TranslationsSettingsPageJa {
  TranslationsSettingsPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsPageAppBarJa appBar =
      TranslationsSettingsPageAppBarJa._(_root);
  late final TranslationsSettingsPageListJa list =
      TranslationsSettingsPageListJa._(_root);
}

// Path: theme
class TranslationsThemeJa {
  TranslationsThemeJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsThemeModeJa mode = TranslationsThemeModeJa._(_root);
  late final TranslationsThemeSelectionJa selection =
      TranslationsThemeSelectionJa._(_root);
}

// Path: accountPage.appBar
class TranslationsAccountPageAppBarJa {
  TranslationsAccountPageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'アカウント';
}

// Path: appInfo.appBar
class TranslationsAppInfoAppBarJa {
  TranslationsAppInfoAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'アプリ情報';
}

// Path: button.sign
class TranslationsButtonSignJa {
  TranslationsButtonSignJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get out => 'サインアウト';
}

// Path: homePage.appBar
class TranslationsHomePageAppBarJa {
  TranslationsHomePageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Home';
}

// Path: homePage.list
class TranslationsHomePageListJa {
  TranslationsHomePageListJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsHomePageListAppInfoJa appInfo =
      TranslationsHomePageListAppInfoJa._(_root);
  String get doubleCount => '2倍されたカウント値：';
}

// Path: pubDevPackagesPage.appBar
class TranslationsPubDevPackagesPageAppBarJa {
  TranslationsPubDevPackagesPageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'Pub.dev パッケージ';
}

// Path: pubDevPackagesPage.searchBar
class TranslationsPubDevPackagesPageSearchBarJa {
  TranslationsPubDevPackagesPageSearchBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get hintText => 'パッケージを検索';
}

// Path: pubDevPackagesPage.body
class TranslationsPubDevPackagesPageBodyJa {
  TranslationsPubDevPackagesPageBodyJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get emptyLabel => 'パッケージが見つかりませんでした。';
}

// Path: pubDevPackagesPage.dialog
class TranslationsPubDevPackagesPageDialogJa {
  TranslationsPubDevPackagesPageDialogJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsPubDevPackagesPageDialogContentJa content =
      TranslationsPubDevPackagesPageDialogContentJa._(_root);
  late final TranslationsPubDevPackagesPageDialogButtonJa button =
      TranslationsPubDevPackagesPageDialogButtonJa._(_root);
}

// Path: notFoundPage.header
class TranslationsNotFoundPageHeaderJa {
  TranslationsNotFoundPageHeaderJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'ごめんなさい🙏';
}

// Path: notFoundPage.backButton
class TranslationsNotFoundPageBackButtonJa {
  TranslationsNotFoundPageBackButtonJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'is not found.';
}

// Path: settingsPage.appBar
class TranslationsSettingsPageAppBarJa {
  TranslationsSettingsPageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => '設定';
}

// Path: settingsPage.list
class TranslationsSettingsPageListJa {
  TranslationsSettingsPageListJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsSettingsPageListThemeSelectorJa themeSelector =
      TranslationsSettingsPageListThemeSelectorJa._(_root);
  late final TranslationsSettingsPageListAccountJa account =
      TranslationsSettingsPageListAccountJa._(_root);
}

// Path: theme.mode
class TranslationsThemeModeJa {
  TranslationsThemeModeJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsThemeModeTitleJa title =
      TranslationsThemeModeTitleJa._(_root);
  late final TranslationsThemeModeSubtitleJa subtitle =
      TranslationsThemeModeSubtitleJa._(_root);
}

// Path: theme.selection
class TranslationsThemeSelectionJa {
  TranslationsThemeSelectionJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsThemeSelectionPageJa page =
      TranslationsThemeSelectionPageJa._(_root);
}

// Path: homePage.list.appInfo
class TranslationsHomePageListAppInfoJa {
  TranslationsHomePageListAppInfoJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'アプリ情報';
}

// Path: pubDevPackagesPage.dialog.content
class TranslationsPubDevPackagesPageDialogContentJa {
  TranslationsPubDevPackagesPageDialogContentJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get version => '最新バージョン :';
  String get description => '説明 :';
}

// Path: pubDevPackagesPage.dialog.button
class TranslationsPubDevPackagesPageDialogButtonJa {
  TranslationsPubDevPackagesPageDialogButtonJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsPubDevPackagesPageDialogButtonCloseJa close =
      TranslationsPubDevPackagesPageDialogButtonCloseJa._(_root);
}

// Path: settingsPage.list.themeSelector
class TranslationsSettingsPageListThemeSelectorJa {
  TranslationsSettingsPageListThemeSelectorJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'テーマ選択';
}

// Path: settingsPage.list.account
class TranslationsSettingsPageListAccountJa {
  TranslationsSettingsPageListAccountJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'アカウント';
}

// Path: theme.mode.title
class TranslationsThemeModeTitleJa {
  TranslationsThemeModeTitleJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get system => 'System';
  String get light => 'Light theme';
  String get dark => 'Dark theme';
}

// Path: theme.mode.subtitle
class TranslationsThemeModeSubtitleJa {
  TranslationsThemeModeSubtitleJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get system => 'システム設定に従う';
  String get light => '明るいテーマ';
  String get dark => '暗いテーマ';
}

// Path: theme.selection.page
class TranslationsThemeSelectionPageJa {
  TranslationsThemeSelectionPageJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  late final TranslationsThemeSelectionPageAppBarJa appBar =
      TranslationsThemeSelectionPageAppBarJa._(_root);
}

// Path: pubDevPackagesPage.dialog.button.close
class TranslationsPubDevPackagesPageDialogButtonCloseJa {
  TranslationsPubDevPackagesPageDialogButtonCloseJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get label => 'とじる';
}

// Path: theme.selection.page.appBar
class TranslationsThemeSelectionPageAppBarJa {
  TranslationsThemeSelectionPageAppBarJa._(this._root);

  final Translations _root; // ignore: unused_field

  // Translations
  String get title => 'テーマ選択';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on Translations {
  dynamic _flatMapFunction(String path) {
    switch (path) {
      case 'title':
        return 'Flutter App Template';
      case 'accountPage.appBar.title':
        return 'アカウント';
      case 'appInfo.appBar.title':
        return 'アプリ情報';
      case 'author.name':
        return 'Altive株式会社';
      case 'button.cancel':
        return 'キャンセル';
      case 'button.sign.out':
        return 'サインアウト';
      case 'homePage.appBar.title':
        return 'Home';
      case 'homePage.list.appInfo.label':
        return 'アプリ情報';
      case 'homePage.list.doubleCount':
        return '2倍されたカウント値：';
      case 'pubDevPackagesPage.appBar.title':
        return 'Pub.dev パッケージ';
      case 'pubDevPackagesPage.searchBar.hintText':
        return 'パッケージを検索';
      case 'pubDevPackagesPage.body.emptyLabel':
        return 'パッケージが見つかりませんでした。';
      case 'pubDevPackagesPage.dialog.content.version':
        return '最新バージョン :';
      case 'pubDevPackagesPage.dialog.content.description':
        return '説明 :';
      case 'pubDevPackagesPage.dialog.button.close.label':
        return 'とじる';
      case 'notFoundPage.title':
        return '404 Not Found';
      case 'notFoundPage.header.label':
        return 'ごめんなさい🙏';
      case 'notFoundPage.description':
        return 'is not found.';
      case 'notFoundPage.backButton.label':
        return 'is not found.';
      case 'settingsPage.appBar.title':
        return '設定';
      case 'settingsPage.list.themeSelector.label':
        return 'テーマ選択';
      case 'settingsPage.list.account.label':
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
      case 'theme.selection.page.appBar.title':
        return 'テーマ選択';
      default:
        return null;
    }
  }
}
