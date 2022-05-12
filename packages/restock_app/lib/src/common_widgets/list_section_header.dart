import 'package:flutter/material.dart';

class ListSectionHeader extends StatelessWidget {
  // ----------------------------------
  // Constructor
  // ----------------------------------
  const ListSectionHeader({
    required this.title,
    this.visibility,
    this.padding = const EdgeInsets.all(16),
  });

  // ----------------------------------------
  // Field
  // ----------------------------------------
  final String title;
  final Future<bool>? visibility;
  final EdgeInsetsGeometry padding;

  // ----------------------------------
  // Override Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    if (visibility == null) {
      return _buildContent(context);
    }
    return FutureBuilder<bool>(
      future: visibility,
      builder: (context, snapshot) {
        if (!snapshot.hasData || !snapshot.data!) {
          return const SizedBox();
        }
        return _buildContent(context);
      },
    );
  }

  Widget _buildContent(BuildContext context) {
    return Padding(
      padding: padding,
      child: Text(
        title,
        style: Theme.of(context).textTheme.caption,
      ),
    );
  }
}
