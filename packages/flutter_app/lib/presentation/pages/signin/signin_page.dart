import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'components/signin_page_app_bar.dart';
import 'components/signin_page_body.dart';

class SigninPage extends HookConsumerWidget {
  const SigninPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Scaffold(
      body: SafeArea(
        child: CustomScrollView(
          slivers: [
            SigninPageAppBar(),
            SliverPadding(
              padding: EdgeInsets.symmetric(
                vertical: 32,
                horizontal: 16,
              ),
              sliver: SigninPageBody(),
            ),
          ],
        ),
      ),
    );
  }
}
