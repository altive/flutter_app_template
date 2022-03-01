import 'l10n.dart';

/// The translations for Japanese (`ja`).
class L10nJa extends L10n {
  L10nJa([String locale = 'ja']) : super(locale);

  @override
  String get title => 'Flutter App Template';

  @override
  String get authorName => 'Altive株式会社';

  @override
  String get buttonAdd => '追加';

  @override
  String get buttonUpdate => '更新';

  @override
  String get buttonDelete => '削除';

  @override
  String get buttonDone => '完了';

  @override
  String get buttonCancel => 'キャンセル';

  @override
  String get buttonUnlink => '連携解除';

  @override
  String get buttonRemovePhoto => '写真を削除';

  @override
  String get buttonTakeNewPhoto => 'カメラで撮影';

  @override
  String get buttonSelectNewPhoto => '写真を選ぶ';

  @override
  String get titleChangePhoto => '写真を変更';

  @override
  String get signInMethodAnonymous => '匿名';

  @override
  String get signInMethodApple => 'Apple';

  @override
  String get signInMethodGoogle => 'Google';

  @override
  String get rankingMemberFormTitleLabel => '項目名';

  @override
  String get rankingMemberFormDescriptionLabel => '説明や理由';

  @override
  String get rankingDeleteDialogLabel => 'ランキングを削除しますか？';

  @override
  String hello(String userName) {
    return 'こんにちは、$userName！';
  }
}
