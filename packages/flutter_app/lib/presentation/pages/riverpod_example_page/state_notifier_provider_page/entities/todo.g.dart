// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Todo _$$_TodoFromJson(Map json) => _$_Todo(
      id: json['id'] as String,
      title: json['title'] as String,
      completed: json['completed'] as bool? ?? false,
    );

Map<String, dynamic> _$$_TodoToJson(_$_Todo instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'completed': instance.completed,
    };
