# Examples app of Flutter App Template

## Flavor with App ID

- dev: jp.co.altive.fat
- stg: jp.co.altive.fat.stg
- prod: jp.co.altive.fat.dev

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
    - domain/
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