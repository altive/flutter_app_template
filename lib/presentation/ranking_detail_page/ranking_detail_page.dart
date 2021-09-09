import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';

import '../../commons/widgets/dismissible_background.dart';
import '../../domain/my_ranking/entities/ranking.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import '../../domain/my_ranking/providers/my_ranking_members_fetcher.dart';
import '../../domain/my_ranking/providers/my_ranking_provider.dart';
import '../../usecases/update_ranking_rank.dart';
import '../ranking_edit_page/ranking_edit_page.dart';

/// Cardの角丸具合
const _kCardRadius = 16.0;

/// 1つのランキングを表示する詳細画面
class RankingDetailPage extends ConsumerWidget {
  const RankingDetailPage({
    Key? key,
    required this.rankingId,
  }) : super(key: key);

  static const routeName = 'ranking-detail';

  final String rankingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ranking = ref.watch(myRankingProvider(rankingId)).data?.value.data();
    return Scaffold(
      appBar: AppBar(
        title: Text(ranking?.title ?? '...'),
      ),
      body: _Body(
        rankingId: rankingId,
        ranking: ranking,
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({
    Key? key,
    required this.rankingId,
    required this.ranking,
  }) : super(key: key);

  final Ranking? ranking;
  final String rankingId;

  @override
  __BodyState createState() => __BodyState();
}

class __BodyState extends ConsumerState<_Body> {
  static const addIconSize = 32.0;
  static const addIconPadding = 8.0;

  /// 複数のScrollableViewのスクロールを同期させるためのGroup
  late LinkedScrollControllerGroup _scrollControllerGroup;
  late ScrollController _mainScrollController;
  late ScrollController _subScrollController;

  List<QueryDocumentSnapshot<RankingMember>> _memberDocs = [];

  @override
  void initState() {
    _scrollControllerGroup = LinkedScrollControllerGroup();
    _mainScrollController = _scrollControllerGroup.addAndGet();
    _subScrollController = _scrollControllerGroup.addAndGet();
    super.initState();
  }

  @override
  void dispose() {
    _mainScrollController.dispose();
    _subScrollController.dispose();
    super.dispose();
  }

  /// ドラッグで並び替えされた時の処理
  /// 新しい順序をランキングに反映させる
  void _onReorder(
    int oldIndex,
    int newIndex,
  ) {
    // 先にローカルデータを編集（
    // 新しい順番
    final newOrder = oldIndex < newIndex ? newIndex - 1 : newIndex;
    final removedDoc = _memberDocs.removeAt(oldIndex);
    _memberDocs.insert(newOrder, removedDoc);

    // データ側を更新
    ref.read(updateRankingRank)(
      rankingId: widget.rankingId,
      oldIndex: oldIndex,
      newIndex: newIndex,
    );
  }

  @override
  Widget build(BuildContext context) {
    if (widget.ranking == null) {
      return const _LoadingView();
    }
    return ref.watch(myOrderedRankingMembersProvider(widget.rankingId)).when(
          loading: () => const _LoadingView(),
          error: (error, stk) => ErrorWidget(error),
          data: (data) {
            _memberDocs = data;
            final rankingLength = _memberDocs.length;
            return Stack(
              children: [
                Align(
                  alignment: AlignmentDirectional.topEnd,
                  child: ListView.builder(
                    controller: _subScrollController,
                    padding: const EdgeInsets.only(
                      top: 45,
                      right: addIconPadding,
                      bottom: 60,
                    ),
                    itemCount: rankingLength,
                    itemBuilder: (_, index) {
                      return ConstrainedBox(
                        constraints: const BoxConstraints(minHeight: 58),
                        child: IconButton(
                          onPressed: () {
                            showModalBottomSheet<void>(
                              context: context,
                              backgroundColor: Colors.transparent,
                              builder: (context) {
                                return const _AddMemberModalBottomSheet();
                              },
                            );
                          },
                          iconSize: addIconSize,
                          alignment: AlignmentDirectional.centerEnd,
                          icon: const Icon(Icons.add_circle),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width -
                      (addIconSize + addIconPadding * 2),
                  child: ReorderableListView.builder(
                    scrollController: _mainScrollController,
                    padding: const EdgeInsets.only(
                      left: 16,
                      right: 16,
                      bottom: 88, // 多めに取らないと下部が途切れる
                    ),
                    header: const SizedBox(height: 16),
                    itemCount: rankingLength,
                    itemBuilder: (_, index) {
                      final memberDoc = _memberDocs[index];
                      return ConstrainedBox(
                        key: Key(memberDoc.id),
                        constraints: const BoxConstraints(minHeight: 58),
                        child: _MemberCard(
                          memberDoc,
                          rank: index + 1,
                          isFirst: index == 0,
                          isLast: index == rankingLength - 1,
                        ),
                      );
                    },
                    onReorder: _onReorder,
                  ),
                ),
              ],
            );
          },
        );
  }
}

class _MemberCard extends StatelessWidget {
  const _MemberCard(
    this.memberDoc, {
    required this.rank,
    required this.isFirst,
    required this.isLast,
    Key? key,
  }) : super(key: key);

  final QueryDocumentSnapshot<RankingMember> memberDoc;
  final int rank;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(_kCardRadius);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: isFirst ? radius : Radius.zero,
        bottom: isLast ? radius : Radius.zero,
      ),
    );

    final member = memberDoc.data();

    void onDismissed(DismissDirection direction) {
      if (direction == DismissDirection.endToStart) {
        memberDoc.reference.delete();
      }
    }

    return Card(
      margin: EdgeInsets.zero,
      shape: shape,
      child: Dismissible(
        key: Key(memberDoc.id),
        direction: DismissDirection.endToStart,
        onDismissed: onDismissed,
        background: const SizedBox(),
        secondaryBackground: const DismissibleBackground(
          child: Icon(Icons.delete_forever, color: Colors.white),
        ),
        child: ListTile(
          dense: true,
          shape: isLast
              ? null
              : Border(
                  bottom: BorderSide(
                    color: Theme.of(context).scaffoldBackgroundColor,
                  ),
                ),
          contentPadding: const EdgeInsets.symmetric(
            vertical: 4,
            horizontal: 16,
          ),
          onTap: () => debugPrint('OnTap!'),
          leading: const CircleAvatar(radius: 20),
          trailing: const Icon(Icons.drag_handle),
          title: Text.rich(
            TextSpan(
              text: '$rank位',
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    fontWeight: FontWeight.bold,
                    color: Theme.of(context).colorScheme.primary,
                  ),
              children: [
                const WidgetSpan(child: SizedBox(width: 16)),
                TextSpan(
                  text: member.title,
                  style: Theme.of(context).textTheme.bodyText2,
                )
              ],
            ),
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}

class _LoadingView extends HookWidget {
  const _LoadingView({
    Key? key,
  }) : super(key: key);

  static const _length = 6;

  @override
  Widget build(BuildContext context) {
    final animationController = useAnimationController(
      duration: const Duration(milliseconds: 1500),
    );

    final animation = useAnimation(
      ColorTween(
        begin: Colors.grey[50],
        end: Colors.grey[300],
      ).animate(animationController),
    );

    useEffect(() {
      animationController.repeat(reverse: true);
      return null;
    }, const []);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: List.generate(
          _length,
          (index) {
            final isFirst = index == 0;
            final isLast = index == _length - 1;
            const radius = Radius.circular(_kCardRadius);
            final shape = RoundedRectangleBorder(
              borderRadius: BorderRadius.vertical(
                top: isFirst ? radius : Radius.zero,
                bottom: isLast ? radius : Radius.zero,
              ),
            );
            return Card(
              margin: EdgeInsets.zero,
              elevation: 0,
              shape: shape,
              child: ListTile(
                leading: CircleAvatar(
                  backgroundColor: animation,
                ),
                title: Container(
                  width: 100,
                  height: 16,
                  color: animation,
                ),
                trailing: Icon(
                  Icons.chevron_right,
                  color: animation,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}

class _AddMemberModalBottomSheet extends StatelessWidget {
  const _AddMemberModalBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: const BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.fromLTRB(16, 8, 40, 16),
                  child: Text(
                    '〇〇ランキングの1位に追加',
                    style: Theme.of(context).textTheme.headline6,
                  ),
                ),
                Row(
                  children: [
                    const ImageButton(),
                    const Gap(16),
                    Expanded(
                      child: TextFormField(
                        decoration: const InputDecoration(
                          labelText: '名前',
                          // hintText: '2021年買って良かったもの',
                        ),
                        validator: (value) => null,
                        maxLines: 2,
                      ),
                    ),
                  ],
                ),
                const Gap(16),
                TextFormField(
                  maxLines: 50,
                  minLines: 2,
                  decoration: const InputDecoration(
                    labelText: '説明',
                    hintText: 'なぜこの順位に入れたのかや詳しい評価などを書き残しておくと便利です。',
                  ),
                ),
                const Gap(16),
                ElevatedButton(
                  onPressed: () {},
                  child: const Text('Add'),
                ),
              ],
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              onPressed: Navigator.of(context).pop,
              iconSize: 32,
              icon: const Icon(Icons.cancel),
            ),
          ),
        ],
      ),
    );
  }
}

class _AddMemberModal extends StatelessWidget {
  const _AddMemberModal({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Row(
            children: [
              const ImageButton(),
              const Gap(16),
              Expanded(
                child: TextFormField(
                  decoration: const InputDecoration(
                    labelText: '名前',
                    // hintText: '2021年買って良かったもの',
                  ),
                  validator: (value) => null,
                  maxLines: 2,
                ),
              ),
            ],
          ),
          const Gap(16),
          TextFormField(
            maxLines: 50,
            minLines: 2,
            decoration: const InputDecoration(
              labelText: '説明',
              hintText: 'なぜこの順位に入れたのかや詳しい評価などを書き残しておくと便利です。',
            ),
          ),
        ],
      ),
    );
  }
}
