///
/// Generated file. Do not edit.
///
// coverage:ignore-file
// ignore_for_file: type=lint, unused_import
// dart format off

import 'package:flutter/widgets.dart';
import 'package:intl/intl.dart';
import 'package:slang/generated.dart';
import 'strings.g.dart';

// Path: <root>
class TranslationsEn with BaseTranslations<AppLocale, Translations> implements Translations {
	/// You can call this constructor and build your own translation instance of this locale.
	/// Constructing via the enum [AppLocale.build] is preferred.
	TranslationsEn({Map<String, Node>? overrides, PluralResolver? cardinalResolver, PluralResolver? ordinalResolver, TranslationMetadata<AppLocale, Translations>? meta})
		: assert(overrides == null, 'Set "translation_overrides: true" in order to enable this feature.'),
		  $meta = meta ?? TranslationMetadata(
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

	@override 
	TranslationsEn $copyWith({TranslationMetadata<AppLocale, Translations>? meta}) => TranslationsEn(meta: meta ?? this.$meta);

	// Translations
	@override String get title => 'Flutter App Template';
	@override late final _TranslationsAccountPageEn accountPage = _TranslationsAccountPageEn._(_root);
	@override late final _TranslationsAppInfoEn appInfo = _TranslationsAppInfoEn._(_root);
	@override late final _TranslationsAuthorEn author = _TranslationsAuthorEn._(_root);
	@override late final _TranslationsButtonEn button = _TranslationsButtonEn._(_root);
	@override late final _TranslationsHomePageEn homePage = _TranslationsHomePageEn._(_root);
	@override late final _TranslationsPubDevPackagesPageEn pubDevPackagesPage = _TranslationsPubDevPackagesPageEn._(_root);
	@override late final _TranslationsNotFoundPageEn notFoundPage = _TranslationsNotFoundPageEn._(_root);
	@override late final _TranslationsSettingsPageEn settingsPage = _TranslationsSettingsPageEn._(_root);
	@override late final _TranslationsThemeEn theme = _TranslationsThemeEn._(_root);
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

// Path: pubDevPackagesPage
class _TranslationsPubDevPackagesPageEn implements TranslationsPubDevPackagesPageJa {
	_TranslationsPubDevPackagesPageEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPubDevPackagesPageAppBarEn appBar = _TranslationsPubDevPackagesPageAppBarEn._(_root);
	@override late final _TranslationsPubDevPackagesPageSearchBarEn searchBar = _TranslationsPubDevPackagesPageSearchBarEn._(_root);
	@override late final _TranslationsPubDevPackagesPageBodyEn body = _TranslationsPubDevPackagesPageBodyEn._(_root);
	@override late final _TranslationsPubDevPackagesPageDialogEn dialog = _TranslationsPubDevPackagesPageDialogEn._(_root);
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

// Path: pubDevPackagesPage.appBar
class _TranslationsPubDevPackagesPageAppBarEn implements TranslationsPubDevPackagesPageAppBarJa {
	_TranslationsPubDevPackagesPageAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Pub.dev Packages';
}

// Path: pubDevPackagesPage.searchBar
class _TranslationsPubDevPackagesPageSearchBarEn implements TranslationsPubDevPackagesPageSearchBarJa {
	_TranslationsPubDevPackagesPageSearchBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get hintText => 'Search packages';
}

// Path: pubDevPackagesPage.body
class _TranslationsPubDevPackagesPageBodyEn implements TranslationsPubDevPackagesPageBodyJa {
	_TranslationsPubDevPackagesPageBodyEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get emptyLabel => 'No packages found.';
}

// Path: pubDevPackagesPage.dialog
class _TranslationsPubDevPackagesPageDialogEn implements TranslationsPubDevPackagesPageDialogJa {
	_TranslationsPubDevPackagesPageDialogEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPubDevPackagesPageDialogContentEn content = _TranslationsPubDevPackagesPageDialogContentEn._(_root);
	@override late final _TranslationsPubDevPackagesPageDialogButtonEn button = _TranslationsPubDevPackagesPageDialogButtonEn._(_root);
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

// Path: homePage.list.appInfo
class _TranslationsHomePageListAppInfoEn implements TranslationsHomePageListAppInfoJa {
	_TranslationsHomePageListAppInfoEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'App Info';
}

// Path: pubDevPackagesPage.dialog.content
class _TranslationsPubDevPackagesPageDialogContentEn implements TranslationsPubDevPackagesPageDialogContentJa {
	_TranslationsPubDevPackagesPageDialogContentEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get version => 'Latest version :';
	@override String get description => 'Description :';
}

// Path: pubDevPackagesPage.dialog.button
class _TranslationsPubDevPackagesPageDialogButtonEn implements TranslationsPubDevPackagesPageDialogButtonJa {
	_TranslationsPubDevPackagesPageDialogButtonEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override late final _TranslationsPubDevPackagesPageDialogButtonCloseEn close = _TranslationsPubDevPackagesPageDialogButtonCloseEn._(_root);
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

// Path: pubDevPackagesPage.dialog.button.close
class _TranslationsPubDevPackagesPageDialogButtonCloseEn implements TranslationsPubDevPackagesPageDialogButtonCloseJa {
	_TranslationsPubDevPackagesPageDialogButtonCloseEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get label => 'Close';
}

// Path: theme.selection.page.appBar
class _TranslationsThemeSelectionPageAppBarEn implements TranslationsThemeSelectionPageAppBarJa {
	_TranslationsThemeSelectionPageAppBarEn._(this._root);

	final TranslationsEn _root; // ignore: unused_field

	// Translations
	@override String get title => 'Theme Selector';
}

/// The flat map containing all translations for locale <en>.
/// Only for edge cases! For simple maps, use the map function of this library.
///
/// The Dart AOT compiler has issues with very large switch statements,
/// so the map is split into smaller functions (512 entries each).
extension on TranslationsEn {
	dynamic _flatMapFunction(String path) {
		return switch (path) {
			'title' => 'Flutter App Template',
			'accountPage.appBar.title' => 'Account',
			'appInfo.appBar.title' => 'App information',
			'author.name' => 'Altive inc',
			'button.cancel' => 'Cancel',
			'button.sign.out' => 'Sign out',
			'homePage.appBar.title' => 'Home',
			'homePage.list.appInfo.label' => 'App Info',
			'homePage.list.doubleCount' => 'The doubled count value :',
			'pubDevPackagesPage.appBar.title' => 'Pub.dev Packages',
			'pubDevPackagesPage.searchBar.hintText' => 'Search packages',
			'pubDevPackagesPage.body.emptyLabel' => 'No packages found.',
			'pubDevPackagesPage.dialog.content.version' => 'Latest version :',
			'pubDevPackagesPage.dialog.content.description' => 'Description :',
			'pubDevPackagesPage.dialog.button.close.label' => 'Close',
			'notFoundPage.title' => '404 Not Found',
			'notFoundPage.header.label' => 'Sorry...',
			'notFoundPage.description' => 'is not found.',
			'notFoundPage.backButton.label' => 'is not found.',
			'settingsPage.appBar.title' => 'Settings',
			'settingsPage.list.themeSelector.label' => 'Theme Selector',
			'settingsPage.list.account.label' => 'Account',
			'theme.mode.title.system' => 'System',
			'theme.mode.title.light' => 'Light theme',
			'theme.mode.title.dark' => 'Dark theme',
			'theme.mode.subtitle.system' => 'Follows the system settings of the device',
			'theme.mode.subtitle.light' => 'Light',
			'theme.mode.subtitle.dark' => 'Dark',
			'theme.selection.page.appBar.title' => 'Theme Selector',
			_ => null,
		};
	}
}
