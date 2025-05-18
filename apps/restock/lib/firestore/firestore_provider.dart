import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firestore_provider.g.dart';

@Riverpod(keepAlive: true)
FirebaseFirestore firestore(Ref ref) => FirebaseFirestore.instance;
