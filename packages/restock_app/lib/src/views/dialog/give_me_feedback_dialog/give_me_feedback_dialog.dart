import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../utils/utils.dart';
import '../../user_request/user_request_page.dart';
import '../ok_cancel_with_image_dialog.dart';

class GiveMeFeedbackDialog extends StatelessWidget {
  // Constructor
  const GiveMeFeedbackDialog();

  // Field
  static const String routeName = '/give-me-feedback';

  // Methods
  @override
  Widget build(BuildContext context) {
    return OkCancelWithImageDialog(
      imageName: 'assets/images/online_meeting.png',
      titleLabel: 'ご意見をお聞かせください',
      messageLabel: '皆さまのご意見をもとにアプリの改善を行っています。ぜひフィードバックをお願いいたします。',
      primaryButtonLabel: '送る',
      secondaryButtonLabel: '送らない',
      primaryButtonIconData: MdiIcons.send,
      primaryButtonOnPressed: () async {
        logger.finer('「フィードバックする」が選択された');
        // 問い合わせページを開く
        await Navigator.of(context).pushNamed(UserRequestPage.routeName);
        // ダイアログを閉じる
        Navigator.of(context).pop(true);
      },
      secondaryButtonOnPressed: () async {
        logger.finer('「フィードバックしない」が選択された');
        // ダイアログを閉じる
        Navigator.of(context).pop(false);
      },
    );
  }

  /// ダイアログを表示する
  /// はいが押された場合は`true`
  /// いいえが押された場合は`false`を返す
  static Future<bool?> show(BuildContext context) async {
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const GiveMeFeedbackDialog(),
    );
  }
}
