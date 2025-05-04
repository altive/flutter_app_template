# メニューページ UI 詳細設計

このドキュメントでは、メインナビゲーションの 4 番目のタブとなる **メニュー (Menu)** ページの詳細設計をまとめます。ユーザーがアカウント関連設定やアプリの各種ユーティリティ機能にアクセスしやすい情報設計と UI を目指します。

---

## 1. 目的と役割

* アプリ全体の設定・管理系機能を 1 か所に集約し、ユーザーが迷わず目的の項目に辿り着けるようにする。
* 項目数が多くなりがちなため、**グループ化**と**階層化**により情報過多を防ぎ、可視性を高める。
* 各メニュー項目は **リストタイル (ListTile)** 形式で表示し、タップで詳細ページへ遷移する。

---

## 2. ページ全体構成

```
Scaffold
 ├─ AppBar
 │   └─ タイトル: 「メニュー」
 └─ Body: ListView
     ├─ SectionHeader: "アカウント"
     │   ├─ ListTile: プロフィール
     │   └─ ListTile: 課金状況
     ├─ SectionHeader: "グループ"
     │   ├─ ListTile: グループ一覧 / 招待
     │   └─ ListTile: グループ設定
     ├─ SectionHeader: "アプリ設定"
     │   ├─ ListTile: 通知設定
     │   ├─ ListTile: 場所 / カテゴリ管理
     │   └─ ListTile: データ管理
     └─ SectionHeader: "サポート"
         ├─ ListTile: ヘルプ / FAQ
         ├─ ListTile: 利用規約・プライバシー
         └─ ListTile: お問い合わせ
```

---

## 3. 必要機能リスト

| セクション | 機能名 | 詳細 | 遷移先ページ | 備考 |
|------------|--------|------|--------------|------|
| アカウント | プロフィール | ユーザー名、アイコン変更、メールアドレス確認など | `ProfilePage` |  |
|            | 課金状況 | サブスクリプション状態、プラン変更 | `SubscriptionPage` |  |
| グループ   | グループ一覧 / 招待 | 参加中グループの一覧、招待コード発行、QR 招待 | `GroupListPage` |  |
|            | グループ設定 | 権限管理、グループ名変更、退会 | `GroupSettingPage` | `GroupListPage` から遷移 |
| アプリ設定 | 通知設定 | プッシュ通知、期限アラート設定 | `NotificationSettingPage` |  |
|            | 場所 / カテゴリ管理 | 保管場所とカテゴリの CRUD | `LocationCategoryPage` |  |
|            | データ管理 | インポート / エクスポート、バックアップ、リセット | `DataManagementPage` |  |
| サポート   | ヘルプ / FAQ | よくある質問、自習用ガイド | `HelpPage` | WebView or Markdown |
|            | 利用規約・プライバシー | 文章閲覧 | `TermsPage` | WebView |
|            | お問い合わせ | フィードバックフォーム、メールリンク | `ContactUsPage` |  |

---

## 4. ページ階層図

```
MenuPage
 ├─ ProfilePage
 ├─ SubscriptionPage
 ├─ GroupListPage
 │   └─ GroupSettingPage
 ├─ NotificationSettingPage
 ├─ LocationCategoryPage
 ├─ DataManagementPage
 ├─ HelpPage
 ├─ TermsPage
 └─ ContactUsPage
```

---

## 5. ナビゲーションルール

* `MenuPage` 自体は **BottomNavigationBar** のタブとして存在する。
* 各詳細ページへの遷移は `Navigator.push` + `CupertinoPageRoute` を基本とする。
* 詳細ページで更に深い階層へ遷移する場合は、親ページから `show()` メソッドを提供し、呼び出し側が遷移方法を意識しない実装とする。
* 可能な限り **Material 3** のコンポーネントを利用し、統一感を保つ。

---

## 6. UI コンポーネント詳細

### 6.1 リストタイル

| プロパティ | 値 | 備考 |
|------------|----|------|
| leading    | `Icon` | セクションと一貫性のある SF Symbols または Material Icons |
| title      | `Text` | 日本語で機能名を表示 |
| subtitle   | `Text?` | 補足情報。例: グループ数、通知オン/オフ状態など |
| trailing   | `Icon(Icons.chevron_right)` | 標準遷移アイコン |
| onTap      | `Navigator.push(...)` | 対応する詳細ページへ遷移 |

### 6.2 セクションヘッダー

* `Text` ウィジェットを `padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8)` で配置。
* フォント: `labelMedium` (Material 3)
* 色: `Theme.of(context).colorScheme.outline` で薄いグレーを想定。

---

## 7. 今後の課題 / TODO

* 国際化対応 (i18n)。英語表示のキーを追加。
* ダークモードでのコントラスト確認。
* アクセシビリティ: フォントサイズ拡大時のレイアウト崩れ検証。
* プライバシー設定に伴うデータ削除フローの検討。
