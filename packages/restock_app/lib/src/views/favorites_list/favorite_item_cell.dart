import 'dart:io';

import 'package:adaptive_dialog/adaptive_dialog.dart';
import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common_widgets/url_image.dart';
import '../../core/stock/stock_entity.dart';
import '../../models/firestore/favorite_item/favorite_item.dart';
import '../../util/share/share_service.dart';
import '../../util/web_launcher.dart';
import '../stock_editor/stock_editor_controller.dart';
import '../stock_editor/stock_editor_page.dart';
import '../stock_editor/stock_editor_parameter.dart';

/// リストで表示するカード。一つのアイテム情報を表示する
class FavoriteItemCell extends HookConsumerWidget {
  const FavoriteItemCell({
    required this.document,
  });

  final Document<FavoriteItem> document;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final item = document.entity!;
    return Card(
      elevation: 0,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16, 8, 16, 0),
        child: Row(
          children: [
            // アイテム画像
            UrlImage(
              item.imageUrlSmall,
              width: 48,
              height: 48,
            ),
            const SizedBox(width: 16),
            // 画像以外（アイテム名など）
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // アイテム名
                  Text(
                    item.name,
                    maxLines: 3,
                  ),
                  // アイコンボタン
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // mainAxisSize: MainAxisSize.max,
                    children: [
                      IconButton(
                        icon: const Icon(MdiIcons.plusBox),
                        onPressed: () => _didTapCreateButton(
                          ref: ref,
                          context: context,
                          item: item,
                        ),
                      ),
                      IconButton(
                        icon: const Icon(
                          MdiIcons.heart,
                          color: Colors.red,
                        ),
                        onPressed: () =>
                            _didTapFavoritesButton(context: context),
                      ),
                      IconButton(
                        icon: const FaIcon(FontAwesomeIcons.amazon),
                        onPressed: () =>
                            _didTapAmazonButton(url: item.amazonUrl),
                      ),
                      IconButton(
                        icon: Icon(
                          Platform.isIOS ? CupertinoIcons.share : Icons.share,
                        ),
                        onPressed: () => _didTapShareButton(
                          context: context,
                          item: item,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// ストックアイテムを作成するボタンが押された
  Future<void> _didTapCreateButton({
    required WidgetRef ref,
    required BuildContext context,
    required FavoriteItem item,
  }) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    final scaffold = ScaffoldMessenger.of(context);
    // Providerにドキュメントをセット
    ref.read(stockEditorParameterProvider.state).state =
        StockEditorParameter.createrWithAmazon(
      stock: StockEntity.fromFavoriteItem(item),
    );
    // 詳細画面へ遷移
    final result = await Navigator.of(context).pushNamed(
      StockEditorPage.routeName,
    );
    // 何か返ってきた時のみスナックバーを表示する
    if (result == null) {
      scaffold.removeCurrentSnackBar();
      return;
    }
    scaffold
      ..removeCurrentSnackBar()
      ..showSnackBar(SnackBar(content: Text('$result')));
  }

  /// お気に入りボタンが押された
  Future<void> _didTapFavoritesButton({required BuildContext context}) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    // お気に入りから削除して良いか確認する
    final result = await showOkCancelAlertDialog(
      context: context,
      title: 'お気に入りから削除しますか？',
      okLabel: '削除',
      cancelLabel: 'キャンセル',
      isDestructiveAction: true,
      defaultType: OkCancelAlertDefaultType.cancel,
    );
    switch (result) {
      case OkCancelResult.ok:
        ScaffoldMessenger.of(context)
          ..removeCurrentSnackBar()
          ..showSnackBar(
            const SnackBar(
              content: Text('削除しました'),
            ),
          );
        await document.ref.delete();
        break;

      case OkCancelResult.cancel:
        break;
    }
  }

  /// Amazonボタンが押された
  Future<void> _didTapAmazonButton({required String? url}) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    // URLを開く
    await launchUrl(url);
  }

  /// シェアボタンが押された
  Future<void> _didTapShareButton({
    required BuildContext context,
    required FavoriteItem item,
  }) async {
    // ignore: unawaited_futures
    HapticFeedback.selectionClick();
    shareWithFavorite(
      item,
      size: MediaQuery.of(context).size,
    );
  }
}
