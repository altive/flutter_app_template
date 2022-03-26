enum PurchaseNotice {
  previousPurchases,
  contractCancellation,
  autoContinuation,
  note,
  links,
}

extension PurchaseNoticeExt on PurchaseNotice {
  ///
  String get titleLabel => () {
        switch (this) {
          case PurchaseNotice.previousPurchases:
            return '機種変更時の購入情報復元';
          case PurchaseNotice.contractCancellation:
            return '契約期間の確認と解約方法';
          case PurchaseNotice.autoContinuation:
            return '「自動継続課金」について';
          case PurchaseNotice.note:
            return '注意点';
          case PurchaseNotice.links:
            return 'リンク';
        }
      }();

  ///
  String get textLabel => () {
        switch (this) {
          case PurchaseNotice.previousPurchases:
            return '''機種変更時には、購入状態にある有料機能を無料で復元できます。購入時と同じApple IDで端末にログインして「購入情報を復元」ボタンを押してください。''';
          case PurchaseNotice.contractCancellation:
            return '''
デバイスの設定アプリからApple IDページを開き、「サブスクリプション」を選択します。
「有効」の中にあるアプリを選択することで次回の自動更新日の確認や、サブスクリプションの解除が行えます。
当アプリが無い場合は購読状態にありません。''';
          case PurchaseNotice.autoContinuation:
            return '''
期限が切れる24時間以内に自動更新を解除されない場合、契約期間が更新されます。
自動更新の課金は、期限が切れる24時間以内に行われます。''';
          case PurchaseNotice.note:
            return '''
・契約の解約は上記以外の方法で行うことができません。
・当月分のキャンセルについては受け付けておりません。
・App Store アカウントを経由して課金されます。''';
          case PurchaseNotice.links:
            return '''
利用規約
https://nerco.jp/restock-terms/

プライバシーポリシー
https://nerco.jp/restock-privacy/''';
        }
      }();
}
