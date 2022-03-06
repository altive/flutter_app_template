import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../commands/add_renking_member.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import '../components/member_editing_sheet.dart';

class PlusButtonsView extends StatelessWidget {
  const PlusButtonsView({
    Key? key,
    required ScrollController subScrollController,
    required this.rankingId,
    required this.memberDocs,
    required this.addIconSize,
    required this.addIconPadding,
  })  : _subScrollController = subScrollController,
        super(key: key);

  final ScrollController _subScrollController;
  final String rankingId;
  final List<QueryDocumentSnapshot<RankingMember>> memberDocs;
  final double addIconSize;
  final double addIconPadding;

  @override
  Widget build(BuildContext context) {
    void onPressed(int index) {
      if (memberDocs.length >= 10) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text('最大10個となっております。スワイプで削除できます')),
        );
        return;
      }
      showModalBottomSheet<void>(
        context: context,
        backgroundColor: Colors.transparent,
        builder: (context) {
          return _AddMemberModalBottomSheet(
            rankingId: rankingId,
            targetIndex: index,
            memberDocs: memberDocs,
          );
        },
      );
    }

    return Align(
      alignment: AlignmentDirectional.topEnd,
      child: ListView.builder(
        controller: _subScrollController,
        padding: EdgeInsets.only(
          right: addIconPadding,
        ),
        itemCount: memberDocs.length + 1,
        itemBuilder: (_, index) {
          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 64),
            child: IconButton(
              onPressed: () => onPressed(index),
              iconSize: addIconSize,
              alignment: AlignmentDirectional.centerEnd,
              icon: const Icon(Icons.add_circle),
            ),
          );
        },
      ),
    );
  }
}

/// 新しいランキングメンバーを追加するためのシート
class _AddMemberModalBottomSheet extends HookConsumerWidget {
  const _AddMemberModalBottomSheet({
    Key? key,
    required this.rankingId,
    required this.targetIndex,
    required this.memberDocs,
  }) : super(key: key);

  final String rankingId;
  final int targetIndex;
  final List<QueryDocumentSnapshot<RankingMember>> memberDocs;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final formKey = useMemoized(GlobalKey<FormState>.new);
    final targetRank = targetIndex + 1;

    void onDoneButtonPressed({
      required String titleText,
      required String descriptionText,
      XFile? pickedXFile,
      required bool imageRemoved,
    }) {
      if (!formKey.currentState!.validate()) {
        return;
      }
      ref.read(createRankingMember)(
        rankingId: rankingId,
        title: titleText,
        description: descriptionText,
        imageFile: pickedXFile == null ? null : File(pickedXFile.path),
        targetIndex: targetIndex,
        memberDocs: memberDocs,
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
      sheetTitleLabel: '$targetRank位に追加',
      onDoneButtonPressed: onDoneButtonPressed,
    );
  }
}
