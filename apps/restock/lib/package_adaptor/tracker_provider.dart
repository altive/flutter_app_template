import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tracker_provider.g.dart';

/// `altfire_tracker` パッケージの [Tracker] クラスインスタンスを提供する。
///
/// `main.dart` にて、Flutterフレームワークのエラーを記録したいので、ProviderScopeでのオーバーライド前提としている。
@Riverpod(keepAlive: true)
Tracker tracker(Ref ref) {
  throw UnimplementedError();
}
