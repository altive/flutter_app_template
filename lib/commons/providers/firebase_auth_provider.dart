import 'package:firebase_auth/firebase_auth.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// FirebaseAuthのインスタンスを提供する
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
