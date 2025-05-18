// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: duplicate_ignore, type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'user_state_provider.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$userStateHash() => r'19414d8af1a2b1866fe9701789d50278876dbcd4';

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

abstract class _$UserState extends BuildlessAutoDisposeStreamNotifier<User?> {
  late final String userId;

  Stream<User?> build({required String userId});
}

/// アプリを使用しているユーザーのデータを取得・管理するプロバイダー。
///
/// [userId] の [User] を返す。
/// [userId] の [User] が存在しない場合は null を返す。
///
/// Copied from [UserState].
@ProviderFor(UserState)
const userStateProvider = UserStateFamily();

/// アプリを使用しているユーザーのデータを取得・管理するプロバイダー。
///
/// [userId] の [User] を返す。
/// [userId] の [User] が存在しない場合は null を返す。
///
/// Copied from [UserState].
class UserStateFamily extends Family<AsyncValue<User?>> {
  /// アプリを使用しているユーザーのデータを取得・管理するプロバイダー。
  ///
  /// [userId] の [User] を返す。
  /// [userId] の [User] が存在しない場合は null を返す。
  ///
  /// Copied from [UserState].
  const UserStateFamily();

  /// アプリを使用しているユーザーのデータを取得・管理するプロバイダー。
  ///
  /// [userId] の [User] を返す。
  /// [userId] の [User] が存在しない場合は null を返す。
  ///
  /// Copied from [UserState].
  UserStateProvider call({required String userId}) {
    return UserStateProvider(userId: userId);
  }

  @override
  UserStateProvider getProviderOverride(covariant UserStateProvider provider) {
    return call(userId: provider.userId);
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'userStateProvider';
}

/// アプリを使用しているユーザーのデータを取得・管理するプロバイダー。
///
/// [userId] の [User] を返す。
/// [userId] の [User] が存在しない場合は null を返す。
///
/// Copied from [UserState].
class UserStateProvider
    extends AutoDisposeStreamNotifierProviderImpl<UserState, User?> {
  /// アプリを使用しているユーザーのデータを取得・管理するプロバイダー。
  ///
  /// [userId] の [User] を返す。
  /// [userId] の [User] が存在しない場合は null を返す。
  ///
  /// Copied from [UserState].
  UserStateProvider({required String userId})
    : this._internal(
        () => UserState()..userId = userId,
        from: userStateProvider,
        name: r'userStateProvider',
        debugGetCreateSourceHash:
            const bool.fromEnvironment('dart.vm.product')
                ? null
                : _$userStateHash,
        dependencies: UserStateFamily._dependencies,
        allTransitiveDependencies: UserStateFamily._allTransitiveDependencies,
        userId: userId,
      );

  UserStateProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.userId,
  }) : super.internal();

  final String userId;

  @override
  Stream<User?> runNotifierBuild(covariant UserState notifier) {
    return notifier.build(userId: userId);
  }

  @override
  Override overrideWith(UserState Function() create) {
    return ProviderOverride(
      origin: this,
      override: UserStateProvider._internal(
        () => create()..userId = userId,
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        userId: userId,
      ),
    );
  }

  @override
  AutoDisposeStreamNotifierProviderElement<UserState, User?> createElement() {
    return _UserStateProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is UserStateProvider && other.userId == userId;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, userId.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin UserStateRef on AutoDisposeStreamNotifierProviderRef<User?> {
  /// The parameter `userId` of this provider.
  String get userId;
}

class _UserStateProviderElement
    extends AutoDisposeStreamNotifierProviderElement<UserState, User?>
    with UserStateRef {
  _UserStateProviderElement(super.provider);

  @override
  String get userId => (origin as UserStateProvider).userId;
}

// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
