import 'package:flutter/material.dart';

mixin TabBarPage implements Widget {
  /// そのタブを表す文字列
  String get labelText;

  /// そのタブを表すアイコンWidget
  IconData get iconData;
}

class TabEnumPage extends StatefulWidget {
  const TabEnumPage({Key? key}) : super(key: key);

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

class TimelinePage extends StatelessWidget with TabBarPage {
  const TimelinePage({Key? key}) : super(key: key);

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

class InformationPage extends StatelessWidget with TabBarPage {
  const InformationPage({Key? key}) : super(key: key);

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

class AccountPage extends StatelessWidget with TabBarPage {
  const AccountPage({Key? key}) : super(key: key);

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
