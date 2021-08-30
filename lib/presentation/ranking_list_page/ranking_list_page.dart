import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../domain/my_ranking/entities/ranking.dart';
import '../../domain/my_ranking/providers/rankings_provider.dart';
import '../ranking_detail_page/ranking_detail_page.dart';

/// Cardの角丸具合
const _cardRadius = 16.0;

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
                  // TODO(riscait): 新規ランキング追加
                  onTap: () => debugPrint,
                  leading: CircleAvatar(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    child: const Icon(Icons.add),
                  ),
                  title: const Text(
                    'Add New Ranking',
                    textAlign: TextAlign.center,
                  ),
                  trailing: const Icon(null),
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
    const radius = Radius.circular(_cardRadius);
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
        contentPadding: const EdgeInsets.symmetric(
          vertical: 4,
          horizontal: 16,
        ),
        leading: const CircleAvatar(radius: 20),
        trailing: const Icon(Icons.chevron_right),
        title: Text(
          ranking.title,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
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
            const radius = Radius.circular(_cardRadius);
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
