import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../core/analytics/analytics.dart';
import '../shared_preferences_service.dart';
import 'ex_theme.dart';

final themeColorProvider =
    StateNotifierProvider<ThemeController, ExTheme>((ref) {
  return ThemeController(ref.read);
});

class ThemeController extends StateNotifier<ExTheme> {
  ThemeController(this._read) : super(ExTheme.system) {
    initialize();
  }

  final Reader _read;

  AnalysisLogger get _logger => _read(analysisLoggerProvider);

  SharedPreferencesService get _prefsController =>
      _read(sharedPreferencesServiceProvider);

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
    _logger.sendChangeTheme(theme);
  }
}
