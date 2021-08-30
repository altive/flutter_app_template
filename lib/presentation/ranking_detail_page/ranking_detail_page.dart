import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../domain/my_ranking/entities/ranking_member.dart';
import '../../domain/my_ranking/providers/ranking_members_provider.dart';

/// Cardの角丸具合
const _cardRadius = 16.0;

/// 1つのランキングを表示する詳細画面
class RankingDetailPage extends StatelessWidget {
  const RankingDetailPage({
    Key? key,
    required this.rankingId,
  }) : super(key: key);

  static const routeName = 'ranking-detail';

  final String rankingId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Routemaster.of(context).currentRoute.fullPath),
      ),
      body: _Body(rankingId: rankingId),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    Key? key,
    required this.rankingId,
  }) : super(key: key);

  final String rankingId;

  void _onReorder(
    int oldIndex,
    int newIndex,
  ) {}

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return ref.watch(rankingMembersProvider(rankingId)).when(
          loading: () => const _LoadingView(),
          error: (error, stk) => ErrorWidget(error),
          data: (memberDocs) {
            final length = memberDocs.length;
            return ReorderableListView.builder(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              header: Padding(
                padding: const EdgeInsets.symmetric(vertical: 8),
                child: Text(
                  'List',
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              itemCount: length + 1,
              itemBuilder: (_, index) {
                if (length <= index) {
                  return Card(
                    key: const Key(''),
                    margin: const EdgeInsets.symmetric(vertical: 16),
                    child: ListTile(
                      onTap: () => debugPrint,
                      leading: CircleAvatar(
                        backgroundColor: Theme.of(context).colorScheme.primary,
                        child: const Icon(Icons.add),
                      ),
                      title:
                          const Text('Add Item', textAlign: TextAlign.center),
                      trailing: const Icon(null),
                    ),
                  );
                }
                final memberDoc = memberDocs[index];
                return _MemberCard(
                  memberDoc,
                  ranking: index + 1,
                  isFirst: index == 0,
                  isLast: index == length - 1,
                  key: Key(memberDoc.id),
                );
              },
              onReorder: _onReorder,
            );
          },
        );
  }
}

class _MemberCard extends StatelessWidget {
  const _MemberCard(
    this.memberDoc, {
    required this.ranking,
    required this.isFirst,
    required this.isLast,
    Key? key,
  }) : super(key: key);

  final QueryDocumentSnapshot<RankingMember> memberDoc;
  final int ranking;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    const radius = Radius.circular(_cardRadius);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: isFirst ? radius : Radius.zero,
        bottom: isLast ? radius : Radius.zero,
      ),
    );

    final member = memberDoc.data();
    return Card(
      margin: EdgeInsets.zero,
      shape: shape,
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
            text: '$ranking',
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
