import 'package:flutter/material.dart';
import 'package:themes/themes.dart';

import '../../gen/strings.g.dart';
import '../../router/router.dart';
import '../../widgets/app_cached_network_image.dart';
import 'components/home_list_card.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final t = Translations.of(context);
    return Scaffold(
      body: CustomScrollView(
        slivers: [
          SliverAppBar.large(
            flexibleSpace: FlexibleSpaceBar(
              titlePadding: const EdgeInsets.all(16),
              title: Text(
                t.homePage.appBar.title,
                style: Theme.of(context).appBarTheme.titleTextStyle?.copyWith(
                  color: context.colorScheme.onInverseSurface,
                  // To improve visibility of text placed over images.
                  shadows: [
                    Shadow(
                      blurRadius: 10,
                      color: context.colorScheme.inverseSurface,
                    ),
                  ],
                ),
              ),
              background: const AppCachedNetworkImage(
                imageUrl: 'https://loremflickr.com/640/480/cats',
              ),
            ),
          ),
          SliverList.list(
            children: [
              HomeListCard(
                onTap: () async => const AppInfoRouteData().push(context),
                label: t.homePage.list.appInfo.label,
              ),
              HomeListCard(
                onTap: () async =>
                    const RiverpodExampleRouteData().push(context),
                label: 'Riverpod examples',
              ),
            ],
          ),
        ],
      ),
    );
  }
}
