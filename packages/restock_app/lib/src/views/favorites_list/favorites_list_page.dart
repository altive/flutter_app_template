import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/empty_view.dart';
import '../../common_widgets/loading_indicator.dart';
import '../../models/firestore/favorite_item/favorite_item.dart';
import 'favorite_item_cell.dart';

class FavoritesListPage extends HookConsumerWidget {
  // Constructor
  const FavoritesListPage();

  // Field
  static const String routeName = '/favorites-list';

  // Methods
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favoriteItems = ref.watch(favoriteItemProvider);
    return favoriteItems.when(
      loading: () => const LoadingIndicator(),
      error: (error, stack) => ErrorWidget(error),
      data: (items) {
        return Scaffold(
          appBar: AppBar(title: const Text('お気に入り')),
          body: SafeArea(
            child: items.isEmpty
                ? EmptyView(
                    label: const Text('気になるアイテムはお気に入りに追加しましょう'),
                    image: Image.asset('assets/images/notebook_and_pen.png'),
                  )
                : ListView.builder(
                    itemBuilder: (_, index) {
                      final item = items[index];
                      return FavoriteItemCell(document: item);
                    },
                    itemCount: items.length,
                    padding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
                  ),
          ),
        );
      },
    );
  }
}
