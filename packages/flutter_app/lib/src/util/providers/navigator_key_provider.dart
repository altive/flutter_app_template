import 'package:flutter/widgets.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'navigator_key_provider.g.dart';

@Riverpod(keepAlive: true)
GlobalKey<NavigatorState> navigatorKey(NavigatorKeyRef ref) {
  throw UnimplementedError();
}
