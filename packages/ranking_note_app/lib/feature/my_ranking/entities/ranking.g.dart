// GENERATED CODE - DO NOT MODIFY BY HAND

// ignore_for_file: type=lint, implicit_dynamic_parameter, implicit_dynamic_type, implicit_dynamic_method, strict_raw_type

part of 'ranking.dart';

// **************************************************************************
// CollectionGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, require_trailing_commas, prefer_single_quotes, prefer_double_quotes, use_super_parameters

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
  ) : super(reference, $referenceWithoutCursor: reference);

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

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime? updatedAt,
    FieldValue updatedAtFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String? imageUrl,
    FieldValue imageUrlFieldValue,
    String? thumbnailUrl,
    FieldValue thumbnailUrlFieldValue,
    bool pinned,
    FieldValue pinnedFieldValue,
    List<String> tags,
    FieldValue tagsFieldValue,
    bool recommendTagsShowing,
    FieldValue recommendTagsShowingFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime? updatedAt,
    FieldValue updatedAtFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String? imageUrl,
    FieldValue imageUrlFieldValue,
    String? thumbnailUrl,
    FieldValue thumbnailUrlFieldValue,
    bool pinned,
    FieldValue pinnedFieldValue,
    List<String> tags,
    FieldValue tagsFieldValue,
    bool recommendTagsShowing,
    FieldValue recommendTagsShowingFieldValue,
  });
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
    return reference.snapshots().map(RankingDocumentSnapshot._);
  }

  @override
  Future<RankingDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RankingDocumentSnapshot._);
  }

  @override
  Future<RankingDocumentSnapshot> transactionGet(Transaction transaction) {
    return transaction.get(reference).then(RankingDocumentSnapshot._);
  }

  Future<void> update({
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? imageUrl = _sentinel,
    FieldValue? imageUrlFieldValue,
    Object? thumbnailUrl = _sentinel,
    FieldValue? thumbnailUrlFieldValue,
    Object? pinned = _sentinel,
    FieldValue? pinnedFieldValue,
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? recommendTagsShowing = _sentinel,
    FieldValue? recommendTagsShowingFieldValue,
  }) async {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      imageUrl == _sentinel || imageUrlFieldValue == null,
      "Cannot specify both imageUrl and imageUrlFieldValue",
    );
    assert(
      thumbnailUrl == _sentinel || thumbnailUrlFieldValue == null,
      "Cannot specify both thumbnailUrl and thumbnailUrlFieldValue",
    );
    assert(
      pinned == _sentinel || pinnedFieldValue == null,
      "Cannot specify both pinned and pinnedFieldValue",
    );
    assert(
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      recommendTagsShowing == _sentinel ||
          recommendTagsShowingFieldValue == null,
      "Cannot specify both recommendTagsShowing and recommendTagsShowingFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$$_RankingFieldMap['createdAt']!: createdAt as DateTime?,
      if (createdAtFieldValue != null)
        _$$_RankingFieldMap['createdAt']!: createdAtFieldValue,
      if (updatedAt != _sentinel)
        _$$_RankingFieldMap['updatedAt']!: updatedAt as DateTime?,
      if (updatedAtFieldValue != null)
        _$$_RankingFieldMap['updatedAt']!: updatedAtFieldValue,
      if (title != _sentinel) _$$_RankingFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$$_RankingFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$$_RankingFieldMap['description']!: description as String,
      if (descriptionFieldValue != null)
        _$$_RankingFieldMap['description']!: descriptionFieldValue,
      if (imageUrl != _sentinel)
        _$$_RankingFieldMap['imageUrl']!: imageUrl as String?,
      if (imageUrlFieldValue != null)
        _$$_RankingFieldMap['imageUrl']!: imageUrlFieldValue,
      if (thumbnailUrl != _sentinel)
        _$$_RankingFieldMap['thumbnailUrl']!: thumbnailUrl as String?,
      if (thumbnailUrlFieldValue != null)
        _$$_RankingFieldMap['thumbnailUrl']!: thumbnailUrlFieldValue,
      if (pinned != _sentinel) _$$_RankingFieldMap['pinned']!: pinned as bool,
      if (pinnedFieldValue != null)
        _$$_RankingFieldMap['pinned']!: pinnedFieldValue,
      if (tags != _sentinel) _$$_RankingFieldMap['tags']!: tags as List<String>,
      if (tagsFieldValue != null) _$$_RankingFieldMap['tags']!: tagsFieldValue,
      if (recommendTagsShowing != _sentinel)
        _$$_RankingFieldMap['recommendTagsShowing']!:
            recommendTagsShowing as bool,
      if (recommendTagsShowingFieldValue != null)
        _$$_RankingFieldMap['recommendTagsShowing']!:
            recommendTagsShowingFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? imageUrl = _sentinel,
    FieldValue? imageUrlFieldValue,
    Object? thumbnailUrl = _sentinel,
    FieldValue? thumbnailUrlFieldValue,
    Object? pinned = _sentinel,
    FieldValue? pinnedFieldValue,
    Object? tags = _sentinel,
    FieldValue? tagsFieldValue,
    Object? recommendTagsShowing = _sentinel,
    FieldValue? recommendTagsShowingFieldValue,
  }) {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      imageUrl == _sentinel || imageUrlFieldValue == null,
      "Cannot specify both imageUrl and imageUrlFieldValue",
    );
    assert(
      thumbnailUrl == _sentinel || thumbnailUrlFieldValue == null,
      "Cannot specify both thumbnailUrl and thumbnailUrlFieldValue",
    );
    assert(
      pinned == _sentinel || pinnedFieldValue == null,
      "Cannot specify both pinned and pinnedFieldValue",
    );
    assert(
      tags == _sentinel || tagsFieldValue == null,
      "Cannot specify both tags and tagsFieldValue",
    );
    assert(
      recommendTagsShowing == _sentinel ||
          recommendTagsShowingFieldValue == null,
      "Cannot specify both recommendTagsShowing and recommendTagsShowingFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$$_RankingFieldMap['createdAt']!: createdAt as DateTime?,
      if (createdAtFieldValue != null)
        _$$_RankingFieldMap['createdAt']!: createdAtFieldValue,
      if (updatedAt != _sentinel)
        _$$_RankingFieldMap['updatedAt']!: updatedAt as DateTime?,
      if (updatedAtFieldValue != null)
        _$$_RankingFieldMap['updatedAt']!: updatedAtFieldValue,
      if (title != _sentinel) _$$_RankingFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$$_RankingFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$$_RankingFieldMap['description']!: description as String,
      if (descriptionFieldValue != null)
        _$$_RankingFieldMap['description']!: descriptionFieldValue,
      if (imageUrl != _sentinel)
        _$$_RankingFieldMap['imageUrl']!: imageUrl as String?,
      if (imageUrlFieldValue != null)
        _$$_RankingFieldMap['imageUrl']!: imageUrlFieldValue,
      if (thumbnailUrl != _sentinel)
        _$$_RankingFieldMap['thumbnailUrl']!: thumbnailUrl as String?,
      if (thumbnailUrlFieldValue != null)
        _$$_RankingFieldMap['thumbnailUrl']!: thumbnailUrlFieldValue,
      if (pinned != _sentinel) _$$_RankingFieldMap['pinned']!: pinned as bool,
      if (pinnedFieldValue != null)
        _$$_RankingFieldMap['pinned']!: pinnedFieldValue,
      if (tags != _sentinel) _$$_RankingFieldMap['tags']!: tags as List<String>,
      if (tagsFieldValue != null) _$$_RankingFieldMap['tags']!: tagsFieldValue,
      if (recommendTagsShowing != _sentinel)
        _$$_RankingFieldMap['recommendTagsShowing']!:
            recommendTagsShowing as bool,
      if (recommendTagsShowingFieldValue != null)
        _$$_RankingFieldMap['recommendTagsShowing']!:
            recommendTagsShowingFieldValue,
    };

    transaction.update(reference, json);
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
    this._collection, {
    required Query<Ranking> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RankingQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference.snapshots().map(RankingQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RankingQuerySnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RankingQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RankingQuery limit(int limit) {
    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RankingQuery limitToLast(int limit) {
    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
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
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['createdAt']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['updatedAt']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['title']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['description']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['imageUrl']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['thumbnailUrl']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['pinned']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['tags']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingFieldMap['recommendTagsShowing']!,
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
      $queryCursor: $queryCursor,
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
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingFieldMap['createdAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingFieldMap['updatedAt']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$$_RankingFieldMap['title']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingFieldMap['description']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingFieldMap['imageUrl']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingFieldMap['thumbnailUrl']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingFieldMap['pinned']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(_$$_RankingFieldMap['tags']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(
        _$$_RankingFieldMap['recommendTagsShowing']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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

class RankingDocumentSnapshot extends FirestoreDocumentSnapshot<Ranking> {
  RankingDocumentSnapshot._(this.snapshot) : data = snapshot.data();

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

class RankingQuerySnapshot
    extends FirestoreQuerySnapshot<Ranking, RankingQueryDocumentSnapshot> {
  RankingQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RankingQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<Ranking> snapshot,
  ) {
    final docs = snapshot.docs.map(RankingQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RankingDocumentSnapshot._,
      );
    }).toList();

    return RankingQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RankingDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RankingDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RankingDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<Ranking> snapshot;

  @override
  final List<RankingQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RankingDocumentSnapshot>> docChanges;
}

class RankingQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<Ranking>
    implements RankingDocumentSnapshot {
  RankingQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<Ranking> snapshot;

  @override
  final Ranking data;

  @override
  RankingDocumentReference get reference {
    return RankingDocumentReference(snapshot.reference);
  }
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
  ) : super(reference, $referenceWithoutCursor: reference);

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

  /// Updates data on the document. Data will be merged with any existing
  /// document data.
  ///
  /// If no document exists yet, the update will fail.
  Future<void> update({
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime? updatedAt,
    FieldValue updatedAtFieldValue,
    double order,
    FieldValue orderFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String? imageUrl,
    FieldValue imageUrlFieldValue,
    String? thumbnailUrl,
    FieldValue thumbnailUrlFieldValue,
  });

  /// Updates fields in the current document using the transaction API.
  ///
  /// The update will fail if applied to a document that does not exist.
  void transactionUpdate(
    Transaction transaction, {
    DateTime? createdAt,
    FieldValue createdAtFieldValue,
    DateTime? updatedAt,
    FieldValue updatedAtFieldValue,
    double order,
    FieldValue orderFieldValue,
    String title,
    FieldValue titleFieldValue,
    String description,
    FieldValue descriptionFieldValue,
    String? imageUrl,
    FieldValue imageUrlFieldValue,
    String? thumbnailUrl,
    FieldValue thumbnailUrlFieldValue,
  });
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
    return reference.snapshots().map(RankingMemberDocumentSnapshot._);
  }

  @override
  Future<RankingMemberDocumentSnapshot> get([GetOptions? options]) {
    return reference.get(options).then(RankingMemberDocumentSnapshot._);
  }

  @override
  Future<RankingMemberDocumentSnapshot> transactionGet(
      Transaction transaction) {
    return transaction.get(reference).then(RankingMemberDocumentSnapshot._);
  }

  Future<void> update({
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? order = _sentinel,
    FieldValue? orderFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? imageUrl = _sentinel,
    FieldValue? imageUrlFieldValue,
    Object? thumbnailUrl = _sentinel,
    FieldValue? thumbnailUrlFieldValue,
  }) async {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      order == _sentinel || orderFieldValue == null,
      "Cannot specify both order and orderFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      imageUrl == _sentinel || imageUrlFieldValue == null,
      "Cannot specify both imageUrl and imageUrlFieldValue",
    );
    assert(
      thumbnailUrl == _sentinel || thumbnailUrlFieldValue == null,
      "Cannot specify both thumbnailUrl and thumbnailUrlFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$$_RankingMemberFieldMap['createdAt']!: createdAt as DateTime?,
      if (createdAtFieldValue != null)
        _$$_RankingMemberFieldMap['createdAt']!: createdAtFieldValue,
      if (updatedAt != _sentinel)
        _$$_RankingMemberFieldMap['updatedAt']!: updatedAt as DateTime?,
      if (updatedAtFieldValue != null)
        _$$_RankingMemberFieldMap['updatedAt']!: updatedAtFieldValue,
      if (order != _sentinel)
        _$$_RankingMemberFieldMap['order']!: order as double,
      if (orderFieldValue != null)
        _$$_RankingMemberFieldMap['order']!: orderFieldValue,
      if (title != _sentinel)
        _$$_RankingMemberFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$$_RankingMemberFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$$_RankingMemberFieldMap['description']!: description as String,
      if (descriptionFieldValue != null)
        _$$_RankingMemberFieldMap['description']!: descriptionFieldValue,
      if (imageUrl != _sentinel)
        _$$_RankingMemberFieldMap['imageUrl']!: imageUrl as String?,
      if (imageUrlFieldValue != null)
        _$$_RankingMemberFieldMap['imageUrl']!: imageUrlFieldValue,
      if (thumbnailUrl != _sentinel)
        _$$_RankingMemberFieldMap['thumbnailUrl']!: thumbnailUrl as String?,
      if (thumbnailUrlFieldValue != null)
        _$$_RankingMemberFieldMap['thumbnailUrl']!: thumbnailUrlFieldValue,
    };

    return reference.update(json);
  }

  void transactionUpdate(
    Transaction transaction, {
    Object? createdAt = _sentinel,
    FieldValue? createdAtFieldValue,
    Object? updatedAt = _sentinel,
    FieldValue? updatedAtFieldValue,
    Object? order = _sentinel,
    FieldValue? orderFieldValue,
    Object? title = _sentinel,
    FieldValue? titleFieldValue,
    Object? description = _sentinel,
    FieldValue? descriptionFieldValue,
    Object? imageUrl = _sentinel,
    FieldValue? imageUrlFieldValue,
    Object? thumbnailUrl = _sentinel,
    FieldValue? thumbnailUrlFieldValue,
  }) {
    assert(
      createdAt == _sentinel || createdAtFieldValue == null,
      "Cannot specify both createdAt and createdAtFieldValue",
    );
    assert(
      updatedAt == _sentinel || updatedAtFieldValue == null,
      "Cannot specify both updatedAt and updatedAtFieldValue",
    );
    assert(
      order == _sentinel || orderFieldValue == null,
      "Cannot specify both order and orderFieldValue",
    );
    assert(
      title == _sentinel || titleFieldValue == null,
      "Cannot specify both title and titleFieldValue",
    );
    assert(
      description == _sentinel || descriptionFieldValue == null,
      "Cannot specify both description and descriptionFieldValue",
    );
    assert(
      imageUrl == _sentinel || imageUrlFieldValue == null,
      "Cannot specify both imageUrl and imageUrlFieldValue",
    );
    assert(
      thumbnailUrl == _sentinel || thumbnailUrlFieldValue == null,
      "Cannot specify both thumbnailUrl and thumbnailUrlFieldValue",
    );
    final json = {
      if (createdAt != _sentinel)
        _$$_RankingMemberFieldMap['createdAt']!: createdAt as DateTime?,
      if (createdAtFieldValue != null)
        _$$_RankingMemberFieldMap['createdAt']!: createdAtFieldValue,
      if (updatedAt != _sentinel)
        _$$_RankingMemberFieldMap['updatedAt']!: updatedAt as DateTime?,
      if (updatedAtFieldValue != null)
        _$$_RankingMemberFieldMap['updatedAt']!: updatedAtFieldValue,
      if (order != _sentinel)
        _$$_RankingMemberFieldMap['order']!: order as double,
      if (orderFieldValue != null)
        _$$_RankingMemberFieldMap['order']!: orderFieldValue,
      if (title != _sentinel)
        _$$_RankingMemberFieldMap['title']!: title as String,
      if (titleFieldValue != null)
        _$$_RankingMemberFieldMap['title']!: titleFieldValue,
      if (description != _sentinel)
        _$$_RankingMemberFieldMap['description']!: description as String,
      if (descriptionFieldValue != null)
        _$$_RankingMemberFieldMap['description']!: descriptionFieldValue,
      if (imageUrl != _sentinel)
        _$$_RankingMemberFieldMap['imageUrl']!: imageUrl as String?,
      if (imageUrlFieldValue != null)
        _$$_RankingMemberFieldMap['imageUrl']!: imageUrlFieldValue,
      if (thumbnailUrl != _sentinel)
        _$$_RankingMemberFieldMap['thumbnailUrl']!: thumbnailUrl as String?,
      if (thumbnailUrlFieldValue != null)
        _$$_RankingMemberFieldMap['thumbnailUrl']!: thumbnailUrlFieldValue,
    };

    transaction.update(reference, json);
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
    this._collection, {
    required Query<RankingMember> $referenceWithoutCursor,
    $QueryCursor $queryCursor = const $QueryCursor(),
  }) : super(
          $referenceWithoutCursor: $referenceWithoutCursor,
          $queryCursor: $queryCursor,
        );

  final CollectionReference<Object?> _collection;

  @override
  Stream<RankingMemberQuerySnapshot> snapshots([SnapshotOptions? options]) {
    return reference
        .snapshots()
        .map(RankingMemberQuerySnapshot._fromQuerySnapshot);
  }

  @override
  Future<RankingMemberQuerySnapshot> get([GetOptions? options]) {
    return reference
        .get(options)
        .then(RankingMemberQuerySnapshot._fromQuerySnapshot);
  }

  @override
  RankingMemberQuery limit(int limit) {
    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limit(limit),
      $queryCursor: $queryCursor,
    );
  }

  @override
  RankingMemberQuery limitToLast(int limit) {
    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.limitToLast(limit),
      $queryCursor: $queryCursor,
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
    final query =
        $referenceWithoutCursor.orderBy(fieldPath, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }
    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingMemberFieldMap['createdAt']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingMemberFieldMap['updatedAt']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingMemberFieldMap['order']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingMemberFieldMap['title']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingMemberFieldMap['description']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingMemberFieldMap['imageUrl']!,
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
      $queryCursor: $queryCursor,
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
      _collection,
      $referenceWithoutCursor: $referenceWithoutCursor.where(
        _$$_RankingMemberFieldMap['thumbnailUrl']!,
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
      $queryCursor: $queryCursor,
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
    final query = $referenceWithoutCursor.orderBy(FieldPath.documentId,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(
        _$$_RankingMemberFieldMap['createdAt']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(
        _$$_RankingMemberFieldMap['updatedAt']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingMemberFieldMap['order']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor
        .orderBy(_$$_RankingMemberFieldMap['title']!, descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(
        _$$_RankingMemberFieldMap['description']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(
        _$$_RankingMemberFieldMap['imageUrl']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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
    final query = $referenceWithoutCursor.orderBy(
        _$$_RankingMemberFieldMap['thumbnailUrl']!,
        descending: descending);
    var queryCursor = $queryCursor;

    if (startAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAt: const [],
        startAtDocumentSnapshot: startAtDocument.snapshot,
      );
    }
    if (startAfterDocument != null) {
      queryCursor = queryCursor.copyWith(
        startAfter: const [],
        startAfterDocumentSnapshot: startAfterDocument.snapshot,
      );
    }
    if (endAtDocument != null) {
      queryCursor = queryCursor.copyWith(
        endAt: const [],
        endAtDocumentSnapshot: endAtDocument.snapshot,
      );
    }
    if (endBeforeDocument != null) {
      queryCursor = queryCursor.copyWith(
        endBefore: const [],
        endBeforeDocumentSnapshot: endBeforeDocument.snapshot,
      );
    }

    if (startAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAt: [...queryCursor.startAt, startAt],
        startAtDocumentSnapshot: null,
      );
    }
    if (startAfter != _sentinel) {
      queryCursor = queryCursor.copyWith(
        startAfter: [...queryCursor.startAfter, startAfter],
        startAfterDocumentSnapshot: null,
      );
    }
    if (endAt != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endAt: [...queryCursor.endAt, endAt],
        endAtDocumentSnapshot: null,
      );
    }
    if (endBefore != _sentinel) {
      queryCursor = queryCursor.copyWith(
        endBefore: [...queryCursor.endBefore, endBefore],
        endBeforeDocumentSnapshot: null,
      );
    }

    return _$RankingMemberQuery(
      _collection,
      $referenceWithoutCursor: query,
      $queryCursor: queryCursor,
    );
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

class RankingMemberDocumentSnapshot
    extends FirestoreDocumentSnapshot<RankingMember> {
  RankingMemberDocumentSnapshot._(this.snapshot) : data = snapshot.data();

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

class RankingMemberQuerySnapshot extends FirestoreQuerySnapshot<RankingMember,
    RankingMemberQueryDocumentSnapshot> {
  RankingMemberQuerySnapshot._(
    this.snapshot,
    this.docs,
    this.docChanges,
  );

  factory RankingMemberQuerySnapshot._fromQuerySnapshot(
    QuerySnapshot<RankingMember> snapshot,
  ) {
    final docs =
        snapshot.docs.map(RankingMemberQueryDocumentSnapshot._).toList();

    final docChanges = snapshot.docChanges.map((change) {
      return _decodeDocumentChange(
        change,
        RankingMemberDocumentSnapshot._,
      );
    }).toList();

    return RankingMemberQuerySnapshot._(
      snapshot,
      docs,
      docChanges,
    );
  }

  static FirestoreDocumentChange<RankingMemberDocumentSnapshot>
      _decodeDocumentChange<T>(
    DocumentChange<T> docChange,
    RankingMemberDocumentSnapshot Function(DocumentSnapshot<T> doc) decodeDoc,
  ) {
    return FirestoreDocumentChange<RankingMemberDocumentSnapshot>(
      type: docChange.type,
      oldIndex: docChange.oldIndex,
      newIndex: docChange.newIndex,
      doc: decodeDoc(docChange.doc),
    );
  }

  final QuerySnapshot<RankingMember> snapshot;

  @override
  final List<RankingMemberQueryDocumentSnapshot> docs;

  @override
  final List<FirestoreDocumentChange<RankingMemberDocumentSnapshot>> docChanges;
}

class RankingMemberQueryDocumentSnapshot
    extends FirestoreQueryDocumentSnapshot<RankingMember>
    implements RankingMemberDocumentSnapshot {
  RankingMemberQueryDocumentSnapshot._(this.snapshot) : data = snapshot.data();

  @override
  final QueryDocumentSnapshot<RankingMember> snapshot;

  @override
  final RankingMember data;

  @override
  RankingMemberDocumentReference get reference {
    return RankingMemberDocumentReference(snapshot.reference);
  }
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
