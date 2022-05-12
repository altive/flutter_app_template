import 'package:flutter/material.dart';

class LoadingView extends StatelessWidget {
  const LoadingView({
    this.text,
  });

  final String? text;

  @override
  Widget build(BuildContext context) {
    final text = this.text;
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Center(child: CircularProgressIndicator()),
        if (text != null) ...[
          const SizedBox(height: 16),
          Text(text),
        ],
      ],
    );
  }
}
