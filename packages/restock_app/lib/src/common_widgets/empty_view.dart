import 'package:flutter/material.dart';

/// コンテンツが空の時に表示するWidget
class EmptyView extends StatelessWidget {
  const EmptyView({
    required this.label,
    required this.image,
  });

  final Widget label;
  final Image image;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 16),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            width: 200,
            height: 200,
            decoration: BoxDecoration(
              // ダークモードの表示のためにライトモードに合わせた背景色を設定
              color: Colors.grey[100],
              borderRadius: BorderRadius.circular(16),
            ),
            child: image,
          ),
          const SizedBox(height: 32),
          label,
        ],
      ),
    );
  }
}
