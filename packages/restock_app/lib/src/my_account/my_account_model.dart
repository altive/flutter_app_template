import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../models/authenticator/auth_controller.dart';

part 'my_account_model.freezed.dart';
part 'my_account_model.g.dart';

/// `users/{uid}/` のドキュメントStreamProvider
@Deprecated('message')
final appUserProvider = StreamProvider.autoDispose((ref) {
  final user = ref.watch(authControllerProvider);
  if (user == null) {
    return const Stream<Document<AppUserModel>>.empty();
  }
  return appUsersRef.docRefWithId(user.uid).document()
      as Stream<Document<AppUserModel>>;
});

/// ユーザーの情報（非公開）
@freezed
class AppUserModel with _$AppUserModel {
  // データ型を定義
  const factory AppUserModel({
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    // ニックネーム
    String? nickname,
    // ストック保管場所
    @JsonKey(name: 'stockPlaces') List<String>? stockCategories,
  }) = _AppUserModel;

  // カスタムメソッド・Getterを定義するために必要
  const AppUserModel._();

  // DBから取得したJSON形式から変換する
  factory AppUserModel.fromJson(Map<String, dynamic> json) =>
      _$AppUserModelFromJson(json);
}

final appUsersRef = AppUsersRef();

class AppUsersRef extends CollectionRef<AppUserModel, AppUserDoc, AppUserRef> {
  AppUsersRef() : super(FirebaseFirestore.instance.collection('users'));

  @override
  Map<String, dynamic> encode(AppUserModel data) {
    return replacingTimestamp(json: data.toJson());
  }

  @override
  AppUserDoc decode(DocumentSnapshot snapshot, AppUserRef docRef) {
    return AppUserDoc(
      docRef,
      AppUserModel.fromJson(snapshot.data()! as Map<String, Object?>),
    );
  }

  @override
  AppUserRef docRef(DocumentReference<Map<String, Object?>> ref) {
    return AppUserRef(
      ref: ref,
      cRef: this,
    );
  }
}

class AppUserRef extends DocumentRef<AppUserModel, AppUserDoc> {
  const AppUserRef({
    required DocumentReference<Map<String, Object?>> super.ref,
    required this.cRef,
  }) : super(
          collectionRef: cRef,
        );
  final AppUsersRef cRef;
}

class AppUserDoc extends Document<AppUserModel> {
  const AppUserDoc(
    this.docRef,
    AppUserModel entity,
  ) : super(docRef, entity);

  final AppUserRef docRef;
}
