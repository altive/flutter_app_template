// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'notification_sender_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$notificationSenderHash() =>
    r'7beef6442e09dec05c1f1699452ca96358222d76';

/// ローカル通知の表示・スケジュール登録に関する機能（責務）を担う。
///
/// アプリの起動をトリガーする通知（ディープリンクのためにアプリのホームルートを変更するなど）
/// を処理する必要がある場合は、アプリの起動時に getNotificationAppLaunchDetails メソッドを使用します。
/// コールバックで通知がタップされたときに起動する関数 (onDidReceiveNotificationResponse) を指定
///
/// Copied from [NotificationSender].
@ProviderFor(NotificationSender)
final notificationSenderProvider = NotifierProvider<NotificationSender,
    List<PendingNotificationRequest>>.internal(
  NotificationSender.new,
  name: r'notificationSenderProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$notificationSenderHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$NotificationSender = Notifier<List<PendingNotificationRequest>>;
// ignore_for_file: unnecessary_raw_strings, subtype_of_sealed_class, invalid_use_of_internal_member, do_not_use_environment, prefer_const_constructors, public_member_api_docs, avoid_private_typedef_functions
