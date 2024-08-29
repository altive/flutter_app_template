<img src="https://socialify.git.ci/altive/flutter_app_template/image?description=1&font=Inter&issues=1&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Dark" alt="flutter_app_template" width="640" height="320" />

[![Flutter app code check](https://github.com/altive/flutter_app_template/actions/workflows/flutter-app-code-check.yml/badge.svg)](https://github.com/altive/flutter_app_template/actions/workflows/flutter-app-code-check.yml)
[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
[![codecov](https://codecov.io/gh/altive/flutter_app_template/graph/badge.svg?token=NUHMSLBULE)](https://codecov.io/gh/altive/flutter_app_template)

[![](https://codecov.io/gh/altive/flutter_app_template/graphs/icicle.svg?token=NUHMSLBULE)]()

# Flutter App Template

"Flutter App Template" is a project to template and introduce an approach to developing Flutter apps, including architecture and project structure.

"Flutter App Template" repository employs a mono-repo and consists of several internal packages and apps.

## Packages overview

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

## How to start development

```shell
make
```

The `make` command will install the required Dart packages, such as FVM and Melos.

## ToDo list required after creating a new repository using this template
1. Replace Bundle ID (Package name) with your App ID.
  `jp.co.altive.fat` -> `your.domain.id`
1. Change `appName` in `{flavor}.env` to your app name.
1. Create a project in Firebase.
  1. Create an Android app, download `google-services.json`, and place it in `android/app/src/{dev or stg or prod}`.
  1. Create an iOS app, download `GoogleService-Info.plist`, and place it in `ios/{dev or stg or prod}`.
  1. Modify `googleReversedClientId` in `dart_defines/{dev, stg, prod}.env` to match the contents of each `GoogleService-Info.plist`.
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

## Firebase SDK version for iOS and macOS

[FirebaseSDKVersionTag.txt](FirebaseSDKVersionTag.txt) manages the SDK version you wish to specify.

↓ For the latest version, click here.
https://github.com/invertase/firestore-ios-sdk-frameworks/releases

## Addition of ISSUE_TEMPLATE

If you do not have `.github/ISSUE_TEMPLATE` in a repository, you can use Issue templates placed in a special repository named `.github`.

For altive organization, the Issue templates in the [altive/.github](https://github.com/altive/.github/) repository should also work for this repository.

If necessary, please copy and use the Issue template from the above repository.

## References
[Internationalization User Guild](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[PresentationDomainSeparation](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter Architecture Blueprints](https://github.com/wasabeef/flutter-architecture-blueprints)

Thank you!
