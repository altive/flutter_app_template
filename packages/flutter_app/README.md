# Example Flutter App

## Flavor

### App ID

- dev: jp.co.altive.fat.dev
- stg: jp.co.altive.fat.stg
- prod: jp.co.altive.fat

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

### Android

Required only `--release` mode.

- android/key.properties
- android/app/upload-keystore.jks

The jks file was converted to Base64 and registered as Secret because it is used by Continuous Delivery.

```
base64 --input upload-keystore.jks | pbcopy
```

## ToDo list for new app

required after creating a new repository using this template app.

Rewrite the configuration values of each config file.

- [android/app/build.gradle.kts](./android/app/build.gradle.kts)
  1. `applicationId`
  1. `namespace`
  2. `app_name`
- [ios/Flutter/dev.xcconfig](./ios/Flutter/dev.xcconfig)
- [ios/Flutter/stg.xcconfig](./ios/Flutter/stg.xcconfig)
- [ios/Flutter/prod.xcconfig](./ios/Flutter/prod.xcconfig)
  1. `BUNDLE_IDENTIFIER`
  1. `DISPLAY_NAME`

2. Create a project in Firebase.
3. Execute `flutterfire configure`.
4. Replace `GOOGLE_REVERSED_CLIENT_ID` in `{flavor}.xcconfig`.
5. Create a Web app and modify the parameters in `firebaseConfig` in `web/index.html`.

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
--project flutter-app-template-dev \
--out lib/environment/src/firebase_options_dev.dart \
--android-out android/app/src/dev/google-services.json \
--ios-out ios/Runner/dev/ \
--platforms android,ios,web \
--android-package-name jp.co.altive.fat.dev \
--ios-bundle-id jp.co.altive.fat.dev

# Stg
flutterfire configure --yes \
--project flutter-app-template-stg \
--out lib/environment/src/firebase_options_stg.dart \
--android-out android/app/src/stg/google-services.json \
--ios-out ios/Runner/stg/ \
--platforms android,ios,web \
--android-package-name jp.co.altive.fat.stg \
--ios-bundle-id jp.co.altive.fat.stg

# Prod
flutterfire configure --yes \
--project altive-fat \
--out lib/environment/src/firebase_options_prod.dart \
--android-out android/app/src/prod/google-services.json \
--ios-out ios/Runner/prod/ \
--platforms android,ios,web \
--android-package-name jp.co.altive.fat \
--ios-bundle-id jp.co.altive.fat
```

### Firebase Analytics DebugView

#### Start/Stop DebugView for Android dev

```shell
# Start
adb shell setprop debug.firebase.analytics.app jp.co.altive.fat.dev
# Stop
adb shell setprop debug.firebase.analytics.app .none.
```

## Deploy

### iOS for local

Upload the IPA for the production app.

```shell
flutter build ipa --flavor=prod --export-options-plist="ios/prod/ExportOptions.plist"
```

### Android for local

1. Build the AppBundle for the production app.

```shell
flutter build appbundle --flavor=prod
```

2. Upload the AppBundle in Google Play Console.
