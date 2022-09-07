import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

/// FirebaseAuthのインスタンスを提供する
final firebaseAuthProvider = Provider((ref) => FirebaseAuth.instance);
