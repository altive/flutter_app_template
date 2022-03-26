import 'package:flutter/material.dart';

class SimpleDocumentPage extends StatelessWidget {
  const SimpleDocumentPage({
    Key? key,
    required this.title,
    required this.text,
  }) : super(key: key);

  final String title;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Text(text.replaceAll('  ', '\n\n')),
        ),
      ),
    );
  }
}
