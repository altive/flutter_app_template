import 'package:flutter/material.dart';

// ignore: avoid_implementing_value_types
abstract class TabBarPage implements Widget {
  /// そのタブを表す文字列
  String get labelText;

  /// そのタブを表すアイコンWidget
  IconData get iconData;
}

class TabEnumPage extends StatefulWidget {
  const TabEnumPage({
    super.key,
  });

  @override
  State<TabEnumPage> createState() => _TabEnumPageState();
}

class _TabEnumPageState extends State<TabEnumPage> {
  @override
  Widget build(BuildContext context) {
    final pages = <TabBarPage>[
      const TimelinePage(),
      const InformationPage(),
      const AccountPage(),
    ];

    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            for (final page in pages)
              Tab(text: page.labelText, icon: Icon(page.iconData)),
          ],
        ),
      ),
      body: TabBarView(children: pages),
    );
  }
}

// 以下、TabBarViewとして表示したいWidgets

class TimelinePage extends StatelessWidget implements TabBarPage {
  const TimelinePage({
    super.key,
  });

  @override
  IconData get iconData => Icons.timelapse;

  @override
  String get labelText => 'Timeline';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Timeline'),
      ),
    );
  }
}

class InformationPage extends StatelessWidget implements TabBarPage {
  const InformationPage({super.key});

  @override
  IconData get iconData => Icons.info;

  @override
  String get labelText => 'Info';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Info'),
      ),
    );
  }
}

class AccountPage extends StatelessWidget implements TabBarPage {
  const AccountPage({super.key});

  @override
  IconData get iconData => Icons.person;

  @override
  String get labelText => 'Account';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}
