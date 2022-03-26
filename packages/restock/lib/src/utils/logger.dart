import 'package:simple_logger/simple_logger.dart';

/*
  SHOUT:   さらに派手な追加デバッグ
  SEVERE:  重大な障害
  WARNING: 潜在的な問題の警告
  INFO:    情報のメッセージ
  CONFIG:  静的な設定情報
  FINE:    記録情報
  FINER:   まあまあ詳細な記録
  FINEST:  非常に詳細な記録
 */
final SimpleLogger logger = SimpleLogger()
  ..setLevel(
    Level.ALL, // 有効にする最低レベルのログレベルを指定
    // Debug build時のみ発信者情報を有効にする
    includeCallerInfo: !const bool.fromEnvironment('dart.vm.product'),
  )
  ..onLogged = (log, info) {
    // ロギング直後にレベルの範囲でやりたいことを定義
    if (info.level >= Level.SEVERE) {
      // do something...(e.g. Crashlytics)
    }
  };
