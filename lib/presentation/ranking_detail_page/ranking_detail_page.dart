import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:linked_scroll_controller/linked_scroll_controller.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

import '../../domain/my_ranking/entities/ranking.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import '../../domain/my_ranking/providers/my_ranking_members_fetcher.dart';
import '../../domain/my_ranking/providers/my_ranking_provider.dart';
import 'member_list_view.dart';
import 'plus_buttons_view.dart';
import 'ranking_editing_sheet.dart';

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
    final doc = ref.watch(myRankingProvider(rankingId)).value;
    final ranking = doc?.data();
    return Scaffold(
      appBar: AppBar(
        title: Text(ranking?.title ?? '...'),
        actions: [
          IconButton(
            onPressed: () {
              showCupertinoModalBottomSheet<void>(
                context: context,
                expand: false,
                useRootNavigator: true,
                // bounce: true,
                builder: (context) {
                  return RankingEditingSheet(doc: doc!);
                },
              );
            },
            icon: const Icon(Icons.more_horiz),
          ),
        ],
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

  @override
  Widget build(BuildContext context) {
    if (widget.ranking == null) {
      return const _LoadingView();
    }
    return ref.watch(myRankingMembersProvider(widget.rankingId)).when(
          loading: () => const _LoadingView(),
          error: (error, stk) => ErrorWidget(error),
          data: (data) {
            _memberDocs = data.docs;
            return Stack(
              children: [
                PlusButtonsView(
                  subScrollController: _subScrollController,
                  rankingId: widget.rankingId,
                  memberDocs: _memberDocs,
                  addIconSize: addIconSize,
                  addIconPadding: addIconPadding,
                ),
                MemberListView(
                  mainScrollController: _mainScrollController,
                  rankingId: widget.rankingId,
                  memberDocs: _memberDocs,
                  addIconSize: addIconSize,
                  addIconPadding: addIconPadding,
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
