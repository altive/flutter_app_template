enum HumanType {
  male,
  female,
  child,
}

extension ExHumanType on HumanType {
  String? get label {
    switch (this) {
      case HumanType.male:
        return '男性';
      case HumanType.female:
        return '女性';
      case HumanType.child:
        return '子供';
    }
  }
}
