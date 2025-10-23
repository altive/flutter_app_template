// For example purposes, some warnings are ignored.
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:hooks_riverpod/legacy.dart';
// no code generation

// -----------------------------------------------------------------------------
// Example of defining registration-related NotifierProviders as private,
// generating code, and exposing them together in the `Registration` class
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
// Example of defining inquiry-related `StateProvider` within a class
// and exposing them together in the `Inquiry` class
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
// Use with `ClassName.providerName`
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
