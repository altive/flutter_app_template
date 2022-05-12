import 'package:flutter/material.dart';

import '../search_entrance/recommended_products_area.dart';
import 'barcode_scanner_button.dart';
import 'goods_search_area.dart';
import 'photo_album_button.dart';
import 'photo_shooting_button.dart';

/// 検索画面の最上位view
class SearchEntranceView extends StatelessWidget {
  const SearchEntranceView();

  static const String routeName = '/store-entrance';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('ストックを追加')),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(16),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                crossAxisAlignment: WrapCrossAlignment.center,
                children: const <Widget>[
                  ActionCard(child: PhotoShootingButton()),
                  ActionCard(child: PhotoAlbumButton()),
                  ActionCard(child: BarcodeScannerButton()),
                ],
              ),
            ),
            GoodsSearchArea(),
            const RecommendedProductsArea(),
          ],
        ),
      ),
    );
  }
}

class ActionCard extends StatelessWidget {
  const ActionCard({
    required this.child,
  });
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return FractionallySizedBox(
      widthFactor: 0.32,
      child: Card(
        elevation: 0,
        shape: const RoundedRectangleBorder(
          side: BorderSide(
            color: Colors.black12,
          ),
          borderRadius: BorderRadius.all(Radius.circular(4)),
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 8, 0, 0),
          child: child,
        ),
      ),
    );
  }
}
