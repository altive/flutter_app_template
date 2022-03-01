import 'l10n.dart';

/// The translations for English (`en`).
class L10nEn extends L10n {
  L10nEn([String locale = 'en']) : super(locale);

  @override
  String get title => 'Flutter App Template';

  @override
  String get authorName => 'Altive inc';

  @override
  String get buttonAdd => 'ADD';

  @override
  String get buttonUpdate => 'UPDATE';

  @override
  String get buttonDelete => 'DELETE';

  @override
  String get buttonDone => 'DONE';

  @override
  String get buttonCancel => 'CANCEL';

  @override
  String get buttonUnlink => 'UNLINK';

  @override
  String get buttonRemovePhoto => 'Remove photo';

  @override
  String get buttonTakeNewPhoto => 'Take new photo';

  @override
  String get buttonSelectNewPhoto => 'Select new Photo';

  @override
  String get titleChangePhoto => 'Change photo';

  @override
  String get signInMethodAnonymous => 'Anonymous';

  @override
  String get signInMethodApple => 'Apple';

  @override
  String get signInMethodGoogle => 'Google';

  @override
  String get rankingMemberFormTitleLabel => 'Item name';

  @override
  String get rankingMemberFormDescriptionLabel => 'Description or reasons.';

  @override
  String get rankingDeleteDialogLabel => 'Do you want to remove your ranking?';

  @override
  String hello(String userName) {
    return 'Hello $userName!';
  }
}
