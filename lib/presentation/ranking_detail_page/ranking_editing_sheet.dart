import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:gap/gap.dart';

import '../../commons/hooks/use_localization.dart';
import '../../commons/widgets/image_picker_button.dart';
import '../../domain/my_ranking/entities/ranking.dart';

class RankingEditingSheet extends HookWidget {
  const RankingEditingSheet({
    Key? key,
    required this.ranking,
  }) : super(key: key);

  final Ranking ranking;

  @override
  Widget build(BuildContext context) {
    final l10n = useLocalization();
    final titleController = useTextEditingController(text: ranking.title);
    final descriptionController =
        useTextEditingController(text: ranking.description);

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
            onPressed: Navigator.of(context).pop,
            child: Text(l10n.buttonDone),
          )
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
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
                      onImageChanged: (file) {},
                      onImageRemoved: () {},
                    ),
                    const Gap(24),
                    TextField(
                      controller: titleController,
                      decoration: const InputDecoration(
                        label: Text('ランキング名'),
                        floatingLabelBehavior: FloatingLabelBehavior.never,
                      ),
                    ),
                    const Gap(16),
                    TextField(
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
                onPressed: () {},
                child: const Text('Delete'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
