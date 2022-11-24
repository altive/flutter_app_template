import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'histories_card.dart';

class HistoriesPageBody extends ConsumerWidget {
  const HistoriesPageBody({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return SliverList(
      delegate: SliverChildBuilderDelegate(
        childCount: 5,
        (context, index) {
          return Column(
            children: const [
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4, horizontal: 8),
                child: HistoriesCard(),
              ),
            ],
          );
        },
      ),
    );
  }
}
