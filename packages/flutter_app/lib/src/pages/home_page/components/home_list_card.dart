import 'package:flutter/material.dart';

class HomeListCard extends StatelessWidget {
  const HomeListCard({
    super.key,
    required this.onTap,
    required this.label,
  });

  final VoidCallback onTap;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Card(
      child: ListTile(
        onTap: onTap,
        title: Text(label),
        trailing: const Icon(Icons.chevron_right),
      ),
    );
  }
}
