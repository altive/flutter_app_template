import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../shared_preferences_service.dart';
import 'ex_theme.dart';

final themeColorProvider =
    StateNotifierProvider<ThemeController, ExTheme>((ref) {
  return ThemeController(ref);
});

class ThemeController extends StateNotifier<ExTheme> {
  ThemeController(this._ref) : super(ExTheme.system) {
    initialize();
  }

  final Ref _ref;

  SharedPreferencesService get _prefsController =>
      _ref.read(sharedPreferencesServiceProvider);

  /// テーマの初期値
  void initialize() {
    final themeId = _prefsController.readThemeId();
    state = ExTheme.values.firstWhere(
      (e) => e.id == themeId,
      orElse: () => ExTheme.system,
    );
  }

  /// テーマの変更
  Future<void> change(ExTheme theme) async {
    state = theme;
    await _prefsController.saveTheme(theme);
  }
}
