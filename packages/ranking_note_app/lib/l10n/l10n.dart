
import 'dart:async';

import 'package:flutter/foundation.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:intl/intl.dart' as intl;

import 'l10n_en.dart';
import 'l10n_ja.dart';

/// Callers can lookup localized strings with an instance of L10n returned
/// by `L10n.of(context)`.
///
/// Applications need to include `L10n.delegate()` in their app's
/// localizationDelegates list, and the locales they support in the app's
/// supportedLocales list. For example:
///
/// ```
/// import 'l10n/l10n.dart';
///
/// return MaterialApp(
///   localizationsDelegates: L10n.localizationsDelegates,
///   supportedLocales: L10n.supportedLocales,
///   home: MyApplicationHome(),
/// );
/// ```
///
/// ## Update pubspec.yaml
///
/// Please make sure to update your pubspec.yaml to include the following
/// packages:
///
/// ```
/// dependencies:
///   # Internationalization support.
///   flutter_localizations:
///     sdk: flutter
///   intl: any # Use the pinned version from flutter_localizations
///
///   # rest of dependencies
/// ```
///
/// ## iOS Applications
///
/// iOS applications define key application metadata, including supported
/// locales, in an Info.plist file that is built into the application bundle.
/// To configure the locales supported by your app, you’ll need to edit this
/// file.
///
/// First, open your project’s ios/Runner.xcworkspace Xcode workspace file.
/// Then, in the Project Navigator, open the Info.plist file under the Runner
/// project’s Runner folder.
///
/// Next, select the Information Property List item, select Add Item from the
/// Editor menu, then select Localizations from the pop-up menu.
///
/// Select and expand the newly-created Localizations item then, for each
/// locale your application supports, add a new item and select the locale
/// you wish to add from the pop-up menu in the Value field. This list should
/// be consistent with the languages listed in the L10n.supportedLocales
/// property.
abstract class L10n {
  L10n(String locale) : localeName = intl.Intl.canonicalizedLocale(locale.toString());

  final String localeName;

  static L10n? of(BuildContext context) {
    return Localizations.of<L10n>(context, L10n);
  }

  static const LocalizationsDelegate<L10n> delegate = _L10nDelegate();

  /// A list of this localizations delegate along with the default localizations
  /// delegates.
  ///
  /// Returns a list of localizations delegates containing this delegate along with
  /// GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate,
  /// and GlobalWidgetsLocalizations.delegate.
  ///
  /// Additional delegates can be added by appending to this list in
  /// MaterialApp. This list does not have to be used at all if a custom list
  /// of delegates is preferred or required.
  static const List<LocalizationsDelegate<dynamic>> localizationsDelegates = <LocalizationsDelegate<dynamic>>[
    delegate,
    GlobalMaterialLocalizations.delegate,
    GlobalCupertinoLocalizations.delegate,
    GlobalWidgetsLocalizations.delegate,
  ];

  /// A list of this localizations delegate's supported locales.
  static const List<Locale> supportedLocales = <Locale>[
    Locale('en'),
    Locale('ja')
  ];

  /// No description provided for @title.
  ///
  /// In en, this message translates to:
  /// **'Flutter App Template'**
  String get title;

  /// No description provided for @authorName.
  ///
  /// In en, this message translates to:
  /// **'Altive inc'**
  String get authorName;

  /// No description provided for @buttonAdd.
  ///
  /// In en, this message translates to:
  /// **'ADD'**
  String get buttonAdd;

  /// No description provided for @buttonUpdate.
  ///
  /// In en, this message translates to:
  /// **'UPDATE'**
  String get buttonUpdate;

  /// No description provided for @buttonDelete.
  ///
  /// In en, this message translates to:
  /// **'DELETE'**
  String get buttonDelete;

  /// No description provided for @buttonDone.
  ///
  /// In en, this message translates to:
  /// **'DONE'**
  String get buttonDone;

  /// No description provided for @buttonCancel.
  ///
  /// In en, this message translates to:
  /// **'CANCEL'**
  String get buttonCancel;

  /// No description provided for @buttonUnlink.
  ///
  /// In en, this message translates to:
  /// **'UNLINK'**
  String get buttonUnlink;

  /// No description provided for @buttonSignIn.
  ///
  /// In en, this message translates to:
  /// **'SIGN IN'**
  String get buttonSignIn;

  /// No description provided for @buttonSignOut.
  ///
  /// In en, this message translates to:
  /// **'SIGN OUT'**
  String get buttonSignOut;

  /// No description provided for @buttonRemovePhoto.
  ///
  /// In en, this message translates to:
  /// **'Remove photo'**
  String get buttonRemovePhoto;

  /// No description provided for @buttonTakeNewPhoto.
  ///
  /// In en, this message translates to:
  /// **'Take new photo'**
  String get buttonTakeNewPhoto;

  /// No description provided for @buttonSelectNewPhoto.
  ///
  /// In en, this message translates to:
  /// **'Select new Photo'**
  String get buttonSelectNewPhoto;

  /// No description provided for @titleChangePhoto.
  ///
  /// In en, this message translates to:
  /// **'Change photo'**
  String get titleChangePhoto;

  /// No description provided for @signInMethodAnonymous.
  ///
  /// In en, this message translates to:
  /// **'Anonymous'**
  String get signInMethodAnonymous;

  /// No description provided for @signInMethodApple.
  ///
  /// In en, this message translates to:
  /// **'Apple'**
  String get signInMethodApple;

  /// No description provided for @signInMethodGoogle.
  ///
  /// In en, this message translates to:
  /// **'Google'**
  String get signInMethodGoogle;

  /// No description provided for @rankingMemberFormTitleLabel.
  ///
  /// In en, this message translates to:
  /// **'Item name'**
  String get rankingMemberFormTitleLabel;

  /// No description provided for @rankingMemberFormDescriptionLabel.
  ///
  /// In en, this message translates to:
  /// **'Description or reasons.'**
  String get rankingMemberFormDescriptionLabel;

  /// No description provided for @rankingDeleteDialogLabel.
  ///
  /// In en, this message translates to:
  /// **'Do you want to remove your ranking?'**
  String get rankingDeleteDialogLabel;

  /// A message with a single parameter.
  ///
  /// In en, this message translates to:
  /// **'Hello {userName}!'**
  String hello(String userName);
}

class _L10nDelegate extends LocalizationsDelegate<L10n> {
  const _L10nDelegate();

  @override
  Future<L10n> load(Locale locale) {
    return SynchronousFuture<L10n>(lookupL10n(locale));
  }

  @override
  bool isSupported(Locale locale) => <String>['en', 'ja'].contains(locale.languageCode);

  @override
  bool shouldReload(_L10nDelegate old) => false;
}

L10n lookupL10n(Locale locale) {


  // Lookup logic when only language code is specified.
  switch (locale.languageCode) {
    case 'en': return L10nEn();
    case 'ja': return L10nJa();
  }

  throw FlutterError(
    'L10n.delegate failed to load unsupported locale "$locale". This is likely '
    'an issue with the localizations generation tool. Please file an issue '
    'on GitHub with a reproducible sample app and the gen-l10n configuration '
    'that was used.'
  );
}
