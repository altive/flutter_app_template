import 'package:flutter/material.dart';

import '../utils/utils.dart';

class ErrorHandler extends StatelessWidget {
  const ErrorHandler(
    this.error, {
    required this.stack,
  });

  final Object error;
  final StackTrace stack;

  @override
  Widget build(BuildContext context) {
    logger.warning('エラー発生\n$error\n$stack');
    return const Text('ご迷惑おかけして申し訳ありません。');
  }
}
