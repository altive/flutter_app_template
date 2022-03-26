import 'package:flutter/material.dart';
import 'package:nested/nested.dart';

class FixedTextScaleFactor extends SingleChildStatelessWidget {
  const FixedTextScaleFactor({
    Key? key,
    Widget? child,
  }) : super(key: key, child: child);

  @override
  Widget buildWithChild(BuildContext context, Widget? child) {
    return MediaQuery(
      data: MediaQuery.of(context).copyWith(
        textScaleFactor: 1,
      ),
      child: child!,
    );
  }
}
