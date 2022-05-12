import 'package:app_review/app_review.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';

import '../../common_widgets/list_cell.dart';
import '../../core/analytics/analytics.dart';
import '../../models/remote_config/remote_config_provider.dart';
import '../../providers/package_info.dart';
import '../../util/web_launcher.dart';
import '../user_request/user_request_page.dart';

class AboutThisAppPage extends HookConsumerWidget {
  const AboutThisAppPage();

  static const String routeName = '/about-this-app';

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final analyticsSender = ref.watch(analysisLoggerProvider);
    final packageInfo = ref.watch(packageInfoProvider);
    return Scaffold(
      appBar: AppBar(
        title: const Text('このアプリについて'),
      ),
      body: SafeArea(
        child: ListView(
          children: <Widget>[
            ListCell(
              leading: const Icon(Icons.mail),
              title: const Text('要望・不具合報告を送る'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () {
                Navigator.of(context).pushNamed(UserRequestPage.routeName);
              },
            ),
            ListCell(
              leading: const Icon(Icons.stars),
              title: const Text('アプリを評価して応援'),
              trailing: const Icon(Icons.open_in_browser),
              onTap: () async {
                final result = await AppReview.writeReview;
                analyticsSender.reviewWrited(result);
              },
            ),
            ListCell(
              leading: const Icon(Icons.chat),
              title: const Text('サポートのTwitter'),
              trailing: const Icon(Icons.open_in_browser),
              onTap: () {
                launchUrl(
                  'twitter://user?screen_name=ReStockApp',
                  secondUrl: 'https://twitter.com/ReStockApp',
                );
                analyticsSender.twitterLinkOpened();
              },
            ),
            ListCell(
              leading: const Icon(Icons.chat),
              title: const Text('開発者のTwitter'),
              trailing: const Icon(Icons.open_in_browser),
              onTap: () {
                launchUrl(
                  'twitter://user?screen_name=riscait',
                  secondUrl: 'https://twitter.com/riscait',
                );
                analyticsSender.twitterLinkOpened();
              },
            ),
            ListCell(
              leading: const Icon(MdiIcons.fileDocument),
              title: const Text('利用規約'),
              trailing: const Icon(Icons.open_in_browser),
              onTap: () async {
                final remoteConfig =
                    await ref.read(remoteConfigProvider.future);
                if (remoteConfig == null) {
                  return;
                }
                await launchUrl(remoteConfig.termsUrl);
                analyticsSender.webLinkOpened(remoteConfig.termsUrl);
              },
            ),
            ListCell(
              leading: const Icon(Icons.note),
              title: const Text('プライバシーポリシー'),
              trailing: const Icon(Icons.open_in_browser),
              onTap: () async {
                final remoteConfig =
                    await ref.read(remoteConfigProvider.future);
                if (remoteConfig == null) {
                  return;
                }
                await launchUrl(remoteConfig.privacyPoliciesUrl);
                analyticsSender.webLinkOpened(remoteConfig.privacyPoliciesUrl);
              },
            ),
            ListCell(
              leading: const Icon(MdiIcons.license),
              title: const Text('ライセンス'),
              trailing: const Icon(Icons.chevron_right),
              onTap: () async {
                showLicensePage(
                  context: context,
                  applicationName: packageInfo.appName,
                  applicationVersion:
                      'ver.${packageInfo.version}(${packageInfo.buildNumber})',
                  applicationLegalese: '©︎ 2020 Ryunosuke Muramatsu',
                  applicationIcon: Padding(
                    padding: const EdgeInsets.all(16),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'assets/app_icons/icon-production.png',
                        width: 120,
                        height: 120,
                      ),
                    ),
                  ),
                );
              },
            ),
            Padding(
              padding: const EdgeInsets.all(8),
              child: Text(
                'ver.${packageInfo.version}(${packageInfo.buildNumber})',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
