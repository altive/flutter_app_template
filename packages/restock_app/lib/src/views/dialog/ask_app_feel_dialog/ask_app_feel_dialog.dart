import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../../utils/utils.dart';
import '../ok_cancel_with_image_dialog.dart';

class AskAppFeelDialog extends StatelessWidget {
  // Constructor
  const AskAppFeelDialog();

  // Field
  static const String routeName = '/ask-app-feel';

  /// このダイアログの表示条件
  static int get requiredCount {
    return 5;
  }

  // Methods
  @override
  Widget build(BuildContext context) {
    return OkCancelWithImageDialog(
      imageName: 'assets/images/ball_and_cat.png',
      titleLabel: 'ご利用ありがとうございます☺️',
      messageLabel: '「リストック」アプリは使いやすいと思いますか？',
      secondaryButtonLabel: '使いにくい',
      primaryButtonIconData: MdiIcons.starFace,
      primaryButtonOnPressed: () async {
        logger.info('「使いやすい」が選ばれました！');
        // ダイアログを閉じる
        Navigator.of(context).pop(true);
      },
      secondaryButtonOnPressed: () async {
        logger.info('「使いにくい」が選ばれました！');
        // ダイアログを閉じる
        Navigator.of(context).pop(false);
      },
    );
  }

  /// ダイアログを表示する
  /// はい（気に入った）が押された場合は`true`
  /// いいえが押された場合は`false`を返す
  static Future<bool?> show(BuildContext context) async {
    // ダイアログは1度しか表示させない
    return showDialog<bool>(
      context: context,
      barrierDismissible: false,
      builder: (context) => const AskAppFeelDialog(),
    );
  }
}
