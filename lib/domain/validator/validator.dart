import 'package:hooks_riverpod/hooks_riverpod.dart';

final validatorProvider = Provider<Validator>((ref) {
  return Validator(ref.read);
});

class Validator {
  Validator(this._read);

  final Reader _read;

  String? isNotEmpty(String? value) {
    if (value?.isEmpty ?? true) {
      return '';
    }
    return null;
  }
}
