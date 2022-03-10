import 'package:hooks_riverpod/hooks_riverpod.dart';

final meValidatorProvider = Provider((ref) => const MeValidator());

class MeValidator {
  const MeValidator();

  String? validateCategory(String? category) {
    if (category!.isEmpty) {
      return 'グループ名を入力してください。';
    }
    if (category.length > 12) {
      return 'グループ名が長すぎます。';
    }
    return null;
  }
}
