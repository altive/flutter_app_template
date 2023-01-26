import 'dart:math';

import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/todo.dart';

// Provider example.
final todoListNotifierProvider =
    StateNotifierProvider<TodoListNotifier, List<Todo>>((ref) {
  return TodoListNotifier();
});

class TodoListNotifier extends StateNotifier<List<Todo>> {
  TodoListNotifier()
      : super(const [
          // サンプルのTodoを挿入
          Todo(id: '1', title: 'Buy a coffee'),
          Todo(id: '2', title: 'Buy a milk'),
          Todo(id: '3', title: 'Eat sushi'),
          Todo(id: '4', title: 'Build an sushi'),
          Todo(id: '5', title: 'Build my app'),
        ]);

  /// 新しいTODOを追加するメソッド
  void add(Todo todo) {
    state = [...state, todo];
  }

  /// IDを指定して、TODOを削除するメソッド
  void remove(String todoId) {
    state = [
      for (final todo in state)
        if (todo.id != todoId) todo,
    ];
  }

  /// IDを指定して、TODOの完了状態を切り替えるメソッド
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
  const StateNotifierProviderPage({
    super.key,
  });

  static const String title = 'StateNotifierProvider';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // StateNotifierProviderを読み取る。watchを使用しているので、
    // state（状態）であるTODOリストが更新されると、buildメソッドが再実行されて画面が更新される
    final todoList = ref.watch(todoListNotifierProvider);
    // TodoListNotifier を使用する場合は `.notifier` を付けてProviderを読み取る
    final notifier = ref.watch(todoListNotifierProvider.notifier);

    // 新しいTodoを追加する、プライベートメソッドを定義
    void addTodo() {
      final newTodo = Todo(
        id: Random().nextDouble().toString(),
        title: DateTime.now().toIso8601String(),
      );
      notifier.add(newTodo);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text(title),
        actions: [
          // ボタンを押して新しいTodoを追加できる（実際はTodoのタイトル等を入力できるようにすると良い）
          IconButton(onPressed: addTodo, icon: const Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: ListView.separated(
          padding: const EdgeInsets.all(16),
          itemCount: todoList.length,
          separatorBuilder: (_, __) => const SizedBox(height: 4),
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
                // タップでTODOの完了状態を切り替える
                onTap: () => notifier.toggle(todo.id),
              ),
            );
          },
        ),
      ),
    );
  }
}
