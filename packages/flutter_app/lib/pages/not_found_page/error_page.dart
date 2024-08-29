import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../gen/strings.g.dart';
import '../../router/router.dart';
import '../../widgets/widgets.dart';

/// A route for error.
class ErrorRoute extends GoRouteData {
  /// Creates a new instance of [ErrorRoute].
  const ErrorRoute({required this.location, required this.exception});

  /// Location of the route.
  final String location;

  /// Exception.
  final Exception exception;

  @override
  Widget build(BuildContext context, GoRouterState state) => ErrorPage(
        location: location,
        exception: exception,
      );
}

/// A page for error.
class ErrorPage extends StatelessWidget {
  /// Creates a new instance of [ErrorPage].
  const ErrorPage({
    super.key,
    required this.location,
    required this.exception,
  });

  /// Location of the route.
  final String location;

  /// Exception.
  final Exception exception;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(t.notFoundPage.title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: _Body(path: location),
      ),
    );
  }
}

class _Body extends HookConsumerWidget {
  const _Body({
    required this.path,
  });

  final String path;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(t.notFoundPage.header.label),
        const Gap(32),
        DisplaySmallText(path),
        const Gap(32),
        Text(t.notFoundPage.description),
        Center(
          child: ElevatedButton(
            onPressed: () => const HomeRouteData().go(context),
            child: Text(t.notFoundPage.backButton.label),
          ),
        ),
      ],
    );
  }
}
