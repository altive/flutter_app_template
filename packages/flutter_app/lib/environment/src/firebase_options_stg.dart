// File generated by FlutterFire CLI.
// ignore_for_file: lines_longer_than_80_chars, avoid_classes_with_only_static_members
import 'package:firebase_core/firebase_core.dart' show FirebaseOptions;
import 'package:flutter/foundation.dart'
    show defaultTargetPlatform, kIsWeb, TargetPlatform;

/// Default [FirebaseOptions] for use with your Firebase apps.
///
/// Example:
/// ```dart
/// import 'firebase_options_stg.dart';
/// // ...
/// await Firebase.initializeApp(
///   options: DefaultFirebaseOptions.currentPlatform,
/// );
/// ```
class DefaultFirebaseOptions {
  static FirebaseOptions get currentPlatform {
    if (kIsWeb) {
      return web;
    }
    switch (defaultTargetPlatform) {
      case TargetPlatform.android:
        return android;
      case TargetPlatform.iOS:
        return ios;
      case TargetPlatform.macOS:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for macOS - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.windows:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for windows - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      case TargetPlatform.linux:
        throw UnsupportedError(
          'DefaultFirebaseOptions have not been configured for linux - '
          'you can reconfigure this by running the FlutterFire CLI again.',
        );
      default:
        throw UnsupportedError(
          'DefaultFirebaseOptions are not supported for this platform.',
        );
    }
  }

  static const FirebaseOptions web = FirebaseOptions(
    apiKey: 'AIzaSyALNA5hH-DrVg1qUk2Ycqv-W2kGU1SpHaI',
    appId: '1:502626918852:web:8cc56d7467967ee5dfc491',
    messagingSenderId: '502626918852',
    projectId: 'flutter-app-template-stg',
    authDomain: 'flutter-app-template-stg.firebaseapp.com',
    storageBucket: 'flutter-app-template-stg.firebasestorage.app',
    measurementId: 'G-9DC69MGFRX',
  );

  static const FirebaseOptions android = FirebaseOptions(
    apiKey: 'AIzaSyCVr6vUwFGl-ylsKQWahGWEomYygqal8WY',
    appId: '1:502626918852:android:f7e395467b0e3e5bdfc491',
    messagingSenderId: '502626918852',
    projectId: 'flutter-app-template-stg',
    storageBucket: 'flutter-app-template-stg.firebasestorage.app',
  );

  static const FirebaseOptions ios = FirebaseOptions(
    apiKey: 'AIzaSyACYrCRpTpoH1dxPJY3atGxmwKmtXRdw24',
    appId: '1:502626918852:ios:99ee534eace74ff6dfc491',
    messagingSenderId: '502626918852',
    projectId: 'flutter-app-template-stg',
    storageBucket: 'flutter-app-template-stg.firebasestorage.app',
    iosBundleId: 'jp.co.altive.fat.stg',
  );
}
