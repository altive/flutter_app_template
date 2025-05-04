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

### Path

`timeline/{timelineId}/{timestamp}`

### Field

amazonUrl
"https://www.amazon.co.jp/dp/B00BLXFKMS?tag=rollingstock-22&linkCode=osi&th=1&psc=1"
（文字列）


asin
"B00BLXFKMS"
（文字列）


category
"Others"
（文字列）


createdAt
2023年9月4日 11:15:52 UTC+9
（タイムスタンプ）


expirationAt
null
（null）


expirationDateTypeInt
2
（数値）


imageUrlLarge
"https://m.media-amazon.com/images/I/41YgXz1PLhL._SL500_.jpg"
（文字列）


imageUrlMedium
"https://m.media-amazon.com/images/I/41YgXz1PLhL._SL160_.jpg"
（文字列）


imageUrlSmall
"https://m.media-amazon.com/images/I/41YgXz1PLhL._SL75_.jpg"
（文字列）


name
"レジ袋 L 透明 "
（文字列）


nickname
"華麗なる勇者"
（文字列）


numberOfItems
1
（数値）

### triggerEvents

