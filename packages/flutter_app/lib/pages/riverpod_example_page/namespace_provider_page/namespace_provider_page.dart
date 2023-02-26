import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'namespace_provider_page.g.dart';

// -----------------------------------------------------------------------------
// 「登録」関連のNotifierProviderをプライベートで定義してコード生成し、
// `RegistrationProviders` クラスでまとめて公開する例
// -----------------------------------------------------------------------------
@riverpod
class _Nickname extends _$Nickname {
  @override
  String build() => '';
}

@riverpod
class _Birthday extends _$Birthday {
  @override
  String build() => '';
}

@riverpod
class _LivingPlace extends _$LivingPlace {
  @override
  String build() => '';
}

// ignore: avoid_classes_with_only_static_members
class Registration {
  static final nicknameProvider = _nicknameProvider;
  static final birthdayProvider = _birthdayProvider;
  static final livingPlaceProvider = _livingPlaceProvider;
}

// -----------------------------------------------------------------------------
// 「お問い合わせ」関連の `StateProvider` をクラス内で定義し、
// `InquiryProviders` クラスでまとめて公開する例
// -----------------------------------------------------------------------------

// ignore: avoid_classes_with_only_static_members
class Inquiry {
  static final nameProvider = StateProvider((ref) => '');
  static final emailProvider = StateProvider((ref) => '');
  static final contentProvider = StateProvider((ref) => '');
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
      children: [
        Text('nickname: $nickname'),
        Text('email: $email'),
      ],
    );
  }
}
