import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../commands/overwrite_ranking_member.dart';
import '../../commons/widgets/dismissible_background.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import '../components/image_thumbnail.dart';
import '../components/member_editing_sheet.dart';
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

    void onDismissed(DismissDirection direction) {
      if (direction == DismissDirection.endToStart) {
        memberDoc.reference.delete();
      }
    }

    void onCardTapped() {
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return _UpdateMemberModalBottomSheet(
            rankingId: rankingId,
            memberDoc: memberDoc,
          );
        },
      );
    }

    return RoundedCard(
      isFirst: isFirst,
      isLast: isLast,
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
          contentPadding: const EdgeInsets.fromLTRB(16, 8, 8, 8),
          onTap: onCardTapped,
          title: Text(
            member.title,
            maxLines: 2,
          ),
          leading: Text(
            '$rank位',
            style: Theme.of(context).textTheme.subtitle1!.copyWith(
                  color: Theme.of(context).colorScheme.primary,
                ),
          ),
          trailing: SizedBox(
            // width: 44,
            // height: 70,
            child: ImageThumbnail(imageUrl: member.imageUrl),
          ),
        ),
      ),
    );
  }
}

/// 既存のランキングメンバーを変更するためのシート
class _UpdateMemberModalBottomSheet extends HookConsumerWidget {
  const _UpdateMemberModalBottomSheet({
    Key? key,
    required this.rankingId,
    required this.memberDoc,
  }) : super(key: key);

  final String rankingId;
  final QueryDocumentSnapshot<RankingMember> memberDoc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);

    final member = memberDoc.data();

    void onUpdateButtonPressed({
      required String titleText,
      required String descriptionText,
      XFile? pickedXFile,
      required bool imageRemoved,
    }) {
      if (!formKey.currentState!.validate()) {
        return;
      }
      ref.read(overwriteRankingMember)(
        rankingId: rankingId,
        title: titleText,
        description: descriptionText,
        imageFile: pickedXFile == null ? null : File(pickedXFile.path),
        imageRemoved: imageRemoved,
        doc: memberDoc,
      );
      if (pickedXFile != null) {
        // 写真のアップロードは時間がかかるので表示
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('画像の追加に時間がかかる場合があります。')));
      }
      Navigator.of(context).pop();
    }

    return MemberEditingSheet(
      formKey: formKey,
      sheetTitleLabel: '',
      initialTitleText: member.title,
      initialDescriptionText: member.description,
      imageUrl: member.imageUrl,
      onDoneButtonPressed: onUpdateButtonPressed,
    );
  }
}
