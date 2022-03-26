import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'pro_plan_page_state.freezed.dart';

@freezed
class ProPlanPageState with _$ProPlanPageState {
  const factory ProPlanPageState({
    /// ローディング
    @Default(false) bool isLoading,

    /// 月契約のProプラン情報@nullable
    ProPlanInformation? monthlyProPlanInformation,

    /// 年契約のProプラン情報@nullable
    ProPlanInformation? annualProPlanInformation,
  }) = _ProPlanPageState;
}

/// Proプランの表示情報
class ProPlanInformation {
  const ProPlanInformation({
    required this.title,
    required this.price,
  });
  final String title;
  final String price;
}
