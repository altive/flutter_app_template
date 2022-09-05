# Remote Parameter Fetcher
リモートで設定されたパラメータを取得する責務を持つパッケージです。
利用元（アプリ）で欲しい情報を、指定の型で返します。

現在は **Firebase Remote Config** に依存しています。

String, int, double, bool, JSON, List JSONを取得し提供しますが、
JSONの場合は特に、データクラスを定義してオブジェクトを提供できるようにするのが望ましいでしょう。

## Features

Remote Configで設定されたパラメータを取得し、適切な型で提供します。

## Getting started

1. `lib/src/parameters` に、取得したいパラメータの名前のDartファイルを作成します。
1. `RemoteParameterFetcher` の `get` メソッドを利用して値を取得します。
1. 必要なら適切な型に変換し、返します。
1. `lib/src/parameters/parameters.dart` に `export` を追加してパッケージ外に公開します。

## Usage

作成したProviderをアプリ側で呼び出して使用してください。

```dart
final requiredVersion = ref.watch(requiredVersionProvider);
```
