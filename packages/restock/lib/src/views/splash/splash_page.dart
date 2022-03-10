import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'splash_page_controller.dart';

class SplashPage extends HookWidget {
  const SplashPage({Key? key}) : super(key: key);

  static const String routeName = '/';

  @override
  Widget build(BuildContext context) {
    useProvider(splashPageControllerProvider.notifier).initialize(
      context: context,
    );
    // 起動処理中に表示させておくもの。LaunchImageと同じにしているが、
    // 本来はHomeを模したデザインで起動を早く見せたい
    return Container(
      color: Theme.of(context).backgroundColor,
      constraints: const BoxConstraints.expand(),
      child: FractionallySizedBox(
        widthFactor: 0.5,
        child: Image.asset('assets/app_icons/icon.png'),
      ),
    );
  }
}
