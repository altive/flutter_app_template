import 'dart:math';

import 'package:clock/clock.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';

import '../entities/todo.dart';

// Provider example.
final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
      return TodoListNotifier();
    });

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier()
    : super(const [
        // Insert sample Todos
        Todo(id: '1', title: 'Buy a coffee'),
        Todo(id: '2', title: 'Buy a milk'),
        Todo(id: '3', title: 'Eat sushi'),
        Todo(id: '4', title: 'Build an sushi'),
        Todo(id: '5', title: 'Build my app'),
      ]);

  /// Method to add a new TODO
  void add(Todo todo) {
    state = [...state, todo];
  }

  /// Method to remove a TODO by ID
  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  /// Method to toggle a TODO's completion state by ID
  void toggle(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id == todoId)
          todo.copyWith(completed: !todo.completed)
        else
          todo,
    ];
  }
}

// Widget example.
class StateNotifierProviderPage extends ConsumerWidget {
  const StateNotifierProviderPage({super.key});

  static const title = 'StateNotifierProvider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Read StateNotifierProvider. Since we use watch,
    // when the state (TODO list) is updated, the build method is
    // re-executed and the screen is updated
    final todoList = ref.watch(todoListNotifierProvider);
    // To use TodoListNotifier, read the Provider with `.notifier`
    final notifier = ref.watch(todoListNotifierProvider.notifier);

    // Define a private method to add a new Todo
    void addTodo() {
      final newTodo = Todo(
        id: Random().nextDouble().toString(),
        title: clock.now().toIso8601String(),
      );
      notifier.add(newTodo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        actions: [
          // Add a new Todo by pressing the button (in a real app, you
          // should allow input of the Todo title, etc.)
          IconButton(onPressed: addTodo, icon: const Icon(Icons.add)),
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
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
                  onPressed: () => notifier.remove(todo.id),
                  child: const Text('Delete'),
                ),
                // Toggle TODO completion state on tap
                onTap: () => notifier.toggle(todo.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
