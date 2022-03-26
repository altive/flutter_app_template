import 'package:hooks_riverpod/hooks_riverpod.dart';

/// アプリの定数情報のProvider
final appConstantProvider = Provider((_) => AppConstant());

class AppConstant {
  String get title => 'リストック';
}
