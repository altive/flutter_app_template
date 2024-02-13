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
| [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvmrc](../../.fvmrc) |
| Dart | Dart version | [pubspec.yaml](./pubspec.yaml) |
| Dart | Lint / Analyze | [analysis_options.yaml](./analysis_options.yaml) |

## Dependency Packages

### State Management
- [Riverpod](https://riverpod.dev/)

### Code Generation
- [freezed](https://pub.dev/packages/freezed)
- [json_serializable](https://pub.dev/packages/json_serializable)

### Hooks
- [Flutter Hooks](https://pub.dev/packages/flutter_hooks)

### Router
- [go_router](https://pub.dev/packages/go_router)

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
JSONファイルを作成
```json
{
  "hello": "Hello $name",
  "save": "Save",
  "login": {
    "success": "Logged in successfully",
    "fail": "Logged in failed"
  }
}
```
Dartファイルを生成
```shell
dart run slang
```

生成されたDartファイルをimportして使用
```dart
import '../../../gen/strings.g.dart';

final t = Translations.of(context);
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
