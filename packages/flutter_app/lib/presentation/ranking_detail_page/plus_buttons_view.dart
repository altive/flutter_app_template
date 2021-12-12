import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../commands/add_renking_member.dart';
import '../../commons/hooks/use_localization.dart';
import '../../commons/widgets/image_picker_button.dart';
import '../../domain/my_ranking/entities/ranking_member.dart';
import '../../domain/validator/validator.dart';

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
          bottom: 60,
        ),
        itemCount: memberDocs.length + 1,
        itemBuilder: (_, index) {
          return ConstrainedBox(
            constraints: const BoxConstraints(minHeight: 58),
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
    final l10n = useL10n();
    final pickedImageNotifier = useState<XFile?>(null);

    final formKey = useMemoized(GlobalKey<FormState>.new);

    final targetRank = targetIndex + 1;
    final titleController = useTextEditingController();
    final descriptionController = useTextEditingController();

    void onAddButtonPressed() {
      if (!formKey.currentState!.validate()) {
        return;
      }
      final pickedFile = pickedImageNotifier.value;
      ref.read(createRankingMember)(
        rankingId: rankingId,
        title: titleController.text,
        description: descriptionController.text,
        imageFile: pickedFile == null ? null : File(pickedFile.path),
        targetIndex: targetIndex,
        memberDocs: memberDocs,
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
                  Padding(
                    padding: const EdgeInsets.fromLTRB(16, 8, 40, 16),
                    child: Text(
                      '$targetRank位に追加',
                      style: Theme.of(context).textTheme.headline6,
                    ),
                  ),
                  Row(
                    children: [
                      ImagePickerButton(
                        imageFile: pickedImageNotifier.value,
                        onImageChanged: (file) {
                          pickedImageNotifier.value = file;
                        },
                        onImageRemoved: () {
                          pickedImageNotifier.value = null;
                        },
                      ),
                      const Gap(16),
                      Expanded(
                        child: TextFormField(
                          controller: titleController,
                          decoration: const InputDecoration(
                            labelText: '名前（必須）',
                          ),
                          validator: ref.read(validatorProvider).isNotEmpty,
                        ),
                      ),
                    ],
                  ),
                  const Gap(16),
                  TextFormField(
                    controller: descriptionController,
                    maxLines: 50,
                    minLines: 2,
                    decoration: const InputDecoration(
                      labelText: '説明',
                      hintText: 'なぜこの順位に入れたのかや詳しい評価などを書き残しておくと便利です。',
                    ),
                  ),
                  const Gap(16),
                  ElevatedButton(
                    onPressed: titleController.text.isEmpty
                        ? null
                        : onAddButtonPressed,
                    child: Text(l10n.buttonAdd),
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
