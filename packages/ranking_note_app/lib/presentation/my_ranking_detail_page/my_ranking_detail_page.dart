import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../commands/append_ranking_tag.dart';
import '../../commands/remove_ranking_tag.dart';
import '../../domain/my_ranking/entities/ranking.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import '../../domain/my_ranking/providers/my_ranking_members_fetcher.dart';
import '../../domain/my_ranking/providers/my_ranking_provider.dart';
import '../components/ranking_tags.dart';
import '../components/rounded_card.dart';
import '../router/router.dart';
import 'app_bar_action_menu.dart';
import 'member_list_view.dart';
import 'plus_buttons_view.dart';
import 'ranking_editing_sheet.dart';

/// 自分のランキング1つを詳細に表示する画面
class MyRankingDetailPage extends ConsumerWidget {
  const MyRankingDetailPage({
    Key? key,
    required this.rankingId,
  }) : super(key: key);

  static const routeName = 'my-ranking';

  final String rankingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doc = ref.watch(myRankingProvider(rankingId)).value;
    final ranking = doc?.data();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text(ranking?.title ?? '...'),
          actions: [
            PopupMenuButton<AppBarActionMenu>(
              onSelected: (menu) {
                switch (menu) {
                  case AppBarActionMenu.preview:
                    // 他人から見たランキングをプレビューできる
                    ref.read(routerProvider).navigateToMyRankingPreviewPage(
                          rankingId: rankingId,
                        );
                    break;
                  case AppBarActionMenu.edit:
                    showCupertinoModalBottomSheet<void>(
                      context: context,
                      expand: false,
                      useRootNavigator: true,
                      // bounce: true,
                      builder: (context) {
                        return RankingEditingSheet(doc: doc!);
                      },
                    );
                    break;
                }
              },
              itemBuilder: (context) {
                return [
                  for (final menu in AppBarActionMenu.values)
                    PopupMenuItem(
                      value: menu,
                      child: Text(menu.label),
                    ),
                ];
              },
            ),
          ],
        ),
        body: ranking == null
            ? const _LoadingView()
            : _Body(
                rankingDoc: doc!,
              ),
      ),
    );
  }
}

class _Body extends ConsumerStatefulWidget {
  const _Body({
    Key? key,
    required this.rankingDoc,
  }) : super(key: key);

  final DocumentSnapshot<Ranking> rankingDoc;

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

  @override
  Widget build(BuildContext context) {
    final rankingDoc = widget.rankingDoc;
    final ranking = rankingDoc.data()!;
    return ref.watch(myRankingMembersProvider(rankingDoc.id)).when(
          loading: () => const _LoadingView(),
          error: (error, stk) => ErrorWidget(error),
          data: (data) {
            _memberDocs = data.docs;
            return Stack(
              children: [
                PlusButtonsView(
                  subScrollController: _subScrollController,
                  rankingId: rankingDoc.id,
                  memberDocs: _memberDocs,
                  addIconSize: addIconSize,
                  addIconPadding: addIconPadding,
                ),
                MemberListView(
                  mainScrollController: _mainScrollController,
                  rankingId: rankingDoc.id,
                  memberDocs: _memberDocs,
                  addIconSize: addIconSize,
                  addIconPadding: addIconPadding,
                ),
                if (ranking.recommendTags.isNotEmpty &&
                    ranking.recommendTagsShowing)
                  Container(
                    alignment: Alignment.bottomCenter,
                    margin: const EdgeInsets.symmetric(
                      vertical: 8,
                      horizontal: 32,
                    ),
                    child: SafeArea(
                      child: RoundedCard(
                        padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const Gap(8),
                                Text(
                                  'ランキングに合ったタグを選択しましょう',
                                  style: Theme.of(context).textTheme.caption,
                                ),
                                IconButton(
                                  onPressed: () {},
                                  color: Theme.of(context).disabledColor,
                                  icon: const Icon(Icons.cancel),
                                ),
                              ],
                            ),
                            RankingTags(
                              tags: ranking.recommendTags,
                              onTagPressed: (tag) {
                                ref.read(appendRankingTagProvider)(
                                  rankingId: rankingDoc.id,
                                  tag: tag,
                                );
                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    action: SnackBarAction(
                                      label: '取り消す',
                                      onPressed: () =>
                                          ref.read(removeRankingTagProvider)(
                                        rankingId: rankingDoc.id,
                                        tag: tag,
                                      ),
                                    ),
                                    content: Text('$tagを追加しました。'),
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
              ],
            );
          },
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
        begin: Theme.of(context).colorScheme.background,
        end: Theme.of(context).colorScheme.surface,
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
            const radius = Radius.circular(16);
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
