/// 期限の種類
///
/// 賞味期限・消費期限・期限なし
enum ExpirationDateType {
  bestBefore,
  usedBy,
  none,
}

extension Ex on ExpirationDateType {
  /// ラベル文字列
  String? get label {
    switch (this) {
      case ExpirationDateType.bestBefore:
        return '賞味期限';
      case ExpirationDateType.usedBy:
        return '消費期限';
      case ExpirationDateType.none:
        return '期限なし';
    }
  }
}
