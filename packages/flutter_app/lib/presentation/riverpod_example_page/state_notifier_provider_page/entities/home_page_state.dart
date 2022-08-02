// ignore: unused_import
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

// 生成されるファイル名を指定する（ `生成元ファイル名.freezed.dart` ）
part 'home_page_state.freezed.dart';

@freezed
class HomePageState with _$HomePageState {
  const factory HomePageState({
    /// Main Count
    @Default(0) int mainCount,

    /// Sub Count
    @Default(0) int subCount,
  }) = _HomePageState;
}
