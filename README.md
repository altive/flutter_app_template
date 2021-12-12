<img src="https://socialify.git.ci/altive/flutter_app_template/image?description=1&font=Inter&issues=1&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Dark" alt="flutter_app_template" width="640" height="320" />

[![codecov](https://codecov.io/gh/altive/flutter_app_template/branch/main/graph/badge.svg?token=NUHMSLBULE)](https://codecov.io/gh/altive/flutter_app_template)

# Flutter App Template

"Flutter App Template" is a project that introduces an approach to architecture and project structure for developing Flutter apps.

## State Management
[Riverpod](https://riverpod.dev/)

## Code Generation
[freezed](https://pub.dev/packages/freezed)

## Hooks
[Flutter Hooks](https://pub.dev/packages/flutter_hooks)

## Project settings
|Category|Description|Codes|
|---|---|---|
| [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvm/fvm_config.json](https://github.com/altive/flutter_app_template/blob/main/.fvm/fvm_config.json) |
| Dart | Dart version | [pubspec.yaml](https://github.com/altive/flutter_app_template/blob/main/pubspec.yaml#L7) |
| Dart | Lint / Analyze | [analysis_options.yaml](https://github.com/altive/flutter_app_template/blob/main/analysis_options.yaml) |

## Environments
dev, stg, prod

## Project structure

- lib/
    - commons/
    - domain/
    - presentation/
  - main.dart

## Setup for using the template
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
    
## Reference list
[Internationalization User Guild](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[PresentationDomainSeparation](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter Architecture Blueprints](https://github.com/wasabeef/flutter-architecture-blueprints)

Thank you!
