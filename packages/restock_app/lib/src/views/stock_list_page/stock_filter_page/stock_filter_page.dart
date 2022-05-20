import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../stock_list_filter_state.dart';
import '../stock_list_page_controller.dart';
import '../stock_list_page_providers.dart';
import '../stock_list_sort_selection.dart';

class StockFilterPage extends HookConsumerWidget {
  const StockFilterPage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filteringState = ref.watch(stockFilterProvider);
    final sortingState = ref.watch(stockSortingProvider);
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 24),
      child: ListView(
        children: [
          const Headline('並び替え'),
          _SorterChips(
            title: '期限',
            iconData: MdiIcons.sortCalendarAscending,
            is1stSelected: sortingState.isExpirationNear,
            is2ndSelected: sortingState.isExpirationFar,
            firstSelectionLabel: '近い',
            secondSelectionLabel: '遠い',
            on1stSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveSelectedSorting(StockSortSelection.expirationNear),
            on2ndSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveSelectedSorting(StockSortSelection.expirationFar),
          ),
          _SorterChips(
            title: '名前',
            iconData: MdiIcons.sortAlphabeticalAscending,
            is1stSelected: sortingState.isNameAsc,
            is2ndSelected: sortingState.isNameDesc,
            firstSelectionLabel: 'A → Z',
            secondSelectionLabel: 'Z → A',
            on1stSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveSelectedSorting(StockSortSelection.nameAsc),
            on2ndSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveSelectedSorting(StockSortSelection.nameDesc),
          ),
          _SorterChips(
            title: 'メモ',
            iconData: MdiIcons.sortAscending,
            is1stSelected: sortingState.isMemoAsc,
            is2ndSelected: sortingState.isMemoDesc,
            firstSelectionLabel: 'A → Z',
            secondSelectionLabel: 'Z → A',
            on1stSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveSelectedSorting(StockSortSelection.memoAsc),
            on2ndSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveSelectedSorting(StockSortSelection.memoDesc),
          ),
          const Divider(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Headline('絞り込み'),
              TextButton(
                onPressed: ref
                    .read(stockListPageControllerProvider.notifier)
                    .resetFilter,
                child: const Text('リセット'),
              ),
            ],
          ),
          _FilterChips(
            title: '在庫',
            iconData: Icons.backpack_outlined,
            state: filteringState.inventory,
            onYesSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveFilteringInventory(
                  isOn ? FilteringState.yes : FilteringState.notSelected,
                ),
            onNoSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveFilteringInventory(
                  isOn ? FilteringState.no : FilteringState.notSelected,
                ),
          ),
          _FilterChips(
            title: '期限',
            iconData: MdiIcons.calendarAlert,
            state: filteringState.expiration,
            onYesSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveFilteringExpiration(
                  isOn ? FilteringState.yes : FilteringState.notSelected,
                ),
            onNoSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveFilteringExpiration(
                  isOn ? FilteringState.no : FilteringState.notSelected,
                ),
          ),
          _FilterChips(
            title: '種類',
            iconData: Icons.category_outlined,
            yesText: '食品',
            noText: 'その他',
            state: filteringState.category,
            onYesSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveFilteringCategory(
                  isOn ? FilteringState.yes : FilteringState.notSelected,
                ),
            onNoSelected: (isOn) => ref
                .read(stockListPageControllerProvider.notifier)
                .saveFilteringCategory(
                  isOn ? FilteringState.no : FilteringState.notSelected,
                ),
          ),
        ],
      ),
    );
  }
}

class Headline extends StatelessWidget {
  const Headline(this.label);

  final String label;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        label,
        style: Theme.of(context).textTheme.subtitle1!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
    );
  }
}

/// 並び替えのChipを表示する
class _SorterChips extends StatelessWidget {
  const _SorterChips({
    required this.is1stSelected,
    required this.is2ndSelected,
    required this.on1stSelected,
    required this.on2ndSelected,
    required this.iconData,
    required this.title,
    required this.firstSelectionLabel,
    required this.secondSelectionLabel,
  });

  final bool is1stSelected;
  final bool is2ndSelected;
  final void Function(bool) on1stSelected;
  final void Function(bool) on2ndSelected;
  final IconData iconData;
  final String title;
  final String firstSelectionLabel;
  final String secondSelectionLabel;

  static const spaser = SizedBox(width: 32);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          spaser,
          _FiterChip(
            isSelected: is1stSelected,
            label: firstSelectionLabel,
            onSelected: on1stSelected,
          ),
          const SizedBox(width: 8),
          _FiterChip(
            isSelected: is2ndSelected,
            label: secondSelectionLabel,
            onSelected: on2ndSelected,
          ),
        ],
      ),
    );
  }
}

/// 絞込みのChipを表示する
class _FilterChips extends StatelessWidget {
  const _FilterChips({
    required this.state,
    required this.onYesSelected,
    required this.onNoSelected,
    required this.iconData,
    required this.title,
    this.yesText = 'あり',
    this.noText = 'なし',
  });

  final FilteringState state;
  final void Function(bool) onYesSelected;
  final void Function(bool) onNoSelected;
  final IconData iconData;
  final String title;
  final String yesText;
  final String noText;

  static const gap = SizedBox(width: 32);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 8),
      child: Row(
        children: [
          Icon(iconData),
          const SizedBox(width: 8),
          Text(
            title,
            style: Theme.of(context).textTheme.caption,
          ),
          gap,
          _FiterChip(
            isSelected: state == FilteringState.yes,
            label: yesText,
            onSelected: onYesSelected,
          ),
          const SizedBox(width: 8),
          _FiterChip(
            isSelected: state == FilteringState.no,
            label: noText,
            onSelected: onNoSelected,
          ),
        ],
      ),
    );
  }
}

class _FiterChip extends StatelessWidget {
  const _FiterChip({
    required this.isSelected,
    required this.label,
    required this.onSelected,
  });

  final bool isSelected;
  final String label;
  final void Function(bool) onSelected;

  @override
  Widget build(BuildContext context) {
    return FilterChip(
      selected: isSelected,
      avatar: Icon(
        Icons.circle,
        color: isSelected
            ? Theme.of(context).colorScheme.primary
            : Theme.of(context).scaffoldBackgroundColor,
      ),
      label: Text(label),
      selectedColor: Theme.of(context).colorScheme.primary,
      backgroundColor: Theme.of(context).colorScheme.onBackground.withAlpha(40),
      onSelected: onSelected,
    );
  }
}
