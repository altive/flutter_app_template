import 'package:flutter/material.dart';
import 'package:routemaster/routemaster.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: ListView(
          children: [
            ListTile(
              onTap: () => Routemaster.of(context).push('app-info'),
              title: const Text('App Info'),
            ),
          ],
        ),
      ),
    );
  }
}
