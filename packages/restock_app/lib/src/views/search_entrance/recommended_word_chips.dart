import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../search_result/search_result_controller.dart';
import '../search_result/search_result_view.dart';
import 'search_entrance_controller.dart';

class RecommendedWordChips extends StatelessWidget {
  const RecommendedWordChips();

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 8,
      runSpacing: -4,
      children: const [
        WordChip(
          iconData: Icons.local_drink,
          label: 'ミネラルウォーター',
          isGlossary: true,
        ),
        WordChip(
          iconData: MdiIcons.noodles,
          label: 'カップ麺',
          isGlossary: true,
        ),
        WordChip(iconData: MdiIcons.flashlight, label: '懐中電灯'),
      ],
    );
  }
}

class WordChip extends HookConsumerWidget {
  const WordChip({
    required this.iconData,
    required this.label,
    this.isGlossary = false,
  });

  final IconData iconData;
  final String label;
  final bool isGlossary;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ActionChip(
      avatar: Icon(
        iconData,
        size: 18,
      ),
      labelPadding: const EdgeInsets.only(right: 4),
      label: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
      backgroundColor: Theme.of(context).cardColor,
      shape: const StadiumBorder(
        side: BorderSide(
          color: Colors.black12,
        ),
      ),
      onPressed: () async {
        final searchEntranceController =
            ref.read(searchEntranceProvider.notifier)..editSearchText(label);
        final params = searchEntranceController.genetateParams(
          category: isGlossary
              ? SearchItemsCategory.grocery
              : SearchItemsCategory.all,
        );
        // 検索結果画面へ遷移
        ref.read(searchParamProvider.state).state = params;
        await Navigator.of(context).pushNamed(
          SearchResultView.routeName,
        );
      },
    );
  }
}
