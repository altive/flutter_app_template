import 'package:flutter/material.dart';

import 'package:routemaster/routemaster.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Routemaster.of(context).currentRoute.fullPath),
      ),
      body: const Center(child: Text('Settings!')),
    );
  }
}
