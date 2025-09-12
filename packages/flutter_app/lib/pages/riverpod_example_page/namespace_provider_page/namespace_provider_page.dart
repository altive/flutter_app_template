// 例のため、一部の警告を無視しています。
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
// no code generation

// -----------------------------------------------------------------------------
// 「登録」関連のNotifierProviderをプライベートで定義してコード生成し、
// `RegistrationProviders` クラスでまとめて公開する例
// -----------------------------------------------------------------------------
class _Nickname extends Notifier<String> {
  @override
  String build() => '';
}

class _Birthday extends Notifier<String> {
  @override
  String build() => '';
}

class _LivingPlace extends Notifier<String> {
  @override
  String build() => '';
}

final _nicknameProvider = NotifierProvider<_Nickname, String>(
  _Nickname.new,
);
final _birthdayProvider = NotifierProvider<_Birthday, String>(
  _Birthday.new,
);
final _livingPlaceProvider = NotifierProvider<_LivingPlace, String>(
  _LivingPlace.new,
);

// This is example.
// ignore: avoid_classes_with_only_static_members
class Registration {
  static final NotifierProvider<_Nickname, String> nicknameProvider =
      _nicknameProvider;
  static final NotifierProvider<_Birthday, String> birthdayProvider =
      _birthdayProvider;
  static final NotifierProvider<_LivingPlace, String> livingPlaceProvider =
      _livingPlaceProvider;
}

// -----------------------------------------------------------------------------
// 「お問い合わせ」関連の `StateProvider` をクラス内で定義し、
// `InquiryProviders` クラスでまとめて公開する例
// -----------------------------------------------------------------------------

// This is example.
// ignore: avoid_classes_with_only_static_members
class Inquiry {
  static final StateProvider<String> nameProvider = StateProvider((ref) => '');
  static final StateProvider<String> emailProvider = StateProvider((ref) => '');
  static final StateProvider<String> contentProvider = StateProvider(
    (ref) => '',
  );
}

// -----------------------------------------------------------------------------
// `Class名.プロバイダ名` で使用する
// -----------------------------------------------------------------------------

class NamespaceWidget extends ConsumerWidget {
  const NamespaceWidget({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nickname = ref.watch(Registration.nicknameProvider);
    final email = ref.watch(Inquiry.emailProvider);
    return Column(
      children: [Text('nickname: $nickname'), Text('email: $email')],
    );
  }
}
