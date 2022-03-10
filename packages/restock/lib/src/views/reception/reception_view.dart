import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../common_widgets/loading_indicator.dart';
import '../../common_widgets/sign_in_with_apple_button.dart';
import '../../core/app_constant/app_info.dart';
import 'reception_controller.dart';
import 'reception_view_component.dart';

class ReceptionPage extends HookWidget {
  // Constructor
  // ----------------------------------
  const ReceptionPage({Key? key}) : super(key: key);

  // Field
  // ----------------------------------------
  static const String routeName = '/reception';

  // Methods
  // ----------------------------------
  @override
  Widget build(BuildContext context) {
    final isLightTheme = Theme.of(context).brightness == Brightness.light;
    final receptionState = useProvider(receptionProvider);
    final appTitle = useProvider(appConstantProvider).title;
    return Scaffold(
      body: LoadingIndicator(
        loading: receptionState.loading,
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(vertical: 32),
            children: <Widget>[
              Text(
                '＼$appTitle／',
                style: Theme.of(context).textTheme.headline4!.copyWith(
                      fontWeight: FontWeight.bold,
                      color: Theme.of(context).colorScheme.primary,
                    ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              Text(
                '我が家の"備蓄"は十分？\nストックを定期チェックしよう',
                style: Theme.of(context).textTheme.headline6,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              Image.asset(
                isLightTheme
                    ? 'assets/images/reception_featured_light.png'
                    : 'assets/images/reception_featured_dark.png',
                width: 500,
                height: 212,
              ),
              const SizedBox(height: 32),
              const SignInWithAppleButton(),
              const GoogleSignInButton(),
              // 匿名認証ではじめるボタン
              TextButton(
                onPressed: () => context
                    .read(receptionProvider.notifier)
                    .onPressedAnonymousButton(context),
                child: const Text('ゲストではじめる'),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  TermsButton(),
                  Text('|', style: TextStyle(color: Colors.grey)),
                  PrivacyButton(),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
