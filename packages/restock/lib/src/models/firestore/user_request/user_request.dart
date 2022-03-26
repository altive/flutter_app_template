import 'package:firestore_ref/firestore_ref.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_request.freezed.dart';
part 'user_request.g.dart';

/// ユーザーからの要望・不具合
@freezed
class UserRequest with _$UserRequest {
  // データ型を定義
  const factory UserRequest({
    @TimestampConverter() DateTime? createdAt,
    @TimestampConverter() DateTime? updatedAt,
    required String uid,
    String? deviceName,
    String? deviceOS,
    required String appName,
    String? packageName,
    required String version,
    required String buildNumber,
    required String replyFor,
    required String text,
  }) = _UserRequest;

  // カスタムメソッド・Getterを定義するために必要
  const UserRequest._();

  // DBから取得したJSON形式から変換する
  factory UserRequest.fromJson(Map<String, dynamic> json) =>
      _$UserRequestFromJson(json);
}

final userRequestsRef = UserRequestsRef();

class UserRequestsRef
    extends CollectionRef<UserRequest?, UserRequestDoc, UserRequestRef> {
  UserRequestsRef()
      : super(FirebaseFirestore.instance.collection('userRequests'));

  @override
  Map<String, dynamic> encode(UserRequest? data) {
    return replacingTimestamp(json: data!.toJson());
  }

  @override
  UserRequestDoc decode(DocumentSnapshot snapshot, UserRequestRef docRef) {
    return UserRequestDoc(
      docRef,
      UserRequest.fromJson(snapshot.data()! as Map<String, Object?>),
    );
  }

  @override
  UserRequestRef docRef(DocumentReference ref) {
    return UserRequestRef(
      ref: ref,
      cRef: this,
    );
  }
}

class UserRequestRef extends DocumentRef<UserRequest?, UserRequestDoc> {
  const UserRequestRef({required DocumentReference ref, required this.cRef})
      : super(
          ref: ref as DocumentReference<Map<String, Object?>>,
          collectionRef: cRef,
        );
  final UserRequestsRef cRef;
}

class UserRequestDoc extends Document<UserRequest?> {
  const UserRequestDoc(
    this.docRef,
    UserRequest entity,
  ) : super(docRef, entity);

  final UserRequestRef docRef;
}
