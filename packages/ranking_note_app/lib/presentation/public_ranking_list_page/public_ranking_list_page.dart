import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../domain/my_ranking/providers/my_rankings_fetcher.dart';
import 'ranking_card.dart';

/// 自分以外のランキングをリスト表示する画面
class PublicRankingListPage extends StatelessWidget {
  const PublicRankingListPage({Key? key}) : super(key: key);

  static const routeName = 'rankings';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('New Rankings')),
      body: const _Body(),
    );
  }
}

/// ランキングを表示するコンテンツエリア。
class _Body extends ConsumerWidget {
  const _Body({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(myRankingsFetcher);

    return asyncValue.when(
      loading: () => const _LoadingView(),
      error: (error, stk) => ErrorWidget(error),
      data: (snapshots) {
        if (snapshots.isEmpty) {
          return const _EmptyView();
        }
        final length = snapshots.length;
        final lastDoc = snapshots.last;
        return NotificationListener<ScrollEndNotification>(
          onNotification: (notification) {
            if (notification.metrics.extentAfter == 0) {
              ref.read(myRankingsFetcher.notifier).next(lastDoc);
              return true;
            }
            return false;
          },
          child: ListView.builder(
            padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
            itemCount: length,
            itemBuilder: (_, index) {
              final rankingDoc = snapshots[index];
              return RankingCard(
                rankingDoc,
                isFirst: index == 0,
                isLast: index == length - 1,
              );
            },
          ),
        );
      },
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
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Text(
            '😢',
            style: Theme.of(context).textTheme.headline1,
          ),
          const Gap(16),
          Text(
            '条件に一致するランキングがありませんでした。。',
            style: Theme.of(context).textTheme.headline6,
          ),
        ],
      ),
    );
  }
}

/// 読み込み中に表示するスケルトン表示。
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
