import 'package:flutter/material.dart';

import 'package:routemaster/routemaster.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage(
    this._path, {
    Key? key,
  }) : super(key: key);

  final String _path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('404 Not found')),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Sorry...'),
            const SizedBox(height: 32),
            Text(_path, style: Theme.of(context).textTheme.headline6),
            const SizedBox(height: 32),
            const Text('is not found.'),
            Center(
              child: ElevatedButton(
                onPressed: () => Routemaster.of(context).replace('/'),
                child: const Text('Return to Home'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
