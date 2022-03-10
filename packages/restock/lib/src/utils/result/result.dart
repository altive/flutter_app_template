import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'result.freezed.dart';

/// 成功（値）か失敗（例外）を返すResult型
@freezed
class Result<S, F> with _$Result<S, F> {
  const Result._();

  /// 成功したときは値を入れる@nullable
  const factory Result.success(S value) = Success<S, F>;

  /// 失敗した時は例外を入れる
  const factory Result.failure(F exception) = Failure<S, F>;

  /// 成功なら `true`
  bool get isSuccess => when(success: (_) => true, failure: (_) => false);

  /// 失敗なら `true`
  bool get isFailure => !isSuccess;
}
