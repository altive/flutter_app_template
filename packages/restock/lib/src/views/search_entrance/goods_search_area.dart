import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../search_result/search_result_controller.dart';
import '../search_result/search_result_view.dart';
import 'recommended_word_chips.dart';
import 'search_entrance_controller.dart';

/// 商品の文字列検索エリア
class GoodsSearchArea extends HookWidget {
  GoodsSearchArea({
    Key? key,
  }) : super(key: key);

  /// FormのKey
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // ----------------------------------
  // Override Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    final _searchFieldController = TextEditingController();
    final searchEntranceController =
        useProvider(searchEntranceProvider.notifier);
    return Container(
      color: Theme.of(context).backgroundColor,
      padding: const EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const SizedBox(width: 8),
              Expanded(
                  child: Text(
                'Amazonで検索',
                style: Theme.of(context).textTheme.subtitle2,
              )),
              const SearchCategoryRadioField(category: SearchItemsCategory.all),
              const SearchCategoryRadioField(
                  category: SearchItemsCategory.grocery),
            ],
          ),
          Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Form(
                key: _formKey,
                child: Expanded(
                  child: TextFormField(
                    controller: _searchFieldController,
                    textInputAction: TextInputAction.search,
                    decoration: InputDecoration(
                      hintText: '何をストックしますか？',
                      hintStyle: Theme.of(context).textTheme.caption,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: IconButton(
                        icon: const Icon(Icons.clear),
                        onPressed: () => WidgetsBinding.instance!
                            .addPostFrameCallback(
                                (_) => _searchFieldController.clear()),
                      ),
                      border: OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.circular(8),
                      ),
                    ),
                    validator: (value) {
                      if (value!.isEmpty) {
                        return '入力してください';
                      }
                      return null; // 問題なし
                    },
                    // returnキーが押されたとき
                    onFieldSubmitted: (_) => executeSearch(
                      context: context,
                      searchEntranceController: searchEntranceController,
                    ),
                    // 送信される直前
                    onSaved: searchEntranceController.editSearchText,
                  ),
                ),
              ),
              const SizedBox(width: 8),
              ElevatedButton(
                onPressed: () => executeSearch(
                  context: context,
                  searchEntranceController: searchEntranceController,
                ),
                style: ElevatedButton.styleFrom(
                    visualDensity: VisualDensity.compact,
                    padding:
                        const EdgeInsets.symmetric(vertical: 20, horizontal: 0),
                    elevation: 0,
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(8),
                      ),
                    )),
                child: Text('検索', style: Theme.of(context).textTheme.button),
              ),
            ],
          ),
          const SizedBox(height: 8),
          const RecommendedWordChips(),
        ],
      ),
    );
  }

  /// 検索を実行する
  Future<void> executeSearch({
    required BuildContext context,
    required SearchEntranceController searchEntranceController,
  }) async {
    if (_formKey.currentState!.validate()) {
      _formKey.currentState!.save();
      final params = searchEntranceController.genetateParams();
      // 検索結果画面へ遷移
      context.read(searchParamProvider).state = params;
      await Navigator.of(context).pushNamed(
        SearchResultView.routeName,
      );
    }
  }
}

/// 検索対象のカテゴリを選択できる
class SearchCategoryRadioField extends HookWidget {
  const SearchCategoryRadioField({
    Key? key,
    required this.category,
  }) : super(key: key);

  final SearchItemsCategory category;

  @override
  Widget build(BuildContext context) {
    final controller = useProvider(searchEntranceProvider.notifier);
    final state = useProvider(searchEntranceProvider);
    void changeSelection(SearchItemsCategory? newValue) =>
        controller.changeSearchItemsCategory(newValue);
    final selectedCategory = state.searchItemsCategory;
    return InkWell(
      onTap: () {
        changeSelection(category);
      },
      child: Row(
        children: <Widget>[
          Radio<SearchItemsCategory>(
            groupValue: selectedCategory,
            value: category,
            onChanged: changeSelection,
          ),
          Text(category.label),
        ],
      ),
    );
  }
}
