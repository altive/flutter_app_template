import 'package:flutter/material.dart';

enum TabEnum {
  timeline,
  information,
  account,
}

extension TabEnumExt on TabEnum {
  String get labelText {
    switch (this) {
      case TabEnum.timeline:
        return 'Timeline';
      case TabEnum.information:
        return 'Info';
      case TabEnum.account:
        return 'Account';
    }
  }

  IconData get iconData {
    switch (this) {
      case TabEnum.timeline:
        return Icons.timelapse;
      case TabEnum.information:
        return Icons.info;
      case TabEnum.account:
        return Icons.person;
    }
  }

  Widget get page {
    switch (this) {
      case TabEnum.timeline:
        return const TimelinePage();
      case TabEnum.information:
        return const InformationPage();
      case TabEnum.account:
        return const AccountPage();
    }
  }
}

class TabEnumPage extends StatefulWidget {
  const TabEnumPage({super.key});

  @override
  State<TabEnumPage> createState() => _TabEnumPageState();
}

class _TabEnumPageState extends State<TabEnumPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        bottom: TabBar(
          tabs: [
            for (final tab in TabEnum.values)
              Tab(text: tab.labelText, icon: Icon(tab.iconData)),
          ],
        ),
      ),
      body: TabBarView(children: TabEnum.values.map((e) => e.page).toList()),
    );
  }
}

// 以下、TabBarViewとして表示したいWidgets

class TimelinePage extends StatelessWidget {
  const TimelinePage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Timeline'),
      ),
    );
  }
}

class InformationPage extends StatelessWidget {
  const InformationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Info'),
      ),
    );
  }
}

class AccountPage extends StatelessWidget {
  const AccountPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(
        child: Text('Account'),
      ),
    );
  }
}
