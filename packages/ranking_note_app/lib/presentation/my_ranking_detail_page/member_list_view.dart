import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../commands/update_ranking_member_order.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import 'member_card.dart';

class MemberListView extends ConsumerWidget {
  const MemberListView({
    Key? key,
    required this.mainScrollController,
    required this.rankingId,
    required this.memberDocs,
    required this.addIconSize,
    required this.addIconPadding,
  }) : super(key: key);

  final ScrollController mainScrollController;
  final String rankingId;
  final List<QueryDocumentSnapshot<RankingMember>> memberDocs;
  final double addIconSize;
  final double addIconPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ドラッグで並び替えされた時の処理
    /// 新しい順序をランキングに反映させる
    void _onReorder(
      int oldIndex,
      int droppedIndex,
    ) {
      // ローカルデータを編集
      // 新しい順番
      final newIndex =
          oldIndex < droppedIndex ? droppedIndex - 1 : droppedIndex;
      final movingDoc = memberDocs.removeAt(oldIndex);
      memberDocs.insert(newIndex, movingDoc);

      // データ側を更新
      ref.read(updateRankingMemberOrder)(
        rankingId: rankingId,
        memberId: movingDoc.id,
        memberDocs: memberDocs,
        oldMember: movingDoc.data(),
        newIndex: newIndex,
      );
    }

    if (memberDocs.isEmpty) {
      return const _EmptyView();
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width -
          (addIconSize + addIconPadding * 2),
      child: ReorderableListView.builder(
        scrollController: mainScrollController,
        onReorder: _onReorder,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 88, // 多めに取らないと下部が途切れる
        ),
        header: const SizedBox(height: 32),
        itemCount: memberDocs.length,
        itemBuilder: (_, index) {
          final memberDoc = memberDocs[index];
          return ConstrainedBox(
            key: Key(memberDoc.id),
            constraints: const BoxConstraints(minHeight: 58),
            child: MemberCard(
              memberDoc,
              rankingId: rankingId,
              rank: index + 1,
              isFirst: index == 0,
              isLast: index == memberDocs.length - 1,
            ),
          );
        },
      ),
    );
  }
}

/// ランキングが1つも登録されていない時の表示。
class _EmptyView extends StatelessWidget {
  const _EmptyView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Flexible(
            child: Text(
              'まずは1位から追加しましょう',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Gap(8),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
