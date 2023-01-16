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
flutterfire configure -y -o lib/environment/src/firebase_options_dev.dart -p flutter-app-template-dev -a jp.co.altive.fat.dev -i jp.co.altive.fat.dev -m jp.co.altive.fat.dev

# Staging
flutterfire configure -y -o lib/environment/src/firebase_options_stg.dart -p flutter-app-template-stg -a jp.co.altive.fat.stg -i jp.co.altive.fat.stg -m jp.co.altive.fat.stg

# Production
flutterfire configure -y -o lib/environment/src/firebase_options_prod.dart -p altive-fat -a jp.co.altive.fat -i jp.co.altive.fat -m jp.co.altive.fat
```

`-y`: Skip the Y/n confirmation prompts accept default options.
`-o`: The output file path of the Firebase configuration options.
`-p`: The Firebase project ID.
`-a`: The package name of Android app.
`-i`: The bundle identifier of iOS app.
`-m`: The bundle identifier of macOS app.
