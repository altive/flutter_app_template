///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

part of 'strings.g.dart';

// Path: <root>
typedef TranslationsJa = Translations; // ignore: unused_element
class Translations with BaseTranslations<AppLocale, Translations> {
	/// Returns the current translations of the given [context].
	///
	/// Usage:
	/// final t = Translations.of(context);
	static Translations of(BuildContext context) => InheritedLocaleData.of<AppLocale, Translations>(context).translations;

	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	Translations({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	Translations $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => Translations(meta: meta ?? this.$meta);

	// Translations

	/// ja: 'Flutter App Template'
	String get title => 'Flutter App Template';

	late final TranslationsAccountPageJa accountPage = TranslationsAccountPageJa._(_root);
	late final TranslationsAppInfoJa appInfo = TranslationsAppInfoJa._(_root);
	late final TranslationsAuthorJa author = TranslationsAuthorJa._(_root);
	late final TranslationsButtonJa button = TranslationsButtonJa._(_root);
	late final TranslationsHomePageJa homePage = TranslationsHomePageJa._(_root);
	late final TranslationsPubDevPackagesPageJa pubDevPackagesPage = TranslationsPubDevPackagesPageJa._(_root);
	late final TranslationsNotFoundPageJa notFoundPage = TranslationsNotFoundPageJa._(_root);
	late final TranslationsSettingsPageJa settingsPage = TranslationsSettingsPageJa._(_root);
	late final TranslationsThemeJa theme = TranslationsThemeJa._(_root);
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

	/// ja: 'Altive株式会社'
	String get name => 'Altive株式会社';
}

// Path: button
class TranslationsButtonJa {
	TranslationsButtonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'キャンセル'
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

// Path: pubDevPackagesPage
class TranslationsPubDevPackagesPageJa {
	TranslationsPubDevPackagesPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPubDevPackagesPageAppBarJa appBar = TranslationsPubDevPackagesPageAppBarJa._(_root);
	late final TranslationsPubDevPackagesPageSearchBarJa searchBar = TranslationsPubDevPackagesPageSearchBarJa._(_root);
	late final TranslationsPubDevPackagesPageBodyJa body = TranslationsPubDevPackagesPageBodyJa._(_root);
	late final TranslationsPubDevPackagesPageDialogJa dialog = TranslationsPubDevPackagesPageDialogJa._(_root);
}

// Path: notFoundPage
class TranslationsNotFoundPageJa {
	TranslationsNotFoundPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '404 Not Found'
	String get title => '404 Not Found';

	late final TranslationsNotFoundPageHeaderJa header = TranslationsNotFoundPageHeaderJa._(_root);

	/// ja: 'is not found.'
	String get description => 'is not found.';

	late final TranslationsNotFoundPageBackButtonJa backButton = TranslationsNotFoundPageBackButtonJa._(_root);
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

// Path: accountPage.appBar
class TranslationsAccountPageAppBarJa {
	TranslationsAccountPageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'アカウント'
	String get title => 'アカウント';
}

// Path: appInfo.appBar
class TranslationsAppInfoAppBarJa {
	TranslationsAppInfoAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'アプリ情報'
	String get title => 'アプリ情報';
}

// Path: button.sign
class TranslationsButtonSignJa {
	TranslationsButtonSignJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'サインアウト'
	String get out => 'サインアウト';
}

// Path: homePage.appBar
class TranslationsHomePageAppBarJa {
	TranslationsHomePageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Home'
	String get title => 'Home';
}

// Path: homePage.list
class TranslationsHomePageListJa {
	TranslationsHomePageListJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsHomePageListAppInfoJa appInfo = TranslationsHomePageListAppInfoJa._(_root);

	/// ja: '2倍されたカウント値：'
	String get doubleCount => '2倍されたカウント値：';
}

// Path: pubDevPackagesPage.appBar
class TranslationsPubDevPackagesPageAppBarJa {
	TranslationsPubDevPackagesPageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'Pub.dev パッケージ'
	String get title => 'Pub.dev パッケージ';
}

// Path: pubDevPackagesPage.searchBar
class TranslationsPubDevPackagesPageSearchBarJa {
	TranslationsPubDevPackagesPageSearchBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'パッケージを検索'
	String get hintText => 'パッケージを検索';
}

// Path: pubDevPackagesPage.body
class TranslationsPubDevPackagesPageBodyJa {
	TranslationsPubDevPackagesPageBodyJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'パッケージが見つかりませんでした。'
	String get emptyLabel => 'パッケージが見つかりませんでした。';
}

// Path: pubDevPackagesPage.dialog
class TranslationsPubDevPackagesPageDialogJa {
	TranslationsPubDevPackagesPageDialogJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPubDevPackagesPageDialogContentJa content = TranslationsPubDevPackagesPageDialogContentJa._(_root);
	late final TranslationsPubDevPackagesPageDialogButtonJa button = TranslationsPubDevPackagesPageDialogButtonJa._(_root);
}

// Path: notFoundPage.header
class TranslationsNotFoundPageHeaderJa {
	TranslationsNotFoundPageHeaderJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'ごめんなさい🙏'
	String get label => 'ごめんなさい🙏';
}

// Path: notFoundPage.backButton
class TranslationsNotFoundPageBackButtonJa {
	TranslationsNotFoundPageBackButtonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'is not found.'
	String get label => 'is not found.';
}

// Path: settingsPage.appBar
class TranslationsSettingsPageAppBarJa {
	TranslationsSettingsPageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '設定'
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

// Path: homePage.list.appInfo
class TranslationsHomePageListAppInfoJa {
	TranslationsHomePageListAppInfoJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'アプリ情報'
	String get label => 'アプリ情報';
}

// Path: pubDevPackagesPage.dialog.content
class TranslationsPubDevPackagesPageDialogContentJa {
	TranslationsPubDevPackagesPageDialogContentJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: '最新バージョン :'
	String get version => '最新バージョン :';

	/// ja: '説明 :'
	String get description => '説明 :';
}

// Path: pubDevPackagesPage.dialog.button
class TranslationsPubDevPackagesPageDialogButtonJa {
	TranslationsPubDevPackagesPageDialogButtonJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsPubDevPackagesPageDialogButtonCloseJa close = TranslationsPubDevPackagesPageDialogButtonCloseJa._(_root);
}

// Path: settingsPage.list.themeSelector
class TranslationsSettingsPageListThemeSelectorJa {
	TranslationsSettingsPageListThemeSelectorJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'テーマ選択'
	String get label => 'テーマ選択';
}

// Path: settingsPage.list.account
class TranslationsSettingsPageListAccountJa {
	TranslationsSettingsPageListAccountJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'アカウント'
	String get label => 'アカウント';
}

// Path: theme.mode.title
class TranslationsThemeModeTitleJa {
	TranslationsThemeModeTitleJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'System'
	String get system => 'System';

	/// ja: 'Light theme'
	String get light => 'Light theme';

	/// ja: 'Dark theme'
	String get dark => 'Dark theme';
}

// Path: theme.mode.subtitle
class TranslationsThemeModeSubtitleJa {
	TranslationsThemeModeSubtitleJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'システム設定に従う'
	String get system => 'システム設定に従う';

	/// ja: '明るいテーマ'
	String get light => '明るいテーマ';

	/// ja: '暗いテーマ'
	String get dark => '暗いテーマ';
}

// Path: theme.selection.page
class TranslationsThemeSelectionPageJa {
	TranslationsThemeSelectionPageJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations
	late final TranslationsThemeSelectionPageAppBarJa appBar = TranslationsThemeSelectionPageAppBarJa._(_root);
}

// Path: pubDevPackagesPage.dialog.button.close
class TranslationsPubDevPackagesPageDialogButtonCloseJa {
	TranslationsPubDevPackagesPageDialogButtonCloseJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'とじる'
	String get label => 'とじる';
}

// Path: theme.selection.page.appBar
class TranslationsThemeSelectionPageAppBarJa {
	TranslationsThemeSelectionPageAppBarJa._(this._root);

	final Translations _root; // ignore: unused_field

	// Translations

	/// ja: 'テーマ選択'
	String get title => 'テーマ選択';
}

/// The flat map containing all translations for locale <ja>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on Translations {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'title' => 'Flutter App Template',
			'accountPage.appBar.title' => 'アカウント',
			'appInfo.appBar.title' => 'アプリ情報',
			'author.name' => 'Altive株式会社',
			'button.cancel' => 'キャンセル',
			'button.sign.out' => 'サインアウト',
			'homePage.appBar.title' => 'Home',
			'homePage.list.appInfo.label' => 'アプリ情報',
			'homePage.list.doubleCount' => '2倍されたカウント値：',
			'pubDevPackagesPage.appBar.title' => 'Pub.dev パッケージ',
			'pubDevPackagesPage.searchBar.hintText' => 'パッケージを検索',
			'pubDevPackagesPage.body.emptyLabel' => 'パッケージが見つかりませんでした。',
			'pubDevPackagesPage.dialog.content.version' => '最新バージョン :',
			'pubDevPackagesPage.dialog.content.description' => '説明 :',
			'pubDevPackagesPage.dialog.button.close.label' => 'とじる',
			'notFoundPage.title' => '404 Not Found',
			'notFoundPage.header.label' => 'ごめんなさい🙏',
			'notFoundPage.description' => 'is not found.',
			'notFoundPage.backButton.label' => 'is not found.',
			'settingsPage.appBar.title' => '設定',
			'settingsPage.list.themeSelector.label' => 'テーマ選択',
			'settingsPage.list.account.label' => 'アカウント',
			'theme.mode.title.system' => 'System',
			'theme.mode.title.light' => 'Light theme',
			'theme.mode.title.dark' => 'Dark theme',
			'theme.mode.subtitle.system' => 'システム設定に従う',
			'theme.mode.subtitle.light' => '明るいテーマ',
			'theme.mode.subtitle.dark' => '暗いテーマ',
			'theme.selection.page.appBar.title' => 'テーマ選択',
			_ => null,
		};
	}
}
