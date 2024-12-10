import 'dart:async';

import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../../gen/strings.g.dart';
import '../query/query.dart';

/// Pub.dev packages page.
class PubDevPackagesPage extends ConsumerWidget {
  const PubDevPackagesPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final t = Translations.of(context);
    final asyncValue = ref.watch(pubDevPackagesPageStateProvider);

    return GestureDetector(
      behavior: HitTestBehavior.opaque,
      onTap: FocusScope.of(context).unfocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(t.pubDevPackagesPage.appBar.title),
        ),
        body: asyncValue.when(
          loading: () =>
              const Center(child: CircularProgressIndicator.adaptive()),
          error: (error, stackTrace) => Center(child: Text('$error')),
          data: (packagesState) {
            final packages = packagesState.packages;
            final nextPage = packagesState.nextPage;

            if (packages.isEmpty) {
              return Center(child: Text(t.pubDevPackagesPage.body.emptyLabel));
            }

            return NotificationListener<ScrollEndNotification>(
              onNotification: (notification) {
                if (notification.metrics.extentAfter == 0 && nextPage != null) {
                  unawaited(
                    ref
                        .read(pubDevPackagesPageStateProvider.notifier)
                        .loadNext(nextPage),
                  );
                  return true;
                }
                return false;
              },
              child: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    floating: true,
                    title: TextFormField(
                      controller: TextEditingController(
                        text: ref.watch(packageSearchWordStateProvider),
                      ),
                      decoration: InputDecoration(
                        hintText: t.pubDevPackagesPage.searchBar.hintText,
                        prefixIcon: const Icon(Icons.search),
                        suffixIcon: IconButton(
                          onPressed: () => ref
                              .read(packageSearchWordStateProvider.notifier)
                              .clear(),
                          icon: const Icon(Icons.clear),
                        ),
                      ),
                      onFieldSubmitted: ref
                          .read(packageSearchWordStateProvider.notifier)
                          .update,
                    ),
                  ),
                  SliverList(
                    delegate: SliverChildBuilderDelegate(
                      // Add 1 for the loading indicator.
                      childCount: packages.length + 1,
                      (context, index) {
                        if (index == packages.length) {
                          return asyncValue.isRefreshing
                              ? const Center(
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(vertical: 20),
                                    child: CircularProgressIndicator.adaptive(),
                                  ),
                                )
                              : const Gap(40);
                        }

                        final package = packages[index];
                        final name = package.name;

                        return Padding(
                          padding: const EdgeInsets.symmetric(
                            vertical: 4,
                            horizontal: 8,
                          ),
                          child: _PackageCard(packageName: name),
                        );
                      },
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class _PackageCard extends StatelessWidget {
  const _PackageCard({
    required this.packageName,
  });

  final String packageName;

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Card(
      elevation: 0.5,
      child: ListTile(
        title: Text(packageName),
        onTap: () async {
          await showDialog<void>(
            context: context,
            builder: (_) => Consumer(
              builder: (context, ref, child) {
                final asyncValue = ref.watch(
                  packageDetailsProvider(packageName: packageName),
                );

                return AlertDialog(
                  scrollable: true,
                  title: Row(
                    children: [
                      Expanded(child: Text(packageName)),
                      IconButton(
                        icon: const Icon(Icons.open_in_new),
                        onPressed: () {
                          final url =
                              Uri.https('pub.dev', '/packages/$packageName');
                          launchUrl(url);
                        },
                      ),
                    ],
                  ),
                  content: asyncValue.when(
                    loading: () => const Center(
                      child: CircularProgressIndicator.adaptive(),
                    ),
                    error: (error, stackTrace) => Text('$error'),
                    data: (packageDetails) {
                      final latestDetail = packageDetails.latest;
                      return Column(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Wrap(
                            children: [
                              Text(
                                t.pubDevPackagesPage.dialog.content.version,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(latestDetail.pubspec.version),
                            ],
                          ),
                          const Gap(20),
                          Wrap(
                            children: [
                              Text(
                                t.pubDevPackagesPage.dialog.content.description,
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(width: 8),
                              Text(latestDetail.pubspec.description),
                            ],
                          ),
                        ],
                      );
                    },
                  ),
                  actionsAlignment: MainAxisAlignment.center,
                  actions: [
                    ElevatedButton(
                      onPressed: Navigator.of(context).pop,
                      child:
                          Text(t.pubDevPackagesPage.dialog.button.close.label),
                    ),
                  ],
                );
              },
            ),
          );
        },
      ),
    );
  }
}
