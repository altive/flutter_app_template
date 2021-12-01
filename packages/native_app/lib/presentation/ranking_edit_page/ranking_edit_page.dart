import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:routemaster/routemaster.dart';

import '../../commons/widgets/image_picker_button.dart';

enum ImageState {
  none,
  selected,
  uploaded,
}

/// ランキングを編集する画面
/// 未使用
class RankingEditPage extends StatelessWidget {
  const RankingEditPage({
    Key? key,
    this.rankingId,
  }) : super(key: key);

  static const routeName = 'edit';

  /// 編集対象のランキングID。新規作成の場合は `null`が入る
  final String? rankingId;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(Routemaster.of(context).currentRoute.fullPath),
        actions: [
          TextButton.icon(
            onPressed: () => debugPrint(''),
            icon: const Icon(Icons.check),
            label: const Text('編集'),
          ),
        ],
      ),
      body: _Body(rankingId: rankingId),
    );
  }
}

class _Body extends ConsumerWidget {
  const _Body({
    Key? key,
    required this.rankingId,
  }) : super(key: key);

  final String? rankingId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final rankingId = this.rankingId;
    if (rankingId == null) {
      // 新規作成
      return const _RankingForm();
    }
    // 既存編集
    // return ref.watch(rankingMembersProvider(rankingId)).when(
    //       loading: () => const _LoadingView(),
    //       error: (error, stk) => ErrorWidget(error),
    //       data: (memberDocs) {
    return const _RankingForm();
    //       },
    //     );
  }
}

class _RankingForm extends StatelessWidget {
  const _RankingForm({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Form(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: Column(
            children: [
              const Gap(16),
              Row(
                children: [
                  ImagePickerButton(
                    onImageChanged: (file) {},
                    onImageRemoved: () {},
                  ),
                  const Gap(16),
                  Expanded(
                    child: TextFormField(
                      decoration: const InputDecoration(
                        labelText: 'ランキング名',
                        hintText: '2021年買って良かったもの',
                      ),
                      validator: (value) => null,
                    ),
                  ),
                ],
              ),
              const Gap(16),
              TextFormField(
                maxLines: 50,
                minLines: 2,
                decoration: const InputDecoration(
                  labelText: '説明',
                  hintText: '2021年を通して買って良かったものを追加していくランキングです。',
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// class _MemberForm extends StatelessWidget {
//   const _MemberForm({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         const Text('1位'),
//         Row(
//           children: [
//             TextButton(
//               onPressed: () => debugPrint,
//               child: const SizedBox(),
//             ),
//             TextFormField(
//               decoration: const InputDecoration(
//                 hintText: '名前',
//               ),
//             ),
//           ],
//         ),
//         TextFormField(
//           decoration: const InputDecoration(hintText: 'コメント'),
//         ),
//       ],
//     );
//   }
// }

// class _LoadingView extends HookWidget {
//   const _LoadingView({
//     Key? key,
//   }) : super(key: key);

//   static const _length = 6;

//   @override
//   Widget build(BuildContext context) {
//     final animationController = useAnimationController(
//       duration: const Duration(milliseconds: 1500),
//     );

//     final animation = useAnimation(
//       ColorTween(
//         begin: Colors.grey[50],
//         end: Colors.grey[300],
//       ).animate(animationController),
//     );

//     useEffect(() {
//       animationController.repeat(reverse: true);
//       return null;
//     }, const []);

//     return Padding(
//       padding: const EdgeInsets.all(16),
//       child: Column(
//         children: List.generate(
//           _length,
//           (index) {
//             final isFirst = index == 0;
//             final isLast = index == _length - 1;
//             const radius = Radius.circular(_cardRadius);
//             final shape = RoundedRectangleBorder(
//               borderRadius: BorderRadius.vertical(
//                 top: isFirst ? radius : Radius.zero,
//                 bottom: isLast ? radius : Radius.zero,
//               ),
//             );
//             return Card(
//               margin: EdgeInsets.zero,
//               elevation: 0,
//               shape: shape,
//               child: ListTile(
//                 leading: CircleAvatar(
//                   backgroundColor: animation,
//                 ),
//                 title: Container(
//                   width: 100,
//                   height: 16,
//                   color: animation,
//                 ),
//                 trailing: Icon(
//                   Icons.chevron_right,
//                   color: animation,
//                 ),
//               ),
//             );
//           },
//         ),
//       ),
//     );
//   }
// }
