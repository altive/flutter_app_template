// import 'package:flutter/material.dart';

// import 'button_catalog_page.dart';
// import 'dialog_catalog_page.dart';

// /// **デバッグ用** アプリで使う主要なウィジェットのカタログなどなど
// class DebugPage extends StatelessWidget {
//   const DebugPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Debug page'),
//       ),
//       body: ListView(
//         children: const [
//           _Tile(
//             titleText: 'Button Catalog',
//             page: ButtonCatalogPage(),
//           ),
//           _Tile(
//             titleText: 'Dialog Catalog',
//             page: DialogCatalogPage(),
//           ),
//         ],
//       ),
//     );
//   }
// }

// class _Tile extends StatelessWidget {
//   const _Tile({
//     required this.titleText,
//     required this.page,
//   });

//   final String titleText;
//   final Widget page;

//   @override
//   Widget build(BuildContext context) {
//     return ListTile(
//       title: Text(titleText),
//       onTap: () async {
//         await Navigator.push<void>(
//           context,
//           MaterialPageRoute(
//             builder: (context) => page,
//           ),
//         );
//       },
//     );
//   }
// }
