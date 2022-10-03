import 'package:flutter/widgets.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension L10n on AppLocalizations {
  /// `L10n.of(context)`
  ///
  /// `AppLocalizations.of(context)` の以下2つの問題を解決するための実装
  /// 1. IDEでサジェストされない（自動でインポートされない）
  /// 2. 取得できるAppLocalizationsがNullable
  /// この代替メソッドでは両問題を解決している
  static AppLocalizations of(BuildContext context) =>
      AppLocalizations.of(context)!;
}

extension BuildContextL10n on BuildContext {
  /// `context.l10n`
  AppLocalizations get l10n => L10n.of(this);
}
