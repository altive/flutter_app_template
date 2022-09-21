/// 何日前にローカル通知を表示するかの選択肢
enum NotificationDate {
  oneDay,
  threeDay,
  oneWeek,
  oneMonth,
  ;

  String get label {
    switch (this) {
      case NotificationDate.oneDay:
        return '1日前';
      case NotificationDate.threeDay:
        return '3日前';
      case NotificationDate.oneWeek:
        return '1週間前';
      case NotificationDate.oneMonth:
        return '1ヶ月前';
    }
  }

  int get count {
    switch (this) {
      case NotificationDate.oneDay:
        return 1;
      case NotificationDate.threeDay:
        return 3;
      case NotificationDate.oneWeek:
        return 7;
      case NotificationDate.oneMonth:
        return 30;
    }
  }
}

extension NotificationDateNullableExt on NotificationDate? {
  int get count {
    if (this == null) {
      return 0;
    }
    return this!.count;
  }
}
