import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:routemaster/routemaster.dart';

import '../../commands/delete_ranking.dart';
import '../../commands/overwrite_ranking.dart';
import '../../commons/hooks/use_localization.dart';
import '../../commons/widgets/image_picker_button.dart';
import '../../domain/my_ranking/entities/ranking.dart';
import '../../domain/validator/validator.dart';

class RankingEditingSheet extends HookConsumerWidget {
  const RankingEditingSheet({
    Key? key,
    required this.doc,
  }) : super(key: key);

  final DocumentSnapshot<Ranking> doc;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final l10n = useL10n();
    final ranking = doc.data()!;
    final titleController = useTextEditingController(text: ranking.title);
    final descriptionController =
        useTextEditingController(text: ranking.description);
    final pickedImageNotifier = useState<XFile?>(null);
    final imageRemovedNotifier = useState(false);

    final formKey = useMemoized(GlobalKey<FormState>.new);

    void onDone() {
      if (!formKey.currentState!.validate()) {
        return;
      }
      final pickedFile = pickedImageNotifier.value;
      ref.read(overwriteRankingProvider)(
        title: titleController.text,
        description: descriptionController.text,
        imageFile: pickedFile == null ? null : File(pickedFile.path),
        imageRemoved: imageRemovedNotifier.value,
        doc: doc,
      );
      Navigator.of(context).pop();
    }

    void onDelete() {
      showDialog<void>(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(l10n.rankingDeleteDialogLabel),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text(l10n.buttonCancel),
              ),
              TextButton(
                onPressed: () {
                  ref.read(deleteRankingProvider)(rankingId: doc.id);
                  // Dialogを閉じる
                  Navigator.of(context).pop();
                  // Modal Sheetを閉じる
                  Navigator.of(context).pop();
                  // リスト画面へ戻る
                  Routemaster.of(context).pop();
                },
                child: Text(l10n.buttonDelete),
              ),
            ],
          );
        },
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Ranking'),
        leading: TextButton(
          onPressed: Navigator.of(context).pop,
          child: Text(l10n.buttonCancel),
        ),
        leadingWidth: 80,
        actions: [
          TextButton(
            onPressed: titleController.text.isEmpty ? null : onDone,
            child: Text(l10n.buttonDone),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Theme.of(context).colorScheme.surface,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Column(
                    children: [
                      ImagePickerButton(
                        imageFile: pickedImageNotifier.value,
                        imageUrl: imageRemovedNotifier.value
                            ? null
                            : ranking.imageUrl,
                        onImageChanged: (file) {
                          pickedImageNotifier.value = file;
                          imageRemovedNotifier.value = false;
                        },
                        onImageRemoved: () {
                          pickedImageNotifier.value = null;
                          imageRemovedNotifier.value = true;
                        },
                      ),
                      const Gap(24),
                      TextFormField(
                        controller: titleController,
                        validator: ref.read(validatorProvider).isNotEmpty,
                        decoration: const InputDecoration(
                          label: Text('ランキング名'),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                      const Gap(16),
                      TextFormField(
                        controller: descriptionController,
                        minLines: 2,
                        maxLines: 10,
                        decoration: const InputDecoration(
                          label: Text('ランキングの説明'),
                          floatingLabelBehavior: FloatingLabelBehavior.never,
                        ),
                      ),
                    ],
                  ),
                ),
                const Gap(16),
                Text(
                  'Last modified: ${ranking.updatedAt.toString()}',
                  style: Theme.of(context).textTheme.bodyText2,
                ),
                const Gap(32),
                OutlinedButton(
                  onPressed: onDelete,
                  child: Text(l10n.buttonDelete),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
