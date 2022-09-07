import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../account_page/account_page.dart';
import '../my_ranking_detail_page/my_ranking_detail_page.dart';
import '../public_ranking_detail_page/public_ranking_detail_page.dart';
import '../theme_selection_page/theme_selection_page.dart';
import 'router_delegate_provider.dart';

final routerProvider = Provider<Router>((ref) {
  return Router(ref.read);
});

class Router {
  const Router(this._read);

  final Reader _read;
  RoutemasterDelegate get _router => _read(routerDelegateProvider);

  void navigateToMyRankingDetailPage({required String rankingId}) {
    _router.push('${MyRankingDetailPage.routeName}/$rankingId');
  }

  void navigateToPublicRankingDetailPage({required String rankingId}) {
    _router.push('${PublicRankingDetailPage.routeName}/$rankingId');
  }

  void navigateToMyRankingPreviewPage({required String rankingId}) {
    _router.push(PublicRankingDetailPage.routeNameByPreview);
  }

  void navigateToThemeSelectionPage() {
    _router.push(ThemeSelectionPage.routeName);
  }

  void navigateToAccountPage() {
    _router.push(AccountPage.routeName);
  }
}
