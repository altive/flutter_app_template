// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'namespace_provider_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

String _$_NicknameHash() => r'7e9b71625f625835c03e710e20ae306be1b926a1';

/// See also [_Nickname].
final _nicknameProvider = AutoDisposeNotifierProvider<_Nickname, String>(
  _Nickname.new,
  name: r'_nicknameProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$_NicknameHash,
);
typedef _NicknameRef = AutoDisposeNotifierProviderRef<String>;

abstract class _$Nickname extends AutoDisposeNotifier<String> {
  @override
  String build();
}

String _$_BirthdayHash() => r'3cc8c3b03370bb6a2fcb3a4a6ea2314bb875c0f0';

/// See also [_Birthday].
final _birthdayProvider = AutoDisposeNotifierProvider<_Birthday, String>(
  _Birthday.new,
  name: r'_birthdayProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$_BirthdayHash,
);
typedef _BirthdayRef = AutoDisposeNotifierProviderRef<String>;

abstract class _$Birthday extends AutoDisposeNotifier<String> {
  @override
  String build();
}

String _$_LivingPlaceHash() => r'f171654b5112d7ff9f6b6eb4cd164cd45cf950a4';

/// See also [_LivingPlace].
final _livingPlaceProvider = AutoDisposeNotifierProvider<_LivingPlace, String>(
  _LivingPlace.new,
  name: r'_livingPlaceProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$_LivingPlaceHash,
);
typedef _LivingPlaceRef = AutoDisposeNotifierProviderRef<String>;

abstract class _$LivingPlace extends AutoDisposeNotifier<String> {
  @override
  String build();
}
