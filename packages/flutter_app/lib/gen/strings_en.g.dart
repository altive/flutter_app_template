///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = TranslationMetadata(
		    locale: AppLocale.en,
		    overrides: overrides ?? {},
		    cardinalResolver: cardinalResolver,
		    ordinalResolver: ordinalResolver,
		  ) {
		$meta.setFlatMapFunction(_flatMapFunction);
	}

	/// Metadata for the translations of <en>.
	@override final TranslationMetadata<AppLocale, Translations> $meta;

	/// Access flat map
	@override dynamic operator[](String key) => $meta.getTranslation(key);

	late final TranslationsEn _root = this; // ignore: unused_field

	// Translations
	@override String get title => 'Flutter App Template';
	@override late final _TranslationsAccountPageEn accountPage = _TranslationsAccountPageEn._(_root);
	@override late final _TranslationsAppInfoEn appInfo = _TranslationsAppInfoEn._(_root);
	@override late final _TranslationsAuthorEn author = _TranslationsAuthorEn._(_root);
	@override late final _TranslationsButtonEn button = _TranslationsButtonEn._(_root);
	@override late final _TranslationsHomePageEn homePage = _TranslationsHomePageEn._(_root);
	@override late final _TranslationsNotFoundPageEn notFoundPage = _TranslationsNotFoundPageEn._(_root);
	@override late final _TranslationsPinkieMewPageEn pinkieMewPage = _TranslationsPinkieMewPageEn._(_root);
	@override late final _TranslationsSettingsPageEn settingsPage = _TranslationsSettingsPageEn._(_root);
	@override late final _TranslationsThemeEn theme = _TranslationsThemeEn._(_root);
	@override late final _TranslationsTopLevelTabEn topLevelTab = _TranslationsTopLevelTabEn._(_root);
}

// Path: accountPage
class _TranslationsAccountPageEn implements TranslationsAccountPageJa {
	_TranslationsAccountPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAccountPageAppBarEn appBar = _TranslationsAccountPageAppBarEn._(_root);
}

// Path: appInfo
class _TranslationsAppInfoEn implements TranslationsAppInfoJa {
	_TranslationsAppInfoEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsAppInfoAppBarEn appBar = _TranslationsAppInfoAppBarEn._(_root);
}

// Path: author
class _TranslationsAuthorEn implements TranslationsAuthorJa {
	_TranslationsAuthorEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get name => 'Altive inc';
}

// Path: button
class _TranslationsButtonEn implements TranslationsButtonJa {
	_TranslationsButtonEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get cancel => 'Cancel';
	@override late final _TranslationsButtonSignEn sign = _TranslationsButtonSignEn._(_root);
}

// Path: homePage
class _TranslationsHomePageEn implements TranslationsHomePageJa {
	_TranslationsHomePageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomePageAppBarEn appBar = _TranslationsHomePageAppBarEn._(_root);
	@override late final _TranslationsHomePageListEn list = _TranslationsHomePageListEn._(_root);
}

// Path: notFoundPage
class _TranslationsNotFoundPageEn implements TranslationsNotFoundPageJa {
	_TranslationsNotFoundPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => '404 Not Found';
	@override late final _TranslationsNotFoundPageHeaderEn header = _TranslationsNotFoundPageHeaderEn._(_root);
	@override String get description => 'is not found.';
	@override late final _TranslationsNotFoundPageBackButtonEn backButton = _TranslationsNotFoundPageBackButtonEn._(_root);
}

// Path: pinkieMewPage
class _TranslationsPinkieMewPageEn implements TranslationsPinkieMewPageJa {
	_TranslationsPinkieMewPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pinkie and Mew';
}

// Path: settingsPage
class _TranslationsSettingsPageEn implements TranslationsSettingsPageJa {
	_TranslationsSettingsPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPageAppBarEn appBar = _TranslationsSettingsPageAppBarEn._(_root);
	@override late final _TranslationsSettingsPageListEn list = _TranslationsSettingsPageListEn._(_root);
}

// Path: theme
class _TranslationsThemeEn implements TranslationsThemeJa {
	_TranslationsThemeEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsThemeModeEn mode = _TranslationsThemeModeEn._(_root);
	@override late final _TranslationsThemeSelectionEn selection = _TranslationsThemeSelectionEn._(_root);
}

// Path: topLevelTab
class _TranslationsTopLevelTabEn implements TranslationsTopLevelTabJa {
	_TranslationsTopLevelTabEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTopLevelTabHomeEn home = _TranslationsTopLevelTabHomeEn._(_root);
	@override late final _TranslationsTopLevelTabRiverpodEn riverpod = _TranslationsTopLevelTabRiverpodEn._(_root);
	@override late final _TranslationsTopLevelTabSettingsEn settings = _TranslationsTopLevelTabSettingsEn._(_root);
}

// Path: accountPage.appBar
class _TranslationsAccountPageAppBarEn implements TranslationsAccountPageAppBarJa {
	_TranslationsAccountPageAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Account';
}

// Path: appInfo.appBar
class _TranslationsAppInfoAppBarEn implements TranslationsAppInfoAppBarJa {
	_TranslationsAppInfoAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'App information';
}

// Path: button.sign
class _TranslationsButtonSignEn implements TranslationsButtonSignJa {
	_TranslationsButtonSignEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get out => 'Sign out';
}

// Path: homePage.appBar
class _TranslationsHomePageAppBarEn implements TranslationsHomePageAppBarJa {
	_TranslationsHomePageAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Home';
}

// Path: homePage.list
class _TranslationsHomePageListEn implements TranslationsHomePageListJa {
	_TranslationsHomePageListEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsHomePageListAppInfoEn appInfo = _TranslationsHomePageListAppInfoEn._(_root);
	@override String get doubleCount => 'The doubled count value :';
}

// Path: notFoundPage.header
class _TranslationsNotFoundPageHeaderEn implements TranslationsNotFoundPageHeaderJa {
	_TranslationsNotFoundPageHeaderEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Sorry...';
}

// Path: notFoundPage.backButton
class _TranslationsNotFoundPageBackButtonEn implements TranslationsNotFoundPageBackButtonJa {
	_TranslationsNotFoundPageBackButtonEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'is not found.';
}

// Path: settingsPage.appBar
class _TranslationsSettingsPageAppBarEn implements TranslationsSettingsPageAppBarJa {
	_TranslationsSettingsPageAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Settings';
}

// Path: settingsPage.list
class _TranslationsSettingsPageListEn implements TranslationsSettingsPageListJa {
	_TranslationsSettingsPageListEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsSettingsPageListThemeSelectorEn themeSelector = _TranslationsSettingsPageListThemeSelectorEn._(_root);
	@override late final _TranslationsSettingsPageListAccountEn account = _TranslationsSettingsPageListAccountEn._(_root);
}

// Path: theme.mode
class _TranslationsThemeModeEn implements TranslationsThemeModeJa {
	_TranslationsThemeModeEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsThemeModeTitleEn title = _TranslationsThemeModeTitleEn._(_root);
	@override late final _TranslationsThemeModeSubtitleEn subtitle = _TranslationsThemeModeSubtitleEn._(_root);
}

// Path: theme.selection
class _TranslationsThemeSelectionEn implements TranslationsThemeSelectionJa {
	_TranslationsThemeSelectionEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsThemeSelectionPageEn page = _TranslationsThemeSelectionPageEn._(_root);
}

// Path: topLevelTab.home
class _TranslationsTopLevelTabHomeEn implements TranslationsTopLevelTabHomeJa {
	_TranslationsTopLevelTabHomeEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Home';
}

// Path: topLevelTab.riverpod
class _TranslationsTopLevelTabRiverpodEn implements TranslationsTopLevelTabRiverpodJa {
	_TranslationsTopLevelTabRiverpodEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsTopLevelTabRiverpodExampleEn example = _TranslationsTopLevelTabRiverpodExampleEn._(_root);
}

// Path: topLevelTab.settings
class _TranslationsTopLevelTabSettingsEn implements TranslationsTopLevelTabSettingsJa {
	_TranslationsTopLevelTabSettingsEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Settings';
}

// Path: homePage.list.appInfo
class _TranslationsHomePageListAppInfoEn implements TranslationsHomePageListAppInfoJa {
	_TranslationsHomePageListAppInfoEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'App Info';
}

// Path: settingsPage.list.themeSelector
class _TranslationsSettingsPageListThemeSelectorEn implements TranslationsSettingsPageListThemeSelectorJa {
	_TranslationsSettingsPageListThemeSelectorEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Theme Selector';
}

// Path: settingsPage.list.account
class _TranslationsSettingsPageListAccountEn implements TranslationsSettingsPageListAccountJa {
	_TranslationsSettingsPageListAccountEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Account';
}

// Path: theme.mode.title
class _TranslationsThemeModeTitleEn implements TranslationsThemeModeTitleJa {
	_TranslationsThemeModeTitleEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get system => 'System';
	@override String get light => 'Light theme';
	@override String get dark => 'Dark theme';
}

// Path: theme.mode.subtitle
class _TranslationsThemeModeSubtitleEn implements TranslationsThemeModeSubtitleJa {
	_TranslationsThemeModeSubtitleEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get system => 'Follows the system settings of the device';
	@override String get light => 'Light';
	@override String get dark => 'Dark';
}

// Path: theme.selection.page
class _TranslationsThemeSelectionPageEn implements TranslationsThemeSelectionPageJa {
	_TranslationsThemeSelectionPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsThemeSelectionPageAppBarEn appBar = _TranslationsThemeSelectionPageAppBarEn._(_root);
}

// Path: topLevelTab.riverpod.example
class _TranslationsTopLevelTabRiverpodExampleEn implements TranslationsTopLevelTabRiverpodExampleJa {
	_TranslationsTopLevelTabRiverpodExampleEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Riverpod';
}

// Path: theme.selection.page.appBar
class _TranslationsThemeSelectionPageAppBarEn implements TranslationsThemeSelectionPageAppBarJa {
	_TranslationsThemeSelectionPageAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Theme Selector';
}

/// Flat map(s) containing all translations.
/// Only for edge cases! For simple maps, use the map function of this library.
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		switch (path) {
			case 'title': return 'Flutter App Template';
			case 'accountPage.appBar.title': return 'Account';
			case 'appInfo.appBar.title': return 'App information';
			case 'author.name': return 'Altive inc';
			case 'button.cancel': return 'Cancel';
			case 'button.sign.out': return 'Sign out';
			case 'homePage.appBar.title': return 'Home';
			case 'homePage.list.appInfo.label': return 'App Info';
			case 'homePage.list.doubleCount': return 'The doubled count value :';
			case 'notFoundPage.title': return '404 Not Found';
			case 'notFoundPage.header.label': return 'Sorry...';
			case 'notFoundPage.description': return 'is not found.';
			case 'notFoundPage.backButton.label': return 'is not found.';
			case 'pinkieMewPage.title': return 'Pinkie and Mew';
			case 'settingsPage.appBar.title': return 'Settings';
			case 'settingsPage.list.themeSelector.label': return 'Theme Selector';
			case 'settingsPage.list.account.label': return 'Account';
			case 'theme.mode.title.system': return 'System';
			case 'theme.mode.title.light': return 'Light theme';
			case 'theme.mode.title.dark': return 'Dark theme';
			case 'theme.mode.subtitle.system': return 'Follows the system settings of the device';
			case 'theme.mode.subtitle.light': return 'Light';
			case 'theme.mode.subtitle.dark': return 'Dark';
			case 'theme.selection.page.appBar.title': return 'Theme Selector';
			case 'topLevelTab.home.label': return 'Home';
			case 'topLevelTab.riverpod.example.label': return 'Riverpod';
			case 'topLevelTab.settings.label': return 'Settings';
			default: return null;
		}
	}
}

