import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../commands/overwrite_ranking_member.dart';
import '../../commands/update_ranking_member_order.dart';
import '../../commons/hooks/use_localization.dart';
import '../../commons/widgets/dismissible_background.dart';
import '../../commons/widgets/image_picker_button.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import '../../domain/validator/validator.dart';

class MemberListView extends ConsumerWidget {
  const MemberListView({
    Key? key,
    required this.mainScrollController,
    required this.rankingId,
    required this.memberDocs,
    required this.addIconSize,
    required this.addIconPadding,
  }) : super(key: key);

  final ScrollController mainScrollController;
  final String rankingId;
  final List<QueryDocumentSnapshot<RankingMember>> memberDocs;
  final double addIconSize;
  final double addIconPadding;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    /// ドラッグで並び替えされた時の処理
    /// 新しい順序をランキングに反映させる
    void _onReorder(
      int oldIndex,
      int droppedIndex,
    ) {
      // ローカルデータを編集
      // 新しい順番
      final newIndex =
          oldIndex < droppedIndex ? droppedIndex - 1 : droppedIndex;
      final movingDoc = memberDocs.removeAt(oldIndex);
      memberDocs.insert(newIndex, movingDoc);

      // データ側を更新
      ref.read(updateRankingMemberOrder)(
        rankingId: rankingId,
        memberId: movingDoc.id,
        memberDocs: memberDocs,
        oldMember: movingDoc.data(),
        newIndex: newIndex,
      );
    }

    if (memberDocs.isEmpty) {
      return const _EmptyView();
    }

    return SizedBox(
      width: MediaQuery.of(context).size.width -
          (addIconSize + addIconPadding * 2),
      child: ReorderableListView.builder(
        scrollController: mainScrollController,
        onReorder: _onReorder,
        padding: const EdgeInsets.only(
          left: 16,
          right: 16,
          bottom: 88, // 多めに取らないと下部が途切れる
        ),
        header: const SizedBox(height: 32),
        itemCount: memberDocs.length,
        itemBuilder: (_, index) {
          final memberDoc = memberDocs[index];
          return ConstrainedBox(
            key: Key(memberDoc.id),
            constraints: const BoxConstraints(minHeight: 58),
            child: _MemberCard(
              memberDoc,
              rankingId: rankingId,
              rank: index + 1,
              isFirst: index == 0,
              isLast: index == memberDocs.length - 1,
            ),
          );
        },
      ),
    );
  }
}

class _MemberCard extends StatelessWidget {
  const _MemberCard(
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
    const radius = Radius.circular(16);
    final shape = RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
        top: isFirst ? radius : Radius.zero,
        bottom: isLast ? radius : Radius.zero,
      ),
    );

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

    return Card(
      margin: EdgeInsets.zero,
      shape: shape,
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
          onTap: onCardTapped,
          leading: CircleAvatar(
            radius: 20,
            backgroundImage: member.imageUrl == null
                ? null
                : CachedNetworkImageProvider(member.imageUrl!),
          ),
          trailing: const Icon(Icons.drag_handle),
          title: Text.rich(
            TextSpan(
              text: '$rank位',
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
      ),
    );
  }
}

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
    final l10n = useL10n();
    final pickedImageNotifier = useState<XFile?>(null);
    final imageRemovedNotifier = useState(false);

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final member = memberDoc.data();
    final titleController = useTextEditingController(text: member.title);
    final descriptionController =
        useTextEditingController(text: member.description);

    void onUpdateButtonPressed() {
      if (!formKey.currentState!.validate()) {
        return;
      }
      final pickedFile = pickedImageNotifier.value;
      ref.read(overwriteRankingMember)(
        rankingId: rankingId,
        title: titleController.text,
        description: descriptionController.text,
        imageFile: pickedFile == null ? null : File(pickedFile.path),
        imageRemoved: imageRemovedNotifier.value,
        doc: memberDoc,
      );
      if (pickedFile != null) {
        // 写真のアップロードは時間がかかるので表示
        ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('画像の追加に時間がかかる場合があります。')));
      }
      Navigator.of(context).pop();
    }

    return Container(
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surface,
        borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
      ),
      child: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Form(
              key: formKey,
              child: Column(
                children: [
                  const Gap(32),
                  TextFormField(
                    controller: titleController,
                    decoration: const InputDecoration(
                      labelText: '名前（必須）',
                    ),
                    validator: ref.read(validatorProvider).isNotEmpty,
                    autovalidateMode: AutovalidateMode.onUserInteraction,
                  ),
                  const Gap(16),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ImagePickerButton(
                        imageFile: pickedImageNotifier.value,
                        imageUrl:
                            imageRemovedNotifier.value ? null : member.imageUrl,
                        onImageChanged: (file) {
                          pickedImageNotifier.value = file;
                          imageRemovedNotifier.value = false;
                        },
                        onImageRemoved: () {
                          pickedImageNotifier.value = null;
                          imageRemovedNotifier.value = true;
                        },
                      ),
                      const Gap(16),
                      Expanded(
                        child: TextFormField(
                          controller: descriptionController,
                          maxLines: 50,
                          minLines: 2,
                          decoration: const InputDecoration(
                            labelText: '説明や理由',
                            hintText: 'なぜこの順位に入れたのかや詳しい評価などを書き残しておくと便利です。',
                          ),
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  ElevatedButton(
                    onPressed: titleController.text.isEmpty
                        ? null
                        : onUpdateButtonPressed,
                    child: Text(l10n.buttonUpdate),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: AlignmentDirectional.topEnd,
            child: IconButton(
              onPressed: Navigator.of(context).pop,
              iconSize: 32,
              icon: const Icon(Icons.cancel),
            ),
          ),
        ],
      ),
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
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Row(
        children: [
          Flexible(
            child: Text(
              'まずは1位から追加しましょう',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
          const Gap(8),
          const Icon(Icons.arrow_forward),
        ],
      ),
    );
  }
}
