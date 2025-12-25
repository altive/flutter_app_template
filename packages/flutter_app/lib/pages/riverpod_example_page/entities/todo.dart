import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'todo.g.dart';

@JsonSerializable()
class Todo extends Equatable {
  const Todo({
    required this.id,
    required this.title,
    this.completed = false,
  });

  factory Todo.fromJson(Map<String, dynamic> json) => _$TodoFromJson(json);

  /// To-do ID.
  final String id;

  /// To-do title.
  final String title;

  /// Whether the to-do is completed.
  final bool completed;

  /// Convert to JSON.
  Map<String, dynamic> toJson() => _$TodoToJson(this);

  /// Create a copy of this instance with the given values.
  Todo copyWith({
    String? id,
    String? title,
    bool? completed,
  }) {
    return Todo(
      id: id ?? this.id,
      title: title ?? this.title,
      completed: completed ?? this.completed,
    );
  }

  @override
  List<Object?> get props => [id, title, completed];
}
