import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

import '../../common_widgets/list_section_header.dart';
import '../../everyones_stock/expiration_date_type.dart';
import '../../util/share/share_service.dart';
import 'stock_detail_counter_view.dart';
import 'stock_detail_image_tile.dart';
import 'stock_detail_menu_button.dart';
import 'stock_detail_name_tile.dart';
import 'stock_detail_notification_tile.dart';
import 'stock_detail_page_controller.dart';

/// 所有アイテムの詳細情報を閲覧する画面
class StockDetailPage extends HookWidget {
  const StockDetailPage();

  static const String routeName = '/item-detail';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('ストック詳細'),
        actions: const <Widget>[
          ShareButton(),
          StockDetailMenuButton(),
        ],
      ),
      body: const SafeArea(
        child: Content(),
      ),
    );
  }
}

class ShareButton extends HookConsumerWidget {
  const ShareButton();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return IconButton(
      icon: Icon(Platform.isIOS ? CupertinoIcons.share : Icons.share),
      onPressed: () => shareWithStock(
        ref.read(stockForStockDetailProvider)!,
        size: MediaQuery.of(context).size,
      ),
    );
  }
}

class Content extends HookWidget {
  const Content();

  @override
  Widget build(BuildContext context) {
    const spacer = SizedBox(height: 16);
    const divider = Divider(height: 1);

    return ButtonTheme(
      height: 50,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      child: ListView(
        children: const <Widget>[
          StockDetailImageTile(),
          StockDetailNameTile(),
          spacer,
          // 期限
          _Cell(child: ExpirationCell()),
          divider,
          // グループ
          _Cell(child: CategoryCell()),
          divider,
          // 通知
          _Cell(child: StockDetailNotificationTile()),
          divider,
          // 個数
          _Cell(child: NumberOfItemsCell()),
          ListSectionHeader(
            title: 'メモ',
            padding: EdgeInsets.fromLTRB(16, 8, 16, 8),
          ),
          MemoCell(),
          spacer,
        ],
      ),
    );
  }
}

class MemoCell extends HookConsumerWidget {
  const MemoCell();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final memo = ref.watch(
      stockForStockDetailProvider.select<String?>((value) => value?.memo),
    );
    if (memo == null) {
      return const SizedBox();
    }
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.symmetric(
        vertical: 16,
        horizontal: 16,
      ),
      child: Text(memo),
    );
  }
}

class NumberOfItemsCell extends HookConsumerWidget {
  const NumberOfItemsCell();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final numberOfItems = ref.watch(
      stockForStockDetailProvider
          .select<double?>((value) => value?.numberOfItems),
    );
    return ListTile(
      leading: Text(
        'ストック個数',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      title: Text(
        numberOfItems == null ? '' : '${numberOfItems.toInt()}個',
        textAlign: TextAlign.center,
      ),
      trailing: const StockDetailCounterView(),
    );
  }
}

class CategoryCell extends HookConsumerWidget {
  const CategoryCell();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final stockCategory = ref.watch(
      stockForStockDetailProvider
          .select<String?>((value) => value?.stockCategory),
    );
    return ListTile(
      leading: Text(
        'グループ',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      trailing: Text(stockCategory ?? '未設定'),
    );
  }
}

class ExpirationCell extends HookConsumerWidget {
  const ExpirationCell();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final expirationAt = ref.watch(
      stockForStockDetailProvider
          .select<DateTime?>((value) => value?.expirationAt),
    );
    final expirationDateType = ref.watch(
      stockForStockDetailProvider
          .select<ExpirationDateType?>((value) => value?.expirationDateType),
    );
    return ListTile(
      leading: Text(
        expirationDateType?.label ?? '',
        style: Theme.of(context).textTheme.subtitle2!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      trailing: Text(
        expirationDateType == ExpirationDateType.none || expirationAt == null
            ? ''
            : DateFormat.yMEd().format(expirationAt),
      ),
    );
  }
}

class _Cell extends StatelessWidget {
  const _Cell({
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return ColoredBox(
      color: Theme.of(context).canvasColor,
      child: child,
    );
  }
}
