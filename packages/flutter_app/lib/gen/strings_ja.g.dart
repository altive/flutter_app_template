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
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.ja,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <ja>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	dynamic operator[](String key) => $meta.getTranslation(key);

	late final Translations _root = this; // ignore: unused_field

	// Translations
	String get title => 'Flutter App Template';
	late final TranslationsAccountPageJa accountPage = TranslationsAccountPageJa._(_root);
	late final TranslationsAppInfoJa appInfo = TranslationsAppInfoJa._(_root);
	late final TranslationsAuthorJa author = TranslationsAuthorJa._(_root);
	late final TranslationsButtonJa button = TranslationsButtonJa._(_root);
	late final TranslationsHomePageJa homePage = TranslationsHomePageJa._(_root);
	late final TranslationsNotFoundPageJa notFoundPage = TranslationsNotFoundPageJa._(_root);
	late final TranslationsPinkieMewPageJa pinkieMewPage = TranslationsPinkieMewPageJa._(_root);
	late final TranslationsSettingsPageJa settingsPage = TranslationsSettingsPageJa._(_root);
	late final TranslationsThemeJa theme = TranslationsThemeJa._(_root);
	late final TranslationsTopLevelTabJa topLevelTab = TranslationsTopLevelTabJa._(_root);
}

// Path: accountPage
class TranslationsAccountPageJa {
	TranslationsAccountPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAccountPageAppBarJa appBar = TranslationsAccountPageAppBarJa._(_root);
}

// Path: appInfo
class TranslationsAppInfoJa {
	TranslationsAppInfoJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsAppInfoAppBarJa appBar = TranslationsAppInfoAppBarJa._(_root);
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
	late final TranslationsHomePageAppBarJa appBar = TranslationsHomePageAppBarJa._(_root);
	late final TranslationsHomePageListJa list = TranslationsHomePageListJa._(_root);
}

// Path: notFoundPage
class TranslationsNotFoundPageJa {
	TranslationsNotFoundPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => '404 Not Found';
	late final TranslationsNotFoundPageHeaderJa header = TranslationsNotFoundPageHeaderJa._(_root);
	String get description => 'is not found.';
	late final TranslationsNotFoundPageBackButtonJa backButton = TranslationsNotFoundPageBackButtonJa._(_root);
}

// Path: pinkieMewPage
class TranslationsPinkieMewPageJa {
	TranslationsPinkieMewPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get title => 'Pinkie and Mew';
}

// Path: settingsPage
class TranslationsSettingsPageJa {
	TranslationsSettingsPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsSettingsPageAppBarJa appBar = TranslationsSettingsPageAppBarJa._(_root);
	late final TranslationsSettingsPageListJa list = TranslationsSettingsPageListJa._(_root);
}

// Path: theme
class TranslationsThemeJa {
	TranslationsThemeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsThemeModeJa mode = TranslationsThemeModeJa._(_root);
	late final TranslationsThemeSelectionJa selection = TranslationsThemeSelectionJa._(_root);
}

// Path: topLevelTab
class TranslationsTopLevelTabJa {
	TranslationsTopLevelTabJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTopLevelTabHomeJa home = TranslationsTopLevelTabHomeJa._(_root);
	late final TranslationsTopLevelTabRiverpodJa riverpod = TranslationsTopLevelTabRiverpodJa._(_root);
	late final TranslationsTopLevelTabSettingsJa settings = TranslationsTopLevelTabSettingsJa._(_root);
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
	late final TranslationsHomePageListAppInfoJa appInfo = TranslationsHomePageListAppInfoJa._(_root);
	String get doubleCount => '2倍されたカウント値：';
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
	late final TranslationsSettingsPageListThemeSelectorJa themeSelector = TranslationsSettingsPageListThemeSelectorJa._(_root);
	late final TranslationsSettingsPageListAccountJa account = TranslationsSettingsPageListAccountJa._(_root);
}

// Path: theme.mode
class TranslationsThemeModeJa {
	TranslationsThemeModeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsThemeModeTitleJa title = TranslationsThemeModeTitleJa._(_root);
	late final TranslationsThemeModeSubtitleJa subtitle = TranslationsThemeModeSubtitleJa._(_root);
}

// Path: theme.selection
class TranslationsThemeSelectionJa {
	TranslationsThemeSelectionJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsThemeSelectionPageJa page = TranslationsThemeSelectionPageJa._(_root);
}

// Path: topLevelTab.home
class TranslationsTopLevelTabHomeJa {
	TranslationsTopLevelTabHomeJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Home';
}

// Path: topLevelTab.riverpod
class TranslationsTopLevelTabRiverpodJa {
	TranslationsTopLevelTabRiverpodJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsTopLevelTabRiverpodExampleJa example = TranslationsTopLevelTabRiverpodExampleJa._(_root);
}

// Path: topLevelTab.settings
class TranslationsTopLevelTabSettingsJa {
	TranslationsTopLevelTabSettingsJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Settings';
}

// Path: homePage.list.appInfo
class TranslationsHomePageListAppInfoJa {
	TranslationsHomePageListAppInfoJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'アプリ情報';
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
	late final TranslationsThemeSelectionPageAppBarJa appBar = TranslationsThemeSelectionPageAppBarJa._(_root);
}

// Path: topLevelTab.riverpod.example
class TranslationsTopLevelTabRiverpodExampleJa {
	TranslationsTopLevelTabRiverpodExampleJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	String get label => 'Riverpod';
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
			case 'title': return 'Flutter App Template';
			case 'accountPage.appBar.title': return 'アカウント';
			case 'appInfo.appBar.title': return 'アプリ情報';
			case 'author.name': return 'Altive株式会社';
			case 'button.cancel': return 'キャンセル';
			case 'button.sign.out': return 'サインアウト';
			case 'homePage.appBar.title': return 'Home';
			case 'homePage.list.appInfo.label': return 'アプリ情報';
			case 'homePage.list.doubleCount': return '2倍されたカウント値：';
			case 'notFoundPage.title': return '404 Not Found';
			case 'notFoundPage.header.label': return 'ごめんなさい🙏';
			case 'notFoundPage.description': return 'is not found.';
			case 'notFoundPage.backButton.label': return 'is not found.';
			case 'pinkieMewPage.title': return 'Pinkie and Mew';
			case 'settingsPage.appBar.title': return '設定';
			case 'settingsPage.list.themeSelector.label': return 'テーマ選択';
			case 'settingsPage.list.account.label': return 'アカウント';
			case 'theme.mode.title.system': return 'System';
			case 'theme.mode.title.light': return 'Light theme';
			case 'theme.mode.title.dark': return 'Dark theme';
			case 'theme.mode.subtitle.system': return 'システム設定に従う';
			case 'theme.mode.subtitle.light': return '明るいテーマ';
			case 'theme.mode.subtitle.dark': return '暗いテーマ';
			case 'theme.selection.page.appBar.title': return 'テーマ選択';
			case 'topLevelTab.home.label': return 'Home';
			case 'topLevelTab.riverpod.example.label': return 'Riverpod';
			case 'topLevelTab.settings.label': return 'Settings';
			default: return null;
		}
	}
}

