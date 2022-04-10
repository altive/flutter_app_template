import 'package:cloud_firestore/cloud_firestore.dart';

import 'me_entity.dart';
import 'me_repository.dart';

class FakeMeRepository implements MeRepository {
  @override
  DocumentReference get meRef => throw UnimplementedError();

  @override
  Stream<MeEntity> stream() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateStockVisibility({bool? isPrivate}) {
    throw UnimplementedError();
  }

  @override
  Future<void> migrate({String? nickname, List<String>? stockCategories}) {
    throw UnimplementedError();
  }

  @override
  Future<void> addNickname() {
    throw UnimplementedError();
  }

  @override
  Future<void> updateNickname(String nickname) {
    throw UnimplementedError();
  }

  @override
  Future<void> removeGroup(String category) {
    throw UnimplementedError();
  }

  @override
  Future<void> unionGroup(String category) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateGroups(List<String> categories) {
    throw UnimplementedError();
  }

  @override
  Future<void> updateGroup({
    int? position,
    String? oldCategory,
    String? newCategory,
  }) {
    throw UnimplementedError();
  }
}
