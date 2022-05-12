import 'package:flutter/material.dart';

class RankingTags extends StatelessWidget {
  const RankingTags({
    required this.tags,
    required this.onTagPressed,
  });

  final List<String> tags;
  final void Function(String tag) onTagPressed;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      crossAxisAlignment: WrapCrossAlignment.end,
      spacing: 4,
      children: [
        for (final tag in tags)
          InputChip(
            label: Text(tag),
            deleteIcon: const Icon(Icons.cancel),
            onPressed: () => onTagPressed(tag),
          ),
      ],
    );
  }
}
