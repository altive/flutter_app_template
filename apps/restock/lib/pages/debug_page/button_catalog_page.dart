// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import '../widgets/button/primary_awaitable_button.dart';
// import '../widgets/button/primary_button.dart';

// /// **デバッグ用** アプリで使う主要なボタンのカタログページ
// class ButtonCatalogPage extends StatelessWidget {
//   const ButtonCatalogPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     Future<String> completeOrError() async {
//       await Future<void>.delayed(const Duration(seconds: 1));
//       if (Random().nextBool()) {
//         return 'Complete!';
//       }
//       throw Exception('Failed...');
//     }

//     void showComplete(String text) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text(text)),
//       );
//     }

//     void showError(Exception exception, StackTrace stackTrace) {
//       ScaffoldMessenger.of(context).showSnackBar(
//         SnackBar(content: Text('$exception')),
//       );
//     }

//     final widgets = [
//       const Text('PrimaryButton'),
//       _DoubleButtons(
//         PrimaryButton(
//           text: 'Button',
//           onPressed: () {},
//         ),
//         PrimaryButton.variant(
//           text: '.variant',
//           onPressed: () {},
//         ),
//       ),
//       _DoubleButtons(
//         PrimaryButton(
//           text: 'with icon',
//           icon: const Icon(Icons.heart_broken),
//           onPressed: () {},
//         ),
//         const PrimaryButton(
//           text: 'Disabled',
//           icon: Icon(Icons.heart_broken),
//           onPressed: null,
//         ),
//       ),
//       const Divider(),
//       const Text('PrimaryAwaitableButton'),
//       _DoubleButtons(
//         PrimaryAwaitableButton(
//           text: 'Button',
//           onPressed: completeOrError,
//           whenComplete: showComplete,
//           onError: showError,
//         ),
//         PrimaryAwaitableButton.variant(
//           text: '.variant',
//           onPressed: completeOrError,
//           whenComplete: showComplete,
//           onError: showError,
//         ),
//       ),
//       _DoubleButtons(
//         PrimaryAwaitableButton(
//           text: 'with icon',
//           icon: const Icon(Icons.heart_broken),
//           onPressed: completeOrError,
//           whenComplete: showComplete,
//           onError: showError,
//         ),
//         PrimaryAwaitableButton(
//           text: 'Disabled',
//           icon: const Icon(Icons.heart_broken),
//           onPressed: null,
//           whenComplete: showComplete,
//           onError: showError,
//         ),
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Button Catalog')),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16),
//         separatorBuilder: (_, __) => const Gap(16),
//         itemCount: widgets.length,
//         itemBuilder: (context, index) => widgets[index],
//       ),
//     );
//   }
// }

// class _DoubleButtons extends StatelessWidget {
//   const _DoubleButtons(
//     this.widget1,
//     this.widget2,
//   );

//   final Widget widget1;
//   final Widget widget2;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Expanded(child: widget1),
//         const Gap(8),
//         Expanded(child: widget2),
//       ],
//     );
//   }
// }
