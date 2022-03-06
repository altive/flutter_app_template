import 'package:firebase_storage/firebase_storage.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

final firebaseStorageProvider = Provider((_) => FirebaseStorage.instance);
