import 'package:altfire_tracker/altfire_tracker.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// `altfire_tracker` パッケージの [Tracker] クラスインスタンスを提供する。
///
/// `main.dart` にて、Flutterフレームワークのエラーを記録したいので、ProviderScopeでのオーバーライド前提としている。
final trackerProvider = Provider<Tracker>((ref) => throw UnimplementedError());
