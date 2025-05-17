# Cloud Firestore データドキュメント

このドキュメントはReStockアプリで使用しているDBであるFirestoreに関する情報を集約するドキュメントページです。

## 基本情報

- コレクション、ドキュメント、データのフィールド名などはキャメルケースで命名しています。

## Collection階層構造

- `timeline`
- `triggerEvents`
- `userReports`
- `userRequests`
- `users`

## Collection設計

### timeline

Path: `timeline/{timelineId}`

| フィールド名          | データ形式     | データ例                            |
| --------------------- | -------------- | ----------------------------------- |
| amazonUrl             | 文字列         | https://example.com/dp/B00BLXFKMS   |
| asin                  | 文字列         | B00ABCDEFG                          |
| category              | 文字列         | Others                              |
| createdAt             | タイムスタンプ | 2023年9月4日 11:15:52 UTC+9         |
| expirationAt          | null           | null                                |
| expirationDateTypeInt | 数値           | 2                                   |
| imageUrlLarge         | 文字列         | https://example.com/41YgXz1PLhL.jpg |
| imageUrlMedium        | 文字列         | https://example.com/41YgXz1PLhL.jpg |
| imageUrlSmall         | 文字列         | https://example.com/41YgXz1PLhL.jpg |
| name                  | 文字列         | レジ袋 L 透明                       |
| nickname              | 文字列         | 華麗なる勇者                        |
| numberOfItems         | 数値           | 1                                   |

### triggerEvents コレクション

Path: `triggerEvents/{triggerEventId}`

### userReports コレクション

Path: `userReports/{userReportId}`

| フィールド名 | データ形式     | データ例                     |
| ------------ | -------------- | ---------------------------- |
| appName      | 文字列         | ReStock                      |
| buildNumber  | 文字列         | 19                           |
| createdAt    | タイムスタンプ | 2020年7月14日 18:29:01 UTC+9 |
| deviceName   | 文字列         | iPhone12,3                   |
| deviceOS     | 文字列         | iOS 13.5.1                   |
| packageName  | 文字列         | jp.altive.restock            |
| replyFor     | 文字列         | riscait@gmail.com            |
| text         | 文字列         | productionから送信テスト     |
| uid          | 文字列         | tpLL1Pi7rkRETHQb630sGND77P72 |
| updatedAt    | タイムスタンプ | 2020年7月14日 18:29:01 UTC+9 |
| version      | 文字列         | 1.0.0                        |

### userRequests コレクション

Path: `userRequests/{userRequestId}`

| フィールド名 | データ形式     | データ例                      |
| ------------ | -------------- | ----------------------------- |
| appName      | 文字列         | ReStock                       |
| buildNumber  | 文字列         | 93                            |
| createdAt    | タイムスタンプ | 2023年11月21日 12:03:44 UTC+9 |
| deviceName   | 文字列         | Sony SOG10                    |
| deviceOS     | 文字列         | Android 13, API 33            |
| packageName  | 文字列         | jp.altive.restock             |
| replyFor     | 文字列         | m.m.tetsu@gmail.com           |
| text         | 文字列         | よろしくお願いいたします。    |
| uid          | 文字列         | 9xMeFdKpMZNh5VXleLdAx2sjZ5P2  |
| updatedAt    | タイムスタンプ | 2023年11月21日 12:03:44 UTC+9 |
| version      | 文字列         | 2.10.2                        |

### users コレクション

Path: `users/{userId}`

| フィールド名 | データ形式     | データ例                               |
| ------------ | -------------- | -------------------------------------- |
| createdAt    | タイムスタンプ | 2025年1月29日 0:46:31 UTC+9            |
| nickname     | 文字列         | お茶目なシマウマ                       |
| stockPlaces  | 配列（文字列） | ["消耗品", "冷蔵庫の中", "冷蔵庫の外"] |
| updatedAt    | タイムスタンプ | 2025年1月29日 0:47:59 UTC+9            |

### users/{userId}/stockItems コレクション

Path: `users/{userId}/stockItems/{stockItemId}`

| フィールド名          | データ形式     | データ例                                |
| --------------------- | -------------- | --------------------------------------- |
| amazonUrl             | 文字列         | https://examle.com                      |
| asin                  | 文字列         | B013WJA8UW                              |
| category              | 文字列         | Others                                  |
| createdAt             | タイムスタンプ | 2022年4月24日 18:56:44 UTC+9            |
| expirationAt          | null           | null                                    |
| expirationDateTypeInt | 数値           | 2                                       |
| id                    | 文字列         | 943fe38d-4f27-47dd-b459-347abd50b7f1    |
| idNumber              | 数値           | 265439418                               |
| imagePathLarge        | null           | null                                    |
| imagePathMedium       | null           | null                                    |
| imagePathOriginal     | null           | null                                    |
| imagePathSmall        | null           | null                                    |
| imageUrlLarge         | 文字列         | https://examle.com/img.jpg              |
| imageUrlMedium        | 文字列         | https://examle.com/img.jpg              |
| imageUrlSmall         | 文字列         | https://examle.com/img.jpg              |
| itemId                | null           | null                                    |
| memo                  | null           | null                                    |
| name                  | 文字列         | ビオレu 泡ハンドソープ つめかえ用 800ml |
| numberOfItems         | 数値           | 7                                       |
| originalName          | 文字列         | ビオレu 泡ハンドソープ つめかえ用 800ml |
| place                 | 文字列         | 洗面所・トイレ                          |
| updatedAt             | タイムスタンプ | 2022年4月24日 18:59:53 UTC+9            |
