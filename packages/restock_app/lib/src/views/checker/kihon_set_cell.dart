import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../models/remote_config/recommend_stock_set_parameter.dart';
import 'checker_controller.dart';
import 'recommend_detail/recommend_detail_controller.dart';
import 'recommend_detail/recommend_detail_page.dart';

class KihonSetCell extends HookConsumerWidget {
  const KihonSetCell({
    required this.rice,
    required this.water,
  });

  final double rice;
  final int water;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(checkerProvider);

    final familyCount = state.manCount + state.womanCount + state.childCount;
    final kihonSet = RecommendStockSet(
      title: '3日分の無洗米と水をストック',
      subtitle: 'まずはこれから始めましょう♪',
      description: '''
家族$familyCount人分に必要な無洗米は${rice}kg、
水は$waterℓ、2Lのミネラルウォーター${water ~/ 2}本分です。
      ''',
      iconName: 'rice',
      itemList: const [
        RecommendStockSetItem(
          asin: 'B01BEPNPF6',
          description:
              'ミネラルウォーターは賞味期限が切れても基本的に衛生面に問題はありません。蒸発による内容量の減少があるため期限の表示があります。',
        ),
        RecommendStockSetItem(
          asin: 'B01E9SJYKU',
          description: '長期保存できる「無洗米」があれば貴重な水を使わずにすみます。',
        ),
      ],
    );
    return ListTile(
      leading: Icon(MdiIcons.fromString(kihonSet.iconName)),
      title: Text(kihonSet.title),
      subtitle: Text(kihonSet.subtitle),
      trailing: const Icon(MdiIcons.chevronRight),
      onTap: () => navigateDetailPage(ref, context, kihonSet: kihonSet),
    );
  }

  /// お勧め商品セットの詳細説明ページへ遷移
  void navigateDetailPage(
    WidgetRef ref,
    BuildContext context, {
    required RecommendStockSet kihonSet,
  }) {
    ref.read(recommendDetailParameterProvider.state).state = kihonSet;
    Navigator.of(context).pushNamed(RecommendDetailPage.routeName);
  }
}
