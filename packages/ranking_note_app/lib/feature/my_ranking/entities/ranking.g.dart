// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'ranking.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides

class _Sentinel {
  const _Sentinel();
}

const _sentinel = _Sentinel();

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RankingCollectionReference
    implements
        RankingQuery,
        FirestoreCollectionReference<Ranking, RankingQuerySnapshot> {
  factory RankingCollectionReference([
    FirebaseFirestore? firestore,
  ]) = _$RankingCollectionReference;

  static Ranking fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return Ranking.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    Ranking value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<Ranking> get reference;

  @override
  RankingDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RankingDocumentReference> add(Ranking value);
}

class _$RankingCollectionReference extends _$RankingQuery
    implements RankingCollectionReference {
  factory _$RankingCollectionReference([FirebaseFirestore? firestore]) {
    firestore ??= FirebaseFirestore.instance;

    return _$RankingCollectionReference._(
      firestore.collection('rankings').withConverter(
            fromFirestore: RankingCollectionReference.fromFirestore,
            toFirestore: RankingCollectionReference.toFirestore,
          ),
    );
  }

  _$RankingCollectionReference._(
    CollectionReference<Ranking> reference,
  ) : super(reference, reference);

  String get path => reference.path;

  @override
  CollectionReference<Ranking> get reference =>
      super.reference as CollectionReference<Ranking>;

  @override
  RankingDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RankingDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RankingDocumentReference> add(Ranking value) {
    return reference.add(value).then((ref) => RankingDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RankingCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RankingDocumentReference
    extends FirestoreDocumentReference<Ranking, RankingDocumentSnapshot> {
  factory RankingDocumentReference(DocumentReference<Ranking> reference) =
      _$RankingDocumentReference;

  DocumentReference<Ranking> get reference;

  /// A reference to the [RankingCollectionReference] containing this document.
  RankingCollectionReference get parent {
    return _$RankingCollectionReference(reference.firestore);
  }

  late final RankingMemberCollectionReference members =
      _$RankingMemberCollectionReference(
    reference,
  );

  @override
  Stream<RankingDocumentSnapshot> snapshots();

  @override
  Future<RankingDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    DateTime? createdAt,
    DateTime? updatedAt,
    String title,
    String description,
    String? imageUrl,
    String? thumbnailUrl,
    bool pinned,
    List<String> tags,
    bool recommendTagsShowing,
  });

  Future<void> set(Ranking value);
}

class _$RankingDocumentReference
    extends FirestoreDocumentReference<Ranking, RankingDocumentSnapshot>
    implements RankingDocumentReference {
  _$RankingDocumentReference(this.reference);

  @override
  final DocumentReference<Ranking> reference;

  /// A reference to the [RankingCollectionReference] containing this document.
  RankingCollectionReference get parent {
    return _$RankingCollectionReference(reference.firestore);
  }

  late final RankingMemberCollectionReference members =
      _$RankingMemberCollectionReference(
    reference,
  );

  @override
  Stream<RankingDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return RankingDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<RankingDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return RankingDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? createdAt = _sentinel,
    Object? updatedAt = _sentinel,
    Object? title = _sentinel,
    Object? description = _sentinel,
    Object? imageUrl = _sentinel,
    Object? thumbnailUrl = _sentinel,
    Object? pinned = _sentinel,
    Object? tags = _sentinel,
    Object? recommendTagsShowing = _sentinel,
  }) async {
    final json = {
      if (createdAt != _sentinel) "createdAt": createdAt as DateTime?,
      if (updatedAt != _sentinel) "updatedAt": updatedAt as DateTime?,
      if (title != _sentinel) "title": title as String,
      if (description != _sentinel) "description": description as String,
      if (imageUrl != _sentinel) "imageUrl": imageUrl as String?,
      if (thumbnailUrl != _sentinel) "thumbnailUrl": thumbnailUrl as String?,
      if (pinned != _sentinel) "pinned": pinned as bool,
      if (tags != _sentinel) "tags": tags as List<String>,
      if (recommendTagsShowing != _sentinel)
        "recommendTagsShowing": recommendTagsShowing as bool,
    };

    return reference.update(json);
  }

  Future<void> set(Ranking value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is RankingDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class RankingDocumentSnapshot extends FirestoreDocumentSnapshot<Ranking> {
  RankingDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<Ranking> snapshot;

  @override
  RankingDocumentReference get reference {
    return RankingDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final Ranking? data;
}

abstract class RankingQuery
    implements QueryReference<Ranking, RankingQuerySnapshot> {
  @override
  RankingQuery limit(int limit);

  @override
  RankingQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  RankingQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  RankingQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  RankingQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RankingQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  RankingQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  RankingQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RankingQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RankingQuery whereImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  RankingQuery whereThumbnailUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  RankingQuery wherePinned({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });
  RankingQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  });
  RankingQuery whereRecommendTagsShowing({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  });

  RankingQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByUpdatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByImageUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByThumbnailUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByPinned({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByTags({
    bool descending = false,
    List<String> startAt,
    List<String> startAfter,
    List<String> endAt,
    List<String> endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });

  RankingQuery orderByRecommendTagsShowing({
    bool descending = false,
    bool startAt,
    bool startAfter,
    bool endAt,
    bool endBefore,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  });
}

class _$RankingQuery extends QueryReference<Ranking, RankingQuerySnapshot>
    implements RankingQuery {
  _$RankingQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<Ranking> reference;

  RankingQuerySnapshot _decodeSnapshot(
    QuerySnapshot<Ranking> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return RankingQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<RankingDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: RankingDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return RankingQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<RankingQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<RankingQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  RankingQuery limit(int limit) {
    return _$RankingQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  RankingQuery limitToLast(int limit) {
    return _$RankingQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  RankingQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$RankingQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  RankingQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["createdAt"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["updatedAt"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["description"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery whereImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["imageUrl"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery whereThumbnailUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["thumbnailUrl"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery wherePinned({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["pinned"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery whereTags({
    List<String>? isEqualTo,
    List<String>? isNotEqualTo,
    List<String>? isLessThan,
    List<String>? isLessThanOrEqualTo,
    List<String>? isGreaterThan,
    List<String>? isGreaterThanOrEqualTo,
    bool? isNull,
    String? arrayContains,
    List<String>? arrayContainsAny,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["tags"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
      ),
      _collection,
    );
  }

  RankingQuery whereRecommendTagsShowing({
    bool? isEqualTo,
    bool? isNotEqualTo,
    bool? isLessThan,
    bool? isLessThanOrEqualTo,
    bool? isGreaterThan,
    bool? isGreaterThanOrEqualTo,
    bool? isNull,
    List<bool>? whereIn,
    List<bool>? whereNotIn,
  }) {
    return _$RankingQuery(
      reference.where(
        _$$_RankingFieldMap["recommendTagsShowing"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["createdAt"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["updatedAt"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["title"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["description"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByImageUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["imageUrl"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByThumbnailUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["thumbnailUrl"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByPinned({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["pinned"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByTags({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query =
        reference.orderBy(_$$_RankingFieldMap["tags"]!, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  RankingQuery orderByRecommendTagsShowing({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingDocumentSnapshot? startAtDocument,
    RankingDocumentSnapshot? endAtDocument,
    RankingDocumentSnapshot? endBeforeDocument,
    RankingDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingFieldMap["recommendTagsShowing"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$RankingQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RankingQuerySnapshot
    extends FirestoreQuerySnapshot<Ranking, RankingQueryDocumentSnapshot> {
  RankingQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<Ranking> snapshot;

  @override
  final List<RankingQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RankingDocumentSnapshot>> docChanges;
}

class RankingQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Ranking>
    implements RankingDocumentSnapshot {
  RankingQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<Ranking> snapshot;

  @override
  RankingDocumentReference get reference {
    return RankingDocumentReference(snapshot.reference);
  }

  @override
  final Ranking data;
}

/// A collection reference object can be used for adding documents,
/// getting document references, and querying for documents
/// (using the methods inherited from Query).
abstract class RankingMemberCollectionReference
    implements
        RankingMemberQuery,
        FirestoreCollectionReference<RankingMember,
            RankingMemberQuerySnapshot> {
  factory RankingMemberCollectionReference(
    DocumentReference<Ranking> parent,
  ) = _$RankingMemberCollectionReference;

  static RankingMember fromFirestore(
    DocumentSnapshot<Map<String, Object?>> snapshot,
    SnapshotOptions? options,
  ) {
    return RankingMember.fromJson(snapshot.data()!);
  }

  static Map<String, Object?> toFirestore(
    RankingMember value,
    SetOptions? options,
  ) {
    return value.toJson();
  }

  @override
  CollectionReference<RankingMember> get reference;

  /// A reference to the containing [RankingDocumentReference] if this is a subcollection.
  RankingDocumentReference get parent;

  @override
  RankingMemberDocumentReference doc([String? id]);

  /// Add a new document to this collection with the specified data,
  /// assigning it a document ID automatically.
  Future<RankingMemberDocumentReference> add(RankingMember value);
}

class _$RankingMemberCollectionReference extends _$RankingMemberQuery
    implements RankingMemberCollectionReference {
  factory _$RankingMemberCollectionReference(
    DocumentReference<Ranking> parent,
  ) {
    return _$RankingMemberCollectionReference._(
      RankingDocumentReference(parent),
      parent.collection('members').withConverter(
            fromFirestore: RankingMemberCollectionReference.fromFirestore,
            toFirestore: RankingMemberCollectionReference.toFirestore,
          ),
    );
  }

  _$RankingMemberCollectionReference._(
    this.parent,
    CollectionReference<RankingMember> reference,
  ) : super(reference, reference);

  @override
  final RankingDocumentReference parent;

  String get path => reference.path;

  @override
  CollectionReference<RankingMember> get reference =>
      super.reference as CollectionReference<RankingMember>;

  @override
  RankingMemberDocumentReference doc([String? id]) {
    assert(
      id == null || id.split('/').length == 1,
      'The document ID cannot be from a different collection',
    );
    return RankingMemberDocumentReference(
      reference.doc(id),
    );
  }

  @override
  Future<RankingMemberDocumentReference> add(RankingMember value) {
    return reference
        .add(value)
        .then((ref) => RankingMemberDocumentReference(ref));
  }

  @override
  bool operator ==(Object other) {
    return other is _$RankingMemberCollectionReference &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

abstract class RankingMemberDocumentReference
    extends FirestoreDocumentReference<RankingMember,
        RankingMemberDocumentSnapshot> {
  factory RankingMemberDocumentReference(
          DocumentReference<RankingMember> reference) =
      _$RankingMemberDocumentReference;

  DocumentReference<RankingMember> get reference;

  /// A reference to the [RankingMemberCollectionReference] containing this document.
  RankingMemberCollectionReference get parent {
    return _$RankingMemberCollectionReference(
      reference.parent.parent!.withConverter<Ranking>(
        fromFirestore: RankingCollectionReference.fromFirestore,
        toFirestore: RankingCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RankingMemberDocumentSnapshot> snapshots();

  @override
  Future<RankingMemberDocumentSnapshot> get([GetOptions? options]);

  @override
  Future<void> delete();

  Future<void> update({
    DateTime? createdAt,
    DateTime? updatedAt,
    double order,
    String title,
    String description,
    String? imageUrl,
    String? thumbnailUrl,
  });

  Future<void> set(RankingMember value);
}

class _$RankingMemberDocumentReference extends FirestoreDocumentReference<
    RankingMember,
    RankingMemberDocumentSnapshot> implements RankingMemberDocumentReference {
  _$RankingMemberDocumentReference(this.reference);

  @override
  final DocumentReference<RankingMember> reference;

  /// A reference to the [RankingMemberCollectionReference] containing this document.
  RankingMemberCollectionReference get parent {
    return _$RankingMemberCollectionReference(
      reference.parent.parent!.withConverter<Ranking>(
        fromFirestore: RankingCollectionReference.fromFirestore,
        toFirestore: RankingCollectionReference.toFirestore,
      ),
    );
  }

  @override
  Stream<RankingMemberDocumentSnapshot> snapshots() {
    return reference.snapshots().map((snapshot) {
      return RankingMemberDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<RankingMemberDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then((snapshot) {
      return RankingMemberDocumentSnapshot._(
        snapshot,
        snapshot.data(),
      );
    });
  }

  @override
  Future<void> delete() {
    return reference.delete();
  }

  Future<void> update({
    Object? createdAt = _sentinel,
    Object? updatedAt = _sentinel,
    Object? order = _sentinel,
    Object? title = _sentinel,
    Object? description = _sentinel,
    Object? imageUrl = _sentinel,
    Object? thumbnailUrl = _sentinel,
  }) async {
    final json = {
      if (createdAt != _sentinel) "createdAt": createdAt as DateTime?,
      if (updatedAt != _sentinel) "updatedAt": updatedAt as DateTime?,
      if (order != _sentinel) "order": order as double,
      if (title != _sentinel) "title": title as String,
      if (description != _sentinel) "description": description as String,
      if (imageUrl != _sentinel) "imageUrl": imageUrl as String?,
      if (thumbnailUrl != _sentinel) "thumbnailUrl": thumbnailUrl as String?,
    };

    return reference.update(json);
  }

  Future<void> set(RankingMember value) {
    return reference.set(value);
  }

  @override
  bool operator ==(Object other) {
    return other is RankingMemberDocumentReference &&
        other.runtimeType == runtimeType &&
        other.parent == parent &&
        other.id == id;
  }

  @override
  int get hashCode => Object.hash(runtimeType, parent, id);
}

class RankingMemberDocumentSnapshot
    extends FirestoreDocumentSnapshot<RankingMember> {
  RankingMemberDocumentSnapshot._(
    this.snapshot,
    this.data,
  );

  @override
  final DocumentSnapshot<RankingMember> snapshot;

  @override
  RankingMemberDocumentReference get reference {
    return RankingMemberDocumentReference(
      snapshot.reference,
    );
  }

  @override
  final RankingMember? data;
}

abstract class RankingMemberQuery
    implements QueryReference<RankingMember, RankingMemberQuerySnapshot> {
  @override
  RankingMemberQuery limit(int limit);

  @override
  RankingMemberQuery limitToLast(int limit);

  /// Perform an order query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of order queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.orderByFieldPath(
  ///   FieldPath.fromString('title'),
  ///   startAt: 'title',
  /// );
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.orderByTitle(startAt: 'title');
  /// ```
  RankingMemberQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt,
    Object? startAfter,
    Object? endAt,
    Object? endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  /// Perform a where query based on a [FieldPath].
  ///
  /// This method is considered unsafe as it does check that the field path
  /// maps to a valid property or that parameters such as [isEqualTo] receive
  /// a value of the correct type.
  ///
  /// If possible, instead use the more explicit variant of where queries:
  ///
  /// **AVOID**:
  /// ```dart
  /// collection.whereFieldPath(FieldPath.fromString('title'), isEqualTo: 'title');
  /// ```
  ///
  /// **PREFER**:
  /// ```dart
  /// collection.whereTitle(isEqualTo: 'title');
  /// ```
  RankingMemberQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  });

  RankingMemberQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RankingMemberQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  RankingMemberQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  });
  RankingMemberQuery whereOrder({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  });
  RankingMemberQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RankingMemberQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  });
  RankingMemberQuery whereImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });
  RankingMemberQuery whereThumbnailUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  });

  RankingMemberQuery orderByDocumentId({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  RankingMemberQuery orderByCreatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  RankingMemberQuery orderByUpdatedAt({
    bool descending = false,
    DateTime? startAt,
    DateTime? startAfter,
    DateTime? endAt,
    DateTime? endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  RankingMemberQuery orderByOrder({
    bool descending = false,
    double startAt,
    double startAfter,
    double endAt,
    double endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  RankingMemberQuery orderByTitle({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  RankingMemberQuery orderByDescription({
    bool descending = false,
    String startAt,
    String startAfter,
    String endAt,
    String endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  RankingMemberQuery orderByImageUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });

  RankingMemberQuery orderByThumbnailUrl({
    bool descending = false,
    String? startAt,
    String? startAfter,
    String? endAt,
    String? endBefore,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  });
}

class _$RankingMemberQuery
    extends QueryReference<RankingMember, RankingMemberQuerySnapshot>
    implements RankingMemberQuery {
  _$RankingMemberQuery(
    this.reference,
    this._collection,
  );

  final CollectionReference<Object?> _collection;

  @override
  final Query<RankingMember> reference;

  RankingMemberQuerySnapshot _decodeSnapshot(
    QuerySnapshot<RankingMember> snapshot,
  ) {
    final docs = snapshot.docs.map((e) {
      return RankingMemberQueryDocumentSnapshot._(e, e.data());
    }).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return FirestoreDocumentChange<RankingMemberDocumentSnapshot>(
        type: change.type,
        oldIndex: change.oldIndex,
        newIndex: change.newIndex,
        doc: RankingMemberDocumentSnapshot._(change.doc, change.doc.data()),
      );
    }).toList();

    return RankingMemberQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  @override
  Stream<RankingMemberQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(_decodeSnapshot);
  }

  @override
  Future<RankingMemberQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(_decodeSnapshot);
  }

  @override
  RankingMemberQuery limit(int limit) {
    return _$RankingMemberQuery(
      reference.limit(limit),
      _collection,
    );
  }

  @override
  RankingMemberQuery limitToLast(int limit) {
    return _$RankingMemberQuery(
      reference.limitToLast(limit),
      _collection,
    );
  }

  RankingMemberQuery orderByFieldPath(
    FieldPath fieldPath, {
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(fieldPath, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery whereFieldPath(
    FieldPath fieldPath, {
    Object? isEqualTo,
    Object? isNotEqualTo,
    Object? isLessThan,
    Object? isLessThanOrEqualTo,
    Object? isGreaterThan,
    Object? isGreaterThanOrEqualTo,
    Object? arrayContains,
    List<Object?>? arrayContainsAny,
    List<Object?>? whereIn,
    List<Object?>? whereNotIn,
    bool? isNull,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        fieldPath,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        arrayContains: arrayContains,
        arrayContainsAny: arrayContainsAny,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
        isNull: isNull,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereDocumentId({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        FieldPath.documentId,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereCreatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        _$$_RankingMemberFieldMap["createdAt"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereUpdatedAt({
    DateTime? isEqualTo,
    DateTime? isNotEqualTo,
    DateTime? isLessThan,
    DateTime? isLessThanOrEqualTo,
    DateTime? isGreaterThan,
    DateTime? isGreaterThanOrEqualTo,
    bool? isNull,
    List<DateTime?>? whereIn,
    List<DateTime?>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        _$$_RankingMemberFieldMap["updatedAt"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereOrder({
    double? isEqualTo,
    double? isNotEqualTo,
    double? isLessThan,
    double? isLessThanOrEqualTo,
    double? isGreaterThan,
    double? isGreaterThanOrEqualTo,
    bool? isNull,
    List<double>? whereIn,
    List<double>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        _$$_RankingMemberFieldMap["order"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereTitle({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        _$$_RankingMemberFieldMap["title"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereDescription({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String>? whereIn,
    List<String>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        _$$_RankingMemberFieldMap["description"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereImageUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        _$$_RankingMemberFieldMap["imageUrl"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery whereThumbnailUrl({
    String? isEqualTo,
    String? isNotEqualTo,
    String? isLessThan,
    String? isLessThanOrEqualTo,
    String? isGreaterThan,
    String? isGreaterThanOrEqualTo,
    bool? isNull,
    List<String?>? whereIn,
    List<String?>? whereNotIn,
  }) {
    return _$RankingMemberQuery(
      reference.where(
        _$$_RankingMemberFieldMap["thumbnailUrl"]!,
        isEqualTo: isEqualTo,
        isNotEqualTo: isNotEqualTo,
        isLessThan: isLessThan,
        isLessThanOrEqualTo: isLessThanOrEqualTo,
        isGreaterThan: isGreaterThan,
        isGreaterThanOrEqualTo: isGreaterThanOrEqualTo,
        isNull: isNull,
        whereIn: whereIn,
        whereNotIn: whereNotIn,
      ),
      _collection,
    );
  }

  RankingMemberQuery orderByDocumentId({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(FieldPath.documentId, descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery orderByCreatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingMemberFieldMap["createdAt"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery orderByUpdatedAt({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingMemberFieldMap["updatedAt"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery orderByOrder({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingMemberFieldMap["order"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery orderByTitle({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingMemberFieldMap["title"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery orderByDescription({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingMemberFieldMap["description"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery orderByImageUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingMemberFieldMap["imageUrl"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  RankingMemberQuery orderByThumbnailUrl({
    bool descending = false,
    Object? startAt = _sentinel,
    Object? startAfter = _sentinel,
    Object? endAt = _sentinel,
    Object? endBefore = _sentinel,
    RankingMemberDocumentSnapshot? startAtDocument,
    RankingMemberDocumentSnapshot? endAtDocument,
    RankingMemberDocumentSnapshot? endBeforeDocument,
    RankingMemberDocumentSnapshot? startAfterDocument,
  }) {
    var query = reference.orderBy(_$$_RankingMemberFieldMap["thumbnailUrl"]!,
        descending: descending);

    if (startAtDocument != null) {
      query = query.startAtDocument(startAtDocument.snapshot);
    }
    if (startAfterDocument != null) {
      query = query.startAfterDocument(startAfterDocument.snapshot);
    }
    if (endAtDocument != null) {
      query = query.endAtDocument(endAtDocument.snapshot);
    }
    if (endBeforeDocument != null) {
      query = query.endBeforeDocument(endBeforeDocument.snapshot);
    }

    if (startAt != _sentinel) {
      query = query.startAt([startAt]);
    }
    if (startAfter != _sentinel) {
      query = query.startAfter([startAfter]);
    }
    if (endAt != _sentinel) {
      query = query.endAt([endAt]);
    }
    if (endBefore != _sentinel) {
      query = query.endBefore([endBefore]);
    }

    return _$RankingMemberQuery(query, _collection);
  }

  @override
  bool operator ==(Object other) {
    return other is _$RankingMemberQuery &&
        other.runtimeType == runtimeType &&
        other.reference == reference;
  }

  @override
  int get hashCode => Object.hash(runtimeType, reference);
}

class RankingMemberQuerySnapshot extends FirestoreQuerySnapshot<RankingMember,
    RankingMemberQueryDocumentSnapshot> {
  RankingMemberQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  final QuerySnapshot<RankingMember> snapshot;

  @override
  final List<RankingMemberQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RankingMemberDocumentSnapshot>> docChanges;
}

class RankingMemberQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<RankingMember>
    implements RankingMemberDocumentSnapshot {
  RankingMemberQueryDocumentSnapshot._(this.snapshot, this.data);

  @override
  final QueryDocumentSnapshot<RankingMember> snapshot;

  @override
  RankingMemberDocumentReference get reference {
    return RankingMemberDocumentReference(snapshot.reference);
  }

  @override
  final RankingMember data;
}

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Ranking _$$_RankingFromJson(Map<String, dynamic> json) => $checkedCreate(
      r'_$_Ranking',
      json,
      ($checkedConvert) {
        final val = _$_Ranking(
          createdAt: $checkedConvert(
              'created_at',
              (v) => _$JsonConverterFromJson<Timestamp, DateTime>(
                  v, const TimestampConverter().fromJson)),
          updatedAt: $checkedConvert(
              'updated_at',
              (v) => _$JsonConverterFromJson<Timestamp, DateTime>(
                  v, const TimestampConverter().fromJson)),
          title: $checkedConvert('title', (v) => v as String? ?? ''),
          description:
              $checkedConvert('description', (v) => v as String? ?? ''),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
          thumbnailUrl: $checkedConvert('thumbnail_url', (v) => v as String?),
          pinned: $checkedConvert('pinned', (v) => v as bool? ?? false),
          tags: $checkedConvert(
              'tags',
              (v) =>
                  (v as List<dynamic>?)?.map((e) => e as String).toList() ??
                  const <String>[]),
          recommendTagsShowing: $checkedConvert(
              'recommend_tags_showing', (v) => v as bool? ?? true),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'imageUrl': 'image_url',
        'thumbnailUrl': 'thumbnail_url',
        'recommendTagsShowing': 'recommend_tags_showing'
      },
    );

const _$$_RankingFieldMap = <String, String>{
  'createdAt': 'created_at',
  'updatedAt': 'updated_at',
  'title': 'title',
  'description': 'description',
  'imageUrl': 'image_url',
  'thumbnailUrl': 'thumbnail_url',
  'pinned': 'pinned',
  'tags': 'tags',
  'recommendTagsShowing': 'recommend_tags_showing',
};

Map<String, dynamic> _$$_RankingToJson(_$_Ranking instance) =>
    <String, dynamic>{
      'created_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'updated_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const TimestampConverter().toJson),
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
      'pinned': instance.pinned,
      'tags': instance.tags,
      'recommend_tags_showing': instance.recommendTagsShowing,
    };

Value? _$JsonConverterFromJson<Json, Value>(
  Object? json,
  Value? Function(Json json) fromJson,
) =>
    json == null ? null : fromJson(json as Json);

Json? _$JsonConverterToJson<Json, Value>(
  Value? value,
  Json? Function(Value value) toJson,
) =>
    value == null ? null : toJson(value);

_$_RankingMember _$$_RankingMemberFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      r'_$_RankingMember',
      json,
      ($checkedConvert) {
        final val = _$_RankingMember(
          createdAt: $checkedConvert(
              'created_at',
              (v) => _$JsonConverterFromJson<Timestamp, DateTime>(
                  v, const TimestampConverter().fromJson)),
          updatedAt: $checkedConvert(
              'updated_at',
              (v) => _$JsonConverterFromJson<Timestamp, DateTime>(
                  v, const TimestampConverter().fromJson)),
          order: $checkedConvert('order', (v) => (v as num).toDouble()),
          title: $checkedConvert('title', (v) => v as String),
          description:
              $checkedConvert('description', (v) => v as String? ?? ''),
          imageUrl: $checkedConvert('image_url', (v) => v as String?),
          thumbnailUrl: $checkedConvert('thumbnail_url', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'createdAt': 'created_at',
        'updatedAt': 'updated_at',
        'imageUrl': 'image_url',
        'thumbnailUrl': 'thumbnail_url'
      },
    );

const _$$_RankingMemberFieldMap = <String, String>{
  'createdAt': 'created_at',
  'updatedAt': 'updated_at',
  'order': 'order',
  'title': 'title',
  'description': 'description',
  'imageUrl': 'image_url',
  'thumbnailUrl': 'thumbnail_url',
};

Map<String, dynamic> _$$_RankingMemberToJson(_$_RankingMember instance) =>
    <String, dynamic>{
      'created_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.createdAt, const TimestampConverter().toJson),
      'updated_at': _$JsonConverterToJson<Timestamp, DateTime>(
          instance.updatedAt, const TimestampConverter().toJson),
      'order': instance.order,
      'title': instance.title,
      'description': instance.description,
      'image_url': instance.imageUrl,
      'thumbnail_url': instance.thumbnailUrl,
    };
