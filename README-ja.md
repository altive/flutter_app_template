<img src="https://socialify.git.ci/altive/flutter_app_template/image?description=1&font=Inter&issues=1&owner=1&pattern=Floating%20Cogs&pulls=1&stargazers=1&theme=Dark" alt="flutter_app_template" width="640" height="320" />

[![melos](https://img.shields.io/badge/maintained%20with-melos-f700ff.svg?style=flat-square)](https://github.com/invertase/melos)
[![codecov](https://codecov.io/gh/altive/flutter_app_template/branch/main/graph/badge.svg?token=NUHMSLBULE)](https://codecov.io/gh/altive/flutter_app_template)

他言語でのREADME
- [English](README.md)

# Flutter App Template

"Flutter App Template "は、Flutterアプリを開発するためのアーキテクチャやプロジェクト構成などのアプローチをテンプレート化し紹介するプロジェクトです。

"Flutter App Template” リポジトリはモノレポを採用しており、いくつかの内部パッケージとアプリで構成されています。

## 内部パッケージの概要

### `analysis_logger`

イベントロギングとクラッシュレポート送信の機能(責任)を担当するパッケージです。

現在、Firebase AnalyticsとCrashlyticsを使用しています。

### `authenticator` (オーセンティケーター)

ログインなどのユーザー認証の機能(責任)を担うパッケージです。

現在、Firebase Authenticationを使用しています。

### `convenient_widgets`

複数のパッケージで使用できる汎用的なウィジェット配置場所です。

### `notification_receiver`

アプリケーションの通知権限設定やプッシュ通知の受信に関する機能（責務）を担うパッケージです。

現在、Firebase Cloud Messaging を使用しています。

### `notification_sender`

ローカル通知の表示・スケジュール登録に関する機能（責務）を担うパッケージです。

現在、 `flutter_local_notifications` を使用しています。

### `remote_parameter_fetcher` (リモートパラメータフェッチャー)

本パッケージは、リモートで設定されたパラメータを取得し、指定された型で提供する機能(責任)を担当します。

現在、Firebase Remote Config を使用しています。

### `themes`

Flutterアプリで使用されるThemeDataなどの外観関連データを担当するパッケージです。

### `util`

独立したパッケージに切り出すには小さすぎる、汎用的な機能を格納するパッケージです。

## アプリ概要

### `flutter_app`

Flutterアプリのテンプレートアプリパッケージです。
dev, stg, prod環境がセットアップされています。

アプリIDやアプリ名を変更して、すぐに別のアプリとして作り始めるためのアプリです。

[`flutter_app/README.md`](/packages/flutter_app/README.md).

こちらのREADMEも確認してください。

### `restock_app`

備蓄管理アプリです。Amazon.co.jpを利用する日本向け。
少し古いので、多少レガシーコードがあります。

### `ranking_note_app`

ランキングを作成、共有できるアプリ。未リリース。

### `onetaplog_app`

ワンタップで生活の様々な記録のログを残すことができるアプリ。

## 依存パッケージ概要

### 状態管理
- [Riverpod](https://riverpod.dev/)

### コード生成
- [freezed](https://pub.dev/packages/freezed)
- [json_serializable](https://pub.dev/packages/json_serializable)

## Hooks
- [Flutter Hooks](https://pub.dev/packages/flutter_hooks)

## Router
- [go_router](https://pub.dev/packages/go_router)

## `flutter_app` プロジェクト設定
|カテゴリ|説明|設定ファイル|
|---|---|---|
| [FVM](https://github.com/leoafarias/fvm) | Flutter Version Management | [.fvm/fvm_config.json](/.fvm/fvm_config.json) |
| Dart | Dart version | [pubspec.yaml](/packages/flutter_app/pubspec.yaml) |
| Dart | Lint / Analyze | [analysis_options.yaml](/packages/flutter_app/analysis_options.yaml) |

## 開発環境構築方法

```shell
make
```

`make` コマンドを実行すると、FVM や Melos等の、必要なDartパッケージがインストールされます。

## このテンプレートを使って新しいリポジトリを作成した後にやること

1. Bundle ID(Package name)をあなたのアプリのIDに適宜変更する。
  `jp.co.altive.fat` -> `your.domain.id`
1. `ios/Runner/info.plist` の `CFBundleName` と `CFBundleDisplayName` を、あなたのアプリ名に変更する。
1. Change `FlutterAT` in `defaultConfig/resValue` of `android/app/build.gradle` ファイルの `defaultConfig/resValue` に指定されている `FlutterAT` をあなたのアプリ名に変更する。
1. Create a project in Firebase.
  1. Create an Android app, download `google-services.json`, and place it in `android/app/src/{dev or stg or prod}`.
  1. Create an iOS app, download `GoogleService-Info.plist`, and place it in `ios/{dev or stg or prod}`.
  1. Modify `googleReversedClientId` in `dart_defines/{dev, stg, prod}.json` to match the contents of each `GoogleService-Info.plist`.
  1. Create a Web app and modify the parameters in `firebaseConfig` in `web/index.html` according to the Firebase SDK additions.
    - apiKey, authDomain, databaseURL, projectId, storageBucket, messagingSenderId, appId, measurementId
    
## 当モノレポで新しいパッケージ（orアプリ）を作成する方法

プロジェクト名とパッケージの出力ディレクトリ名が同じ場合、 `--project-name` は省略可能です。

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

## iOS and macOS向けのFirebase SDK のバージョン指定について

[FirebaseSDKVersionTag.txt](FirebaseSDKVersionTag.txt)で指定したいSDKバージョンを管理しています。

最新バージョンについてはこちら↓
https://github.com/invertase/firestore-ios-sdk-frameworks/releases

## References
[Internationalization User Guild](https://docs.google.com/document/d/10e0saTfAv32OZLRmONy866vnaw0I2jwL8zukykpgWBc/)
[PresentationDomainSeparation](https://martinfowler.com/bliki/PresentationDomainSeparation.html)
[Flutter Architecture Blueprints](https://github.com/wasabeef/flutter-architecture-blueprints)

Thank you!
