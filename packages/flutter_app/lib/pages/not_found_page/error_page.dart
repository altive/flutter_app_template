import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import 'components/not_found_app_bar.dart';
import 'components/not_found_page_body.dart';

class ErrorRoute extends GoRouteData {
  ErrorRoute({required this.location, required this.exception});

  final String location;
  final Exception exception;

  @override
  Widget build(BuildContext context, GoRouterState state) => ErrorPage(
        location: location,
        exception: exception,
      );
}

class ErrorPage extends StatelessWidget {
  const ErrorPage({
    super.key,
    required this.location,
    required this.exception,
  });

  final String location;
  final Exception exception;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotFoundAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: NotFoundPageBody(path: location),
      ),
    );
  }
}
