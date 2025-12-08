import 'package:flutter_app/pages/riverpod_example_page/entities/todo.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Todo', () {
    test('toJson/fromJsonで値を保持できること', () {
      const todo = Todo(
        id: 'todo-1',
        title: 'Write tests',
        completed: true,
      );

      final json = todo.toJson();

      expect(json, {
        'id': 'todo-1',
        'title': 'Write tests',
        'completed': true,
      });
      expect(Todo.fromJson(json), equals(todo));
    });

    test('copyWithで指定した値のみ更新されること', () {
      const todo = Todo(
        id: 'todo-2',
        title: 'Initial title',
      );

      final updated = todo.copyWith(title: 'Updated title', completed: true);

      expect(updated.id, equals(todo.id));
      expect(updated.title, 'Updated title');
      expect(updated.completed, isTrue);
    });

    test('Equatableのpropsにより比較できること', () {
      const todoA = Todo(
        id: 'todo-3',
        title: 'Same title',
      );
      const todoB = Todo(
        id: 'todo-3',
        title: 'Same title',
      );
      const todoC = Todo(
        id: 'todo-3',
        title: 'Same title',
        completed: true,
      );

      expect(todoA, equals(todoB));
      expect(todoA == todoC, isFalse);
    });
  });
}
