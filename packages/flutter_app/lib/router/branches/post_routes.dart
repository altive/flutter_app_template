import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../features/post/view/post_page.dart';

class PostShellBranchData extends StatefulShellBranchData {
  const PostShellBranchData();
}

class PostRouteData extends GoRouteData {
  const PostRouteData();

  static const String name = '/post';
  static const String path = '/post';

  @override
  Widget build(BuildContext context, GoRouterState state) {
    return const PostPage();
  }
}
