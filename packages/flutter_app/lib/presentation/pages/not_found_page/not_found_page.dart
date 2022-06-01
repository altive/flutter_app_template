import 'package:flutter/material.dart';

import 'components/not_found_app_bar.dart';
import 'components/not_found_page_body.dart';

class NotFoundPage extends StatelessWidget {
  const NotFoundPage(
    this._path, {
    super.key,
  });

  final String _path;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const NotFoundAppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: NotFoundPageBody(path: _path),
      ),
    );
  }
}
