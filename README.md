<img src="https://socialify.git.ci/altive/flutter_app_template/image?description=1&font=Inter&issues=1&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Dark" alt="flutter_app_template" width="640" height="320" />

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
[![codecov](https://codecov.io/gh/altive/flutter_app_template/branch/main/graph/badge.svg?token=NUHMSLBULE)](https://codecov.io/gh/altive/flutter_app_template)

# Flutter App Template

"Flutter App Template" is a project that introduces an approach to architecture and project structure for developing Flutter apps.

`packages/flutter_app`

## State Management
- [Riverpod](https://riverpod.dev/)

## Code Generation
- [freezed](https://pub.dev/packages/freezed)
- [json_serializable](https://pub.dev/packages/json_serializable)

## Hooks
- [Flutter Hooks](https://pub.dev/packages/flutter_hooks)

## Router
- [go_router](https://pub.dev/packages/go_router)

## `flutter_app` Project settings
|Category|Description|Codes|
|---|---|---|
| [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvm/fvm_config.json](/.fvm/fvm_config.json) |
| Dart | Dart version | [pubspec.yaml](/packages/flutter_app/pubspec.yaml) |
| Dart | Lint / Analyze | [analysis_options.yaml](/packages/flutter_app/analysis_options.yaml) |

## Packages overview

### `flutter_app`

This is a template package for Flutter apps with dev, stg, and prod environments.

Also check the [`flutter_app/README.md`](/packages/flutter_app/README.md).

### `notification_receiver`

This package takes care of functions (responsibilities) related to setting notification permissions and receiving push notifications for the application.

### `themes`

This package is responsible for the appearance of ThemeData and other appearance-related data used in Flutter apps.

## How to start development

```shell
make
```

FVM and Melos are now installed.

## What to do in a new repository using this template
1. Replace App ID with your App ID.
  `jp.co.altive.fat` -> `your.domain.id`
1. Change `CFBundleName` and `CFBundleDisplayName` in `ios/Runner/info.plist` to your app name.
1. Change `FlutterAT` in `defaultConfig/resValue` of `android/app/build.gradle` to your app name.
1. Create a project in Firebase.
  1. Create an Android app, download `google-services.json`, and place it in `android/app/src/{dev or stg or prod}`.
  1. Create an iOS app, download `GoogleService-Info.plist`, and place it in `ios/{dev or stg or prod}`.
  1. Modify `GOOGLE_REVERSED_CLIENT_ID` in `{dev, stg, prod}.xcconfig` to match the contents of each `GoogleService-Info.plist`.
  1. Create a Web app and modify the parameters in `firebaseConfig` in `web/index.html` according to the Firebase SDK additions.
    - apiKey, authDomain, databaseURL, projectId, storageBucket, messagingSenderId, appId, measurementId
    
## How to create a new package

```shell
# Package
flutter create -t package packages/{package_name}
# App
flutter create --org jp.co.altive packages/{app_name}
```

## References
[Internationalization User Guild](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[PresentationDomainSeparation](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter Architecture Blueprints](https://github.com/wasabeef/flutter-architecture-blueprints)

Thank you!
