import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'validator_provider.g.dart';

@Riverpod(keepAlive: true)
Validator validator(Ref ref) {
  return const Validator();
}

class Validator {
  const Validator();

  String? isNotEmpty(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter some text.';
    }
    return null;
  }
}
