import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Firebase Dynamic Linksのインスタンスを提供する
final dynamicLinksProvider = Provider((ref) => FirebaseDynamicLinks.instance);
