[![Codemagic build status](https://api.codemagic.io/apps/5ef7faee1aafca24b0a88384/5ef7faee1aafca24b0a88383/status_badge.svg)](https://codemagic.io/apps/5ef7faee1aafca24b0a88384/5ef7faee1aafca24b0a88383/latest_build)

# リストック (ReStock)

備蓄をスマートに！

## プロダクト概要
防災アイテムを管理し、賞味期限や使用期限が迫っている物は事前にお知らせ。在庫状況を気にすることなく安心して備蓄ができる。

### 商品検索
最初はAmazonのみ、ゆくゆくは楽天やYahooも選べるようにしたい

## プラットフォーム
Android, iOS, iPadOS に対応。
ゆくゆくはmacOS, Web にも対応したい。

## 分析
自分がどの程度備蓄できているかグラフ等で確認できる
「10種類の備蓄アイテムを揃えた！」等のトロフィー機能が確認できる

---

## Firebaseプロジェクト

### 本番環境
Rolling Stock
https://console.firebase.google.com/u/0/project/rolling-stock-app/

### 開発・テスト環境
Rolling Stock Staging
https://console.firebase.google.com/u/0/project/rolling-stock-staging/

## StoreへのDeploy手順

### バージョンを決めて pubspec.yaml を編集

```yaml
version: 2.5.0+80
```

### リリースノートを編集する
#### Android
1. `fastlane/metadata/android/ja-JP/changelogs/{version_code}.txt` を作成してリリースノートを記載

#### iOS
1. `fastlane/metadata/ja/release_notes.txt` を編集してリリースノートを記載
1. App Store Connect のアプリ画面で新しいバージョンを作成 e.g. `2.2.1`

### Android と iOS を続けて審査提出
```
$ cd packages/restock
$ make submit
```

### Androidのみ審査提出

```
$ cd packages/restock
$ make submit-android
```

## iOSのみ審査提出

```
$ cd packages/restock
$ make submit-ios
```
