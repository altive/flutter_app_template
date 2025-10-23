import 'dart:math';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/todo.dart';
import '../util/util.dart';

final asyncTodoListProvider = AsyncNotifierProvider<AsyncTodoList, List<Todo>>(
  AsyncTodoList.new,
);

// Provider example.
// By adding the `@riverpod` annotation and extending `_$ClassName`,
// `asyncTodoListProvider` can be generated.
// `ref.watch(asyncTodoListProvider)` gets the `state(List<Todo>)`.
// `ref.watch(asyncTodoListProvider.notifier)` gets the
// `AsyncTodoList(Notifier)`.
class AsyncTodoList extends AsyncNotifier<List<Todo>> {
  Future<List<Todo>> _fetchTodo() async {
    // Process to fetch Todo list through Web API, etc.
    final r = await ref
        .read(dioProvider)
        .get<List<Map<String, Object?>>>('https://example.com/api/todo');
    return r.data.map(Todo.fromJson).toList();
  }

  @override
  Future<List<Todo>> build() async {
    final r = await ref
        .watch(dioProvider)
        .get<List<Map<String, Object?>>>('https://example.com/api/todo');
    return r.data.map(Todo.fromJson).toList();
  }

  /// Method to add a new TODO
  Future<void> add(Todo todo) async {
    // Method to add a new TODO
    final todos = state.value;
    // Set to loading state until processing is complete
    state = const AsyncValue.loading();
    // AsyncValue.guard: Returns AsyncError if exception occurs
    // (alternative to try/catch)
    state = await AsyncValue.guard(() async {
      final r = await ref
          .read(dioProvider)
          .post<Map<String, Object?>>(
            'https://example.com/api/todos',
            data: todo.toJson(),
          );
      final t = Todo.fromJson(r.data);
      return [t, ...?todos];
    });
  }

  /// Method to remove a TODO by ID
  Future<void> remove(String todoId) async {
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(dioProvider)
          .delete<Map<String, Object?>>('https://example.com/api/todo/$todoId');
      return _fetchTodo();
    });
  }

  /// Method to toggle a TODO's completion state by ID
  Future<void> toggle(String todoId) async {
    final todo = state.value!.firstWhere((todo) => todo.id == todoId);
    state = const AsyncValue.loading();
    state = await AsyncValue.guard(() async {
      await ref
          .read(dioProvider)
          .patch<Map<String, Object?>>(
            'https://example.com/api/todo/$todoId',
            data: <String, Object?>{'completed': !todo.completed},
          );
      return _fetchTodo();
    });
  }
}

// Widget example.
class AsyncNotifierProviderPage extends ConsumerWidget {
  const AsyncNotifierProviderPage({super.key});

  static const title = 'AsyncNotifierProvider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read AsyncNotifierProvider. Since we use watch,
    // when the state (TODO list) is updated, the build method is
    // re-executed and the screen is updated
    final asyncTodoList = ref.watch(asyncTodoListProvider);
    // To use AsyncTodoList(Notifier), get it with `.notifier`
    final notifier = ref.watch(asyncTodoListProvider.notifier);

    // Define a method to add a new Todo
    Future<void> addTodo() async {
      final newTodo = Todo(
        id: Random().nextDouble().toString(),
        title: clock.now().toIso8601String(),
      );
      // Use the method defined in AsyncTodoList(Notifier) to add the
      // new Todo to state
      await notifier.add(newTodo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        actions: [
          // Add a new Todo by pressing the button (in a real app, you
          // would allow input of the Todo title, etc.)
          IconButton(onPressed: addTodo, icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: asyncTodoList.when(
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (error, stackTrace) => Center(child: Text('Error: $error')),
          data: (todoList) {
            return ListView.separated(
              padding: const EdgeInsets.all(16),
              itemCount: todoList.length,
              separatorBuilder: (_, _) => const SizedBox(height: 4),
              itemBuilder: (context, index) {
                final todo = todoList[index];
                return Card(
                  child: ListTile(
                    title: Text(todo.title),
                    leading: Icon(
                      todo.completed
                          ? Icons.check_box
                          : Icons.check_box_outline_blank,
                    ),
                    trailing: TextButton(
                      onPressed: () async => notifier.remove(todo.id),
                      child: const Text('Delete'),
                    ),
                    // Toggle TODO completion state on tap
                    onTap: () async => notifier.toggle(todo.id),
                  ),
                );
              },
            );
          },
        ),
      ),
    );
  }
}
