// import 'dart:async';

// import 'package:flutter/material.dart';
// import 'package:gap/gap.dart';

// import '../widgets/button/primary_button.dart';
// import '../widgets/dialog/show_talk_room_opening_dialog.dart';

// /// **デバッグ用** アプリで使う主要なダイアログのカタログページ
// class DialogCatalogPage extends StatelessWidget {
//   const DialogCatalogPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     final widgets = [
//       const Text('トークルーム開設'),
//       PrimaryButton(
//         text: 'showTalkRoomOpeningDialog',
//         onPressed: () => unawaited(
//           showTalkRoomOpeningDialog(
//             context: context,
//             targetNickname: 'John Doe',
//             targetAvatarUrl: 'https://picsum.photos/200',
//           ),
//         ),
//       ),
//     ];

//     return Scaffold(
//       appBar: AppBar(title: const Text('Dialog Catalog')),
//       body: ListView.separated(
//         padding: const EdgeInsets.all(16),
//         separatorBuilder: (_, __) => const Gap(16),
//         itemCount: widgets.length,
//         itemBuilder: (context, index) => widgets[index],
//       ),
//     );
//   }
// }
