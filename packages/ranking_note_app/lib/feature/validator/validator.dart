import 'package:hooks_riverpod/hooks_riverpod.dart';

final validatorProvider = Provider<Validator>((ref) {
  return const Validator();
});

class Validator {
  const Validator();

  String? isNotEmpty(String? value) {
    if (value?.isEmpty ?? true) {
      return 'Please enter some text.';
    }
    return null;
  }

  String? isValidTag(String value) {
    if (value.isEmpty) {
      return 'Please enter some text.';
    }
    if (value.length > 50) {
      return "That's too long.";
    }
    return null;
  }
}
