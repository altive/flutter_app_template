import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'timeline_controller.dart';
import 'timeline_item_cell.dart';

class TimelinePage extends HookConsumerWidget {
  // Constructor
  const TimelinePage();

  // Field
  static const String routeName = '/timeline';

  // Methods
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(timelineProvider);
    final controller = ref.watch(timelineProvider.notifier);
    return Scaffold(
      appBar: AppBar(
        title: const Text('みんなのストック'),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: controller.loadItems,
          ),
        ],
      ),
      body: SafeArea(
        child: ListView.builder(
          itemBuilder: (_, index) {
            final timelineItem = state.displayItems[index];
            return TimelineItemCell(item: timelineItem);
          },
          itemCount: state.displayItems.length,
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 8),
        ),
      ),
    );
  }
}
