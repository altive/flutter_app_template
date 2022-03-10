import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../search_result/search_result_controller.dart';
import '../search_result/search_result_view.dart';
import 'search_entrance_controller.dart';

class RecommendedWordChips extends StatelessWidget {
  const RecommendedWordChips({Key? key}) : super(key: key);

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

class WordChip extends HookWidget {
  const WordChip({
    Key? key,
    required this.iconData,
    required this.label,
    this.isGlossary = false,
  }) : super(key: key);

  final IconData iconData;
  final String label;
  final bool isGlossary;

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      avatar: Icon(
        iconData,
        size: 18,
      ),
      labelPadding: const EdgeInsets.only(left: 0, right: 4),
      label: Text(
        label,
        style: const TextStyle(fontSize: 12),
      ),
      backgroundColor: Theme.of(context).cardColor,
      shape: const StadiumBorder(
        side: BorderSide(
          width: 1,
          color: Colors.black12,
        ),
      ),
      onPressed: () async {
        final searchEntranceController = context
            .read(searchEntranceProvider.notifier)
          ..editSearchText(label);
        final params = searchEntranceController.genetateParams(
            category: isGlossary
                ? SearchItemsCategory.grocery
                : SearchItemsCategory.all);
        // 検索結果画面へ遷移
        context.read(searchParamProvider).state = params;
        await Navigator.of(context).pushNamed(
          SearchResultView.routeName,
        );
      },
    );
  }
}
