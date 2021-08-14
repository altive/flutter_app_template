import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'presentation/app.dart';

void main() {
  runApp(
    const ProviderScope(
      child: App(),
    ),
  );
}
