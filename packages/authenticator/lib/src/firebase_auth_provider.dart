import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'firebase_auth_provider.g.dart';

/// FirebaseAuthのインスタンスを提供する
@Riverpod(keepAlive: true)
FirebaseAuth firebaseAuth(FirebaseAuthRef ref) => FirebaseAuth.instance;
