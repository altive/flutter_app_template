import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import '../../domain/my_ranking/entities/ranking_member.dart';
import '../components/image_thumbnail.dart';
import '../components/rounded_card.dart';

class MemberCard extends StatelessWidget {
  const MemberCard(
    this.memberDoc, {
    required this.rankingId,
    required this.rank,
    required this.isFirst,
    required this.isLast,
    Key? key,
  }) : super(key: key);

  final String rankingId;
  final QueryDocumentSnapshot<RankingMember> memberDoc;
  final int rank;
  final bool isFirst;
  final bool isLast;

  @override
  Widget build(BuildContext context) {
    final member = memberDoc.data();

    return RoundedCard(
      isFirst: isFirst,
      isLast: isLast,
      radius: const Radius.circular(32),
      padding: const EdgeInsets.all(32),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                '第$rank位',
                style: Theme.of(context).textTheme.subtitle1,
              ),
              const Gap(16),
              Flexible(
                child: Text(
                  member.title,
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
            ],
          ),
          if (member.imageUrl != null) ...[
            const Gap(16),
            Center(
              child: LayoutBuilder(builder: (context, constraints) {
                return ImageThumbnail(
                  imageUrl: member.imageUrl,
                  width: constraints.maxWidth * 0.8,
                );
              }),
            ),
          ],
          if (member.description.isNotEmpty) ...[
            const Gap(16),
            Text(member.description),
          ],
        ],
      ),
    );
  }
}
