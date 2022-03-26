import 'package:flutter/foundation.dart';

/// アプリの使用感を尋ねて最終的にレビューしてもらうための状態定義
enum AskAppFeelingState {
  /// 初期状態。まだダイアログは表示しない
  start,

  /// 十分アプリを使用しているユーザーである。アプリが気に入ったか尋ねる
  activeUser,

  /// 気に入ったと言ってもらえた
  feelingGood,

  /// 気に入っていないと回答された
  feelingBad,

  /// レビューしてもらった
  reviewCompleted,
}

extension AskAppFeelingStateExt on AskAppFeelingState {
  String get string => describeEnum(this);

  static AskAppFeelingState fromString(String string) {
    switch (string) {
      case 'start':
        return AskAppFeelingState.start;
      case 'activeUser':
        return AskAppFeelingState.activeUser;
      case 'feelingGood':
        return AskAppFeelingState.feelingGood;
      case 'feelingBad':
        return AskAppFeelingState.feelingBad;
      case 'reviewCompleted':
        return AskAppFeelingState.reviewCompleted;
    }
    throw AssertionError();
  }
}
