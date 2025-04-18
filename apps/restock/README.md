# Restock

## Flavor

### App ID

| | dev | stg | prod |
| --- | --- | --- | --- |
| App ID | jp.altive.restock | jp.altive.rollingstock | jp.altive.rollingstock.development |
| App Name | ReStock | stg.ReStock | dev.ReStock |

## Features

- Riverpod examples
- Theme selector

## App settings
| Category                                 | Description                | Codes                                            |
| ---------------------------------------- | -------------------------- | ------------------------------------------------ |
| [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvmrc](../../.fvmrc)                           |
| Dart                                     | Dart version               | [pubspec.yaml](./pubspec.yaml)                   |
| Dart                                     | Lint / Analyze             | [analysis_options.yaml](./analysis_options.yaml) |

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

## Secret files required for Release

Required only `--release` mode.

- android/key.properties
- android/app/upload-keystore.jks

The jks file was converted to Base64 and registered as Secret because it is used by Continuous Delivery.

```
base64 --input upload-keystore.jks | pbcopy
```

## How to use

### Localizations

Create JSON files.

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
Generate Dart files.

```shell
dart run slang
```

Use the generated file.

```dart
import '../../../gen/strings.g.dart';

final t = Translations.of(context);
```

## FlutterFire Configure

When should it be re-run?
- Add support for new platforms
- Start using new Firebase services and products

```shell
# Dev
flutterfire configure --yes \
--project restock-development \
--out lib/environment/src/firebase_options_dev.dart \
--android-out android/app/src/dev/google-services.json \
--ios-out ios/dev/ \
--platforms android,ios \
--android-package-name jp.altive.rollingstock.development \
--ios-bundle-id jp.altive.rollingstock.development \
--ios-build-config=Debug-prod \
--no-apply-gradle-plugins

# Stg
flutterfire configure --yes \
--project rolling-stock-app \
--out lib/environment/src/firebase_options_stg.dart \
--android-out android/app/src/stg/google-services.json \
--ios-out ios/stg/ \
--platforms android,ios \
--android-package-name jp.co.altive.fat.stg \
--ios-bundle-id jp.co.altive.fat.stg \
--ios-build-config=Debug-prod \
--no-apply-gradle-plugins

# Prod
flutterfire configure --yes \
--project re-stock \
--out lib/environment/src/firebase_options_prod.dart \
--android-out android/app/src/prod/google-services.json \
--ios-out ios/prod/ \
--platforms android,ios \
--android-package-name jp.altive.restock \
--ios-bundle-id jp.altive.restock \
--ios-build-config=Debug-prod \
--no-apply-gradle-plugins
```

### Firebase Analytics DebugView

#### Start/Stop DebugView for Android dev

```shell
# Start
adb shell setprop debug.firebase.analytics.app jp.altive.rollingstock.development
# Stop
adb shell setprop debug.firebase.analytics.app .none.
```
