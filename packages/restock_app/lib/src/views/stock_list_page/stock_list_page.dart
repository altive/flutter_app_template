import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'stock_list_page_controller.dart';
import 'stock_list_page_providers.dart';
import 'stock_list_top_area.dart';
import 'stock_list_view.dart';

/// ストックリスト上部に表示するエリアの表示・非表示フラグ
final stockListTopAreaVisibleProvider = StateProvider<bool>((ref) => true);

/// ストック一覧を表示する画面
/// スクロール可能なタブとグループ分けした画面を内包する
class StockListPage extends HookConsumerWidget {
  const StockListPage();

  static const String routeName = '/home';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scrollController = useScrollController();
    final isSearchFieldVisible = ref.watch(stockListTopAreaVisibleProvider);

    void scrollListner() {
      // 表示・非表示を切り替えるスクロール位置の割合閾値
      const threshold = 0.1;
      // offset: 現在位置、 maxScrollExtent: スクロール可能最大位置
      final current =
          scrollController.offset / scrollController.position.maxScrollExtent;
      // 現在表示中なら `true`
      final fieldVisible = ref.read(stockListTopAreaVisibleProvider);

      if (fieldVisible &&
          current > threshold + 0.1 &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.reverse) {
        // 現在表示中かつ、スクロールを進めて閾値を越えたら非表示にする
        ref.read(stockListTopAreaVisibleProvider.state).state = false;
      }
      if (!fieldVisible &&
          scrollController.position.userScrollDirection ==
              ScrollDirection.forward) {
        // 現在非表示かつ、上方向にスクロールしたら再表示する
        ref.read(stockListTopAreaVisibleProvider.state).state = true;
      }
    }

    useEffect(
      () {
        scrollController.addListener(scrollListner);
        return () => scrollController.removeListener(scrollListner);
      },
      [scrollController],
    );

    final stockCategories = ref.watch(stockCategoriesProvider);

    if (stockCategories == null) {
      return const SizedBox();
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      // 必要なダイアログを表示させる
      ref
          .read(stockListPageControllerProvider.notifier)
          .showDialogsIfNeeded(context);
    });

    return DefaultTabController(
      length: stockCategories.length + 1,
      child: Scaffold(
        appBar: AppBar(
          flexibleSpace: Align(
            alignment: Alignment.bottomCenter,
            child: ColoredBox(
              color: Theme.of(context).bottomAppBarColor,
              child: TabBar(
                isScrollable: true,
                indicatorColor: Theme.of(context).colorScheme.primary,
                tabs: <Widget>[
                  const Tab(child: Text('すべて')),
                  for (final category in stockCategories)
                    Tab(
                      child: Text(category),
                    ),
                ],
              ),
            ),
          ),
        ),
        body: Stack(
          children: [
            TabBarView(
              children: [
                // すべて？
                StockListView(
                  categoryIndex: null,
                  group: null,
                  scrollController: scrollController,
                ),
                ...stockCategories
                    .asMap()
                    .map(
                      (index, category) => MapEntry(
                        index,
                        StockListView(
                          categoryIndex: index,
                          group: category,
                          scrollController: scrollController,
                        ),
                      ),
                    )
                    .values,
              ],
            ),
            // スクロールでアニメーションを伴って透明化する
            AnimatedOpacity(
              opacity: isSearchFieldVisible ? 1 : 0,
              duration: const Duration(milliseconds: 300),
              child: const Align(
                alignment: Alignment.topCenter,
                child: StockListTopArea(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
