import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/primary_button.dart';
import '../../util/shared_preferences_service.dart';
import 'stock_display_mode.dart';
import 'stock_filter_page/stock_filter_page.dart';
import 'stock_list_page_providers.dart';

class StockListTopArea extends HookConsumerWidget {
  const StockListTopArea();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final searchText = ref.watch(searchTextProvider);
    final textEditingController = useTextEditingController(text: searchText);
    final tabController = DefaultTabController.of(context);

    void tabControllerListener() {
      if (tabController != null) {
        ref.read(selectedTabIndexProvider.state).state = tabController.index;
      }
    }

    useEffect(
      () {
        tabController?.addListener(tabControllerListener);
        return () => tabController?.removeListener(tabControllerListener);
      },
      [tabController],
    );
    final selectedTabIndex = ref.watch(selectedTabIndexProvider);
    final groups = ref.watch(stockCategoriesProvider);
    final group = selectedTabIndex == 0 ? null : groups![selectedTabIndex - 1];
    final stockCount = ref.watch(stockCountProvider(group));
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          SizedBox(
            height: 44,
            child: Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: textEditingController,
                    textInputAction: TextInputAction.done,
                    onChanged: (text) =>
                        ref.read(searchTextProvider.state).state = text,
                    style: Theme.of(context).textTheme.subtitle2,
                    decoration: InputDecoration(
                      hintText: '検索',
                      hintStyle: Theme.of(context).textTheme.caption,
                      filled: true,
                      contentPadding: EdgeInsets.zero,
                      prefixIcon: const Icon(Icons.search),
                      suffixIcon: searchText.isEmpty
                          ? null
                          : IconButton(
                              icon: const Icon(Icons.clear),
                              onPressed: () {
                                ref.read(searchTextProvider.state).state = '';
                                textEditingController.clear();
                              },
                            ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(Radius.circular(64)),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 8),
                PrimaryButton(
                  padding: EdgeInsets.zero,
                  iconData: Icons.filter_alt,
                  labelText: '表示条件',
                  onPressed: () => showModalBottomSheet<void>(
                    context: context,
                    builder: (_) => const StockFilterPage(),
                    elevation: 3,
                    backgroundColor: Theme.of(context).backgroundColor,
                    shape: const RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.vertical(top: Radius.circular(32)),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(width: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                stockCount == null ? '' : '$stockCount件のストック',
                style: Theme.of(context).textTheme.caption,
              ),
              const _ModeSelector(),
            ],
          ),
        ],
      ),
    );
  }
}

class _ModeSelector extends HookWidget {
  const _ModeSelector();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: const [
        _ChoiceChip(displayMode: StockDisplayMode.list),
        SizedBox(width: 8),
        _ChoiceChip(displayMode: StockDisplayMode.grid),
      ],
    );
  }
}

class _ChoiceChip extends HookConsumerWidget {
  const _ChoiceChip({
    required this.displayMode,
  });

  final StockDisplayMode displayMode;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentMode = ref.watch(displayModeProvider);
    return ChoiceChip(
      label: Icon(
        displayMode.iconData,
        color: Theme.of(context).colorScheme.onPrimary,
      ),
      selectedColor: Theme.of(context).colorScheme.primary,
      selected: currentMode == displayMode,
      onSelected: (isOn) {
        if (isOn) {
          ref.read(displayModeProvider.state).state = displayMode;
          ref
              .read(sharedPreferencesServiceProvider)
              .saveStockDisplayMode(mode: displayMode);
        }
      },
    );
  }
}
