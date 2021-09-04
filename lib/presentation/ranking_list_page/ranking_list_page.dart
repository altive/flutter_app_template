import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../commons/widgets/dismissible_background.dart';
import '../../domain/my_ranking/entities/ranking.dart';
import '../../domain/my_ranking/providers/rankings_provider.dart';
import '../../usecases/create_ranking_from_title.dart';
import '../ranking_detail_page/ranking_detail_page.dart';

/// Cardの角丸具合
const _kCardRadius = 16.0;

/// 複数ランキングを表示するリストページ
class RankingListPage extends StatelessWidget {
  const RankingListPage({Key? key}) : super(key: key);

  static const routeName = 'ranking-list';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Routemaster.of(context).currentRoute.fullPath),
      ),
      body: const _Body(),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(rankingsProvider);

    return asyncValue.when(
      loading: () => const _LoadingView(),
      error: (error, stk) => ErrorWidget(error),
      data: (rankingDocs) {
        final length = rankingDocs.length;
        return ListView.builder(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          itemCount: length + 1,
          itemBuilder: (_, index) {
            if (length <= index) {
              // 追加促しボタン
              return Card(
                key: const Key(''),
                margin: const EdgeInsets.symmetric(vertical: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Icon(Icons.add),
                  ),
                  title: TextField(
                    onSubmitted: (value) =>
                        ref.read(createRankingFromTitle)(value),
                    decoration: const InputDecoration(
                      filled: false,
                      contentPadding: EdgeInsets.zero,
                      hintText: '何のランキングを追加しますか？',
                    ),
                  ),
                ),
              );
            }
            final rankingDoc = rankingDocs[index];
            return _RankingCard(
              rankingDoc,
              isFirst: index == 0,
              isLast: index == length - 1,
            );
          },
        );
      },
    );
  }
}

class _RankingCard extends ConsumerWidget {
  const _RankingCard(
    this.rankingDoc, {
    required this.isFirst,
    required this.isLast,
    Key? key,
  }) : super(key: key);

  final QueryDocumentSnapshot<Ranking> rankingDoc;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    void onDismissed(DismissDirection direction) {
      if (direction == DismissDirection.endToStart) {
        rankingDoc.reference.delete();
      }
    }

    Future<bool?> confirmDismiss(DismissDirection direction) async {
      if (direction == DismissDirection.endToStart) {
        debugPrint('Delete!!');
        return true;
      }
      if (direction == DismissDirection.startToEnd) {
        debugPrint('Pinned!!');
        final oldRanking = rankingDoc.data();
        final newRanking = oldRanking.copyWith(pinned: !oldRanking.pinned);
        await rankingDoc.reference.set(newRanking);
        return false;
      }
    }

    const radius = Radius.circular(_kCardRadius);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: isFirst ? radius : Radius.zero,
        bottom: isLast ? radius : Radius.zero,
      ),
    );
    final ranking = rankingDoc.data();

    return Card(
      margin: isFirst ? const EdgeInsets.only(top: 16) : EdgeInsets.zero,
      shape: shape,
      clipBehavior: isFirst || isLast ? Clip.antiAlias : null,
      child: IconTheme(
        data: const IconThemeData(color: Colors.white),
        child: Dismissible(
          key: Key(rankingDoc.id),
          direction: DismissDirection.horizontal,
          onDismissed: onDismissed,
          confirmDismiss: confirmDismiss,
          background: DismissibleBackground(
            backgroundColor: Colors.orange,
            alignment: Alignment.centerLeft,
            child: Icon(
              ranking.pinned
                  ? CupertinoIcons.pin_slash_fill
                  : CupertinoIcons.pin_fill,
            ),
          ),
          secondaryBackground: const DismissibleBackground(
            child: Icon(Icons.delete_forever),
          ),
          child: ListTile(
            onTap: () {
              Routemaster.of(context)
                  .push('${RankingDetailPage.routeName}/${rankingDoc.id}');
            },
            dense: true,
            shape: isLast
                ? null
                : Border(
                    bottom: BorderSide(
                      color: Theme.of(context).scaffoldBackgroundColor,
                    ),
                  ),
            contentPadding: const EdgeInsets.fromLTRB(8, 4, 16, 4),
            leading: Wrap(
              crossAxisAlignment: WrapCrossAlignment.center,
              children: [
                if (ranking.pinned)
                  const Icon(
                    CupertinoIcons.pin_fill,
                    size: 20,
                    color: Colors.orange,
                  )
                else
                  Icon(
                    CupertinoIcons.pin_fill,
                    size: 20,
                    color: Colors.grey[300],
                  ),
                const SizedBox(width: 6),
                const CircleAvatar(radius: 20),
              ],
            ),
            trailing: const Icon(Icons.chevron_right),
            title: Text(
              ranking.title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
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
