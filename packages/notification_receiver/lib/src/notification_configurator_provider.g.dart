// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'notification_configurator_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationConfiguratorHash() =>
    r'15145a28e77d69dbe3a8b64d01c5f8285084418a';

/// 通知の設定を担当する。[state]にを通知設定状態を持つ
///
/// Copied from [NotificationConfigurator].
@ProviderFor(NotificationConfigurator)
final notificationConfiguratorProvider = AsyncNotifierProvider<
    NotificationConfigurator, NotificationSettings>.internal(
  NotificationConfigurator.new,
  name: r'notificationConfiguratorProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationConfiguratorHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationConfigurator = AsyncNotifier<NotificationSettings>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
