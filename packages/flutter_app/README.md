# Examples app of Flutter App Template

## Flavor with App ID

- dev: jp.co.altive.fat.dev
- stg: jp.co.altive.fat.stg
- prod: jp.co.altive.fat

## Features
- Riverpod examples
- Theme selector

## App settings
|Category|Description|Codes|
|---|---|---|
| [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvm/fvm_config.json](../../.fvm/fvm_config.json) |
| Dart | Dart version | [pubspec.yaml](./pubspec.yaml) |
| Dart | Lint / Analyze | [analysis_options.yaml](./analysis_options.yaml) |

## App structure

- lib/
    - commons/
    - features/
    - presentation/
  - main.dart

## Secret files required for Release

Required only `--release` mode.

- android/key.properties
- android/app/upload-keystore.jks

## How to use
### Localizations
```dart
final l10n = L10n.of(context);
```

## FlutterFire Configure
再実行すべきタイミング
- 新しいプラットフォームのサポート追加
- 新しいFirebaseサービスやプロダクトの使用を開始する

```shell
# Dev
flutterfire configure --yes \
--project flutter-app-template-dev \
--out lib/environment/src/firebase_options_dev.dart \
--platforms android,ios,macos,web \
--android-package-name jp.co.altive.fat.dev \
--ios-bundle-id jp.co.altive.fat.dev \
--macos-bundle-id jp.co.altive.fat.dev

# Stg
flutterfire configure --yes \
--project flutter-app-template-stg \
--out lib/environment/src/firebase_options_stg.dart \
--platforms android,ios,macos,web \
--android-package-name jp.co.altive.fat.stg \
--ios-bundle-id jp.co.altive.fat.stg \
--macos-bundle-id jp.co.altive.fat.stg

# Prod
flutterfire configure --yes \
--project altive-fat \
--out lib/environment/src/firebase_options_prod.dart \
--platforms android,ios,macos,web \
--android-package-name jp.co.altive.fat \
--ios-bundle-id jp.co.altive.fat \
--macos-bundle-id jp.co.altive.fat
```
