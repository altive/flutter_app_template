enum ProPlanBenefit {
  ads,
  favorite,
  category,
  notification,
}

extension ProPlanBenefitExt on ProPlanBenefit {
  String get title => () {
        switch (this) {
          case ProPlanBenefit.ads:
            return '広告の表示';
          case ProPlanBenefit.favorite:
            return 'お気に入り上限数';
          case ProPlanBenefit.category:
            return 'グループの上限数';
          case ProPlanBenefit.notification:
            return '期限通知の上限数';
        }
      }();

  String get forFree => () {
        switch (this) {
          case ProPlanBenefit.ads:
            return 'あり';
          case ProPlanBenefit.favorite:
            return '10';
          case ProPlanBenefit.category:
            return '3';
          case ProPlanBenefit.notification:
            return '10';
        }
      }();

  String get forPremium => () {
        switch (this) {
          case ProPlanBenefit.ads:
            return 'なし';
          case ProPlanBenefit.favorite:
            return '無制限';
          case ProPlanBenefit.category:
            return '無制限';
          case ProPlanBenefit.notification:
            return '無制限';
        }
      }();
}
