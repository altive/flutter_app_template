import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../domain/my_ranking/entities/ranking.dart';
import '../../domain/my_ranking/providers/my_ranking_members_fetcher.dart';
import '../../domain/my_ranking/providers/my_ranking_provider.dart';
import '../components/rounded_card.dart';
import 'member_card.dart';

/// 自分以外のランキング1つを詳細に表示する画面
class PublicRankingDetailPage extends ConsumerWidget {
  const PublicRankingDetailPage({
    Key? key,
    required this.rankingId,
  }) : super(key: key);

  static const routeName = 'ranking';
  static const routeNameByPreview = 'preview';

  final String rankingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final doc = ref.watch(myRankingProvider(rankingId)).value;
    final ranking = doc?.data();
    final rankingImageUrl = ranking?.imageUrl;
    final isPreview =
        Routemaster.of(context).currentRoute.path.contains(routeNameByPreview);
    return Scaffold(
      body: SafeArea(
        child: ranking == null
            ? const _LoadingView()
            : CustomScrollView(
                slivers: [
                  SliverAppBar(
                    title: Text(ranking.title),
                    pinned: true,
                    expandedHeight: rankingImageUrl == null
                        ? null
                        : MediaQuery.of(context).size.width,
                    flexibleSpace: rankingImageUrl == null
                        ? null
                        : FlexibleSpaceBar(
                            background:
                                CachedNetworkImage(imageUrl: rankingImageUrl),
                          ),
                  ),
                  _SliverListView(rankingDoc: doc!),
                  const SliverGap(16),
                  // レコメンドなど
                  SliverList(
                    delegate: SliverChildListDelegate.fixed(
                      [
                        if (!isPreview)
                          Card(
                            margin: const EdgeInsets.symmetric(horizontal: 16),
                            child: ListTile(
                              title: const Text('あなたならどんな順位になりますか？'),
                              subtitle: const Text('同じタイトルのランキングを作りましょう！'),
                              trailing:
                                  const Icon(Icons.app_registration_rounded),
                              onTap: () {},
                            ),
                          ),
                      ],
                    ),
                  ),
                  const SliverGap(16),
                ],
              ),
      ),
    );
  }
}

class _SliverListView extends HookConsumerWidget {
  const _SliverListView({
    Key? key,
    required this.rankingDoc,
  }) : super(key: key);

  final DocumentSnapshot<Ranking> rankingDoc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // ランキングメンバーリストを取得
    return ref.watch(myRankingMembersProvider(rankingDoc.id)).when(
          loading: () => const SliverGap(0),
          error: (error, stk) => ErrorWidget(error),
          data: (data) {
            final memberDocs = data.docs;
            return SliverList(
              delegate: SliverChildBuilderDelegate(
                (context, index) {
                  if (index == 0) {
                    return _DescriptionCard(ranking: rankingDoc.data()!);
                  }
                  final memberDoc = memberDocs[index - 1];
                  return MemberCard(
                    memberDoc,
                    rankingId: memberDoc.id,
                    rank: index,
                    isFirst: false,
                    isLast: index == memberDocs.length,
                  );
                },
                childCount: memberDocs.length + 1,
              ),
            );
          },
        );
  }
}

class _DescriptionCard extends StatelessWidget {
  const _DescriptionCard({
    Key? key,
    required this.ranking,
  }) : super(key: key);

  final Ranking ranking;

  @override
  Widget build(BuildContext context) {
    return RoundedCard(
      isLast: false,
      radius: const Radius.circular(40),
      padding: const EdgeInsets.fromLTRB(16, 16, 16, 24),
      child: Column(
        children: [
          Row(
            children: [
              const CircleAvatar(
                  // backgroundImage: ,
                  ),
              const Gap(16),
              Text(
                'ランキング作成者名',
                style: Theme.of(context).textTheme.subtitle1,
              ),
            ],
          ),
          const Gap(16),
          Text(ranking.description),
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton.icon(
                onPressed: () {},
                icon: const Icon(Icons.favorite_border),
                label: const Text('1'),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.ios_share),
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(Icons.content_copy),
              ),
            ],
          )
        ],
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
            return RoundedCard(
              isFirst: index == 0,
              isLast: index == _length - 1,
              child: ListTile(
                leading: CircleAvatar(backgroundColor: animation),
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
