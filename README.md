<img src="https://socialify.git.ci/altive/flutter_app_template/image?description=1&font=Inter&issues=1&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Dark" alt="flutter_app_template" width="640" height="320" />

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
[![codecov](https://codecov.io/gh/altive/flutter_app_template/branch/main/graph/badge.svg?token=NUHMSLBULE)](https://codecov.io/gh/altive/flutter_app_template)
[![Flutter app code check](https://github.com/altive/flutter_app_template/actions/workflows/flutter-app-code-check.yml/badge.svg)](https://github.com/altive/flutter_app_template/actions/workflows/flutter-app-code-check.yml)

README in other languages
- [日本語](README-ja.md)

# Flutter App Template

"Flutter App Template" is a project to template and introduce an approach to developing Flutter apps, including architecture and project structure.

"Flutter App Template" repository employs a mono-repo and consists of several internal packages and apps.

## Packages overview

### `analysis_logger`

This package is responsible for the function (responsibility) of event logging and sending crash reports.

Currently using Firebase Analytics and Crashlytics.

### `authenticator`

This package is responsible for the function (responsibility) of authenticating users, such as logging in.

Currently using Firebase Authentication.

### `convenient_widgets`

A generic widget placement location that can be used in multiple packages.

### `notification_receiver`

This package takes care of functions (responsibilities) related to setting notification permissions and receiving push notifications for the application.

Currently using Firebase Cloud Messaging.

### `notification_sender`

This package is responsible for functions (responsibilities) related to local notification display and schedule registration.

Currently using `flutter_local_notifications`.

### `remote_parameter_fetcher`

This package is responsible for the function (responsibility) of retrieving remotely configured parameters and providing them in a specified type.

Currently using Firebase Remote Config.

### `themes`

This package is responsible for the appearance of ThemeData and other appearance-related data used in Flutter apps.

### `util`

This package stores general-purpose functions that are too small to be cut out into a stand-alone package.

## App overview

### `flutter_app`

This is a template app package for Flutter apps.
It comes with dev, stg, and prod environments set up.

Change the app ID or app name to start building it as a separate app right away.

Also check the [`flutter_app/README.md`](/packages/flutter_app/README.md).

### `restock_app`

Stockpile management app. for Japan using Amazon.co.jp.
Slightly older, so some legacy code.

### `ranking_note_app`

An application to create and share rankings.
Not yet released.

### `onetaplog_app`

An application that allows you to log various records of your life with a single tap.
Not yet released.

## Dependency Package Overview

### State Management
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

```shell
flutter pub add analysis_logger --path ../analysis_logger
flutter pub add authenticator --path ../authenticator
flutter pub add convenient_widgets --path ../convenient_widgets
flutter pub add notification_receiver --path ../notification_receiver
flutter pub add remote_parameter_fetcher --path ../remote_parameter_fetcher
```

## How to start development

```shell
make
```

The `make` command will install the required Dart packages, such as FVM and Melos.

## ToDo list required after creating a new repository using this template
1. Replace Bundle ID (Package name) with your App ID.
  `jp.co.altive.fat` -> `your.domain.id`
1. Change `CFBundleName` and `CFBundleDisplayName` in `ios/Runner/info.plist` to your app name.
1. Change `FlutterAT` in `defaultConfig/resValue` of `android/app/build.gradle` to your app name.
1. Create a project in Firebase.
  1. Create an Android app, download `google-services.json`, and place it in `android/app/src/{dev or stg or prod}`.
  1. Create an iOS app, download `GoogleService-Info.plist`, and place it in `ios/{dev or stg or prod}`.
  1. Modify `googleReversedClientId` in `dart_defines/{dev, stg, prod}.json` to match the contents of each `GoogleService-Info.plist`.
  1. Create a Web app and modify the parameters in `firebaseConfig` in `web/index.html` according to the Firebase SDK additions.
    - apiKey, authDomain, databaseURL, projectId, storageBucket, messagingSenderId, appId, measurementId
    
## How to create a new package

If the project name and the output directory name of the package are the same,
`--project-name` can be omitted.

```shell
# Package
flutter create -t package packages/{directory_name} --project-name {project_name}
# App
flutter create --org jp.co.altive packages/{directory_name} --project-name {project_name}
```

↓内部パッケージをインストールしたいときに使用するコマンド。

```shell
flutter pub add analysis_logger --path ../analysis_logger
flutter pub add authenticator --path ../authenticator
flutter pub add convenient_widgets --path ../convenient_widgets
flutter pub add notification_receiver --path ../notification_receiver
flutter pub add remote_parameter_fetcher --path ../remote_parameter_fetcher
```

## Firebase SDK version for iOS and macOS

[FirebaseSDKVersionTag.txt](FirebaseSDKVersionTag.txt) manages the SDK version you wish to specify.

↓ For the latest version, click here.
https://github.com/invertase/firestore-ios-sdk-frameworks/releases

* I wanted to use the latest `9.5.0-1` or higher, but the `cloud_firestore 3.4.8` package in pub.dev seemed to be unsupported, so I used `9.4.0`.

## References
[Internationalization User Guild](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[PresentationDomainSeparation](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter Architecture Blueprints](https://github.com/wasabeef/flutter-architecture-blueprints)

Thank you!
