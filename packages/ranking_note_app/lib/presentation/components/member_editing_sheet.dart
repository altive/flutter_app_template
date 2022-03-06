import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../commons/widgets/image_picker_button.dart';
import '../../domain/validator/validator.dart';

class MemberEditingSheet extends HookConsumerWidget {
  const MemberEditingSheet({
    Key? key,
    required this.formKey,
    required this.sheetTitleLabel,
    this.initialTitleText = '',
    this.initialDescriptionText = '',
    this.imageUrl,
    required this.onDoneButtonPressed,
  }) : super(key: key);

  final GlobalKey<FormState> formKey;
  final String sheetTitleLabel;
  final String initialTitleText;
  final String initialDescriptionText;
  final String? imageUrl;
  final void Function({
    required String titleText,
    required String descriptionText,
    XFile? pickedXFile,
    required bool imageRemoved,
  }) onDoneButtonPressed;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pickedImageNotifier = useState<XFile?>(null);
    final imageRemovedNotifier = useState(false);
    final titleController = useTextEditingController(text: initialTitleText);
    final descriptionController =
        useTextEditingController(text: initialDescriptionText);
    return SafeArea(
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        decoration: BoxDecoration(
          color: Theme.of(context).colorScheme.surface,
          borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
        ),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            padding: const EdgeInsets.symmetric(vertical: 16),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: Navigator.of(context).pop,
                      iconSize: 32,
                      icon: const Icon(Icons.close),
                    ),
                    Text(
                      sheetTitleLabel,
                      style: Theme.of(context).textTheme.headline6,
                    ),
                    IconButton(
                      onPressed: titleController.text.isEmpty
                          ? null
                          : () => onDoneButtonPressed(
                                titleText: titleController.text,
                                descriptionText: descriptionController.text,
                                pickedXFile: pickedImageNotifier.value,
                                imageRemoved: imageRemovedNotifier.value,
                              ),
                      iconSize: 32,
                      icon: const Icon(Icons.done),
                    ),
                  ],
                ),
                const Gap(16),
                Row(
                  children: [
                    ImagePickerButton(
                      imageFile: pickedImageNotifier.value,
                      imageUrl: imageRemovedNotifier.value ? null : imageUrl,
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
