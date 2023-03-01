// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'stream_provider_page.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$countHash() => r'200a548af5bbcb1421ebc3f64d68b86d23cae574';

/// コード生成記法
/// 1秒ずつにカウントをインクリメントする。
///
/// Copied from [count].
@ProviderFor(count)
final countProvider = AutoDisposeStreamProvider<int>.internal(
  count,
  name: r'countProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$countHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef CountRef = AutoDisposeStreamProviderRef<int>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
