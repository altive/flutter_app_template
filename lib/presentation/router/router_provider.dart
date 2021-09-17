import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import 'router_delegate_provider.dart';

final routerProvider = Provider<Router>((ref) {
  return Router(ref.read);
});

class Router {
  const Router(this._read);

  final Reader _read;
  RoutemasterDelegate get _router => _read(routerDelegateProvider);

  void navigatoTo() {
    _router.push('');
  }
}
