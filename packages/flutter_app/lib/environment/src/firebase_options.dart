import 'package:firebase_core/firebase_core.dart';

import 'firebase_options_dev.dart' as dev;
import 'firebase_options_prod.dart' as prod;
import 'firebase_options_stg.dart' as stg;
import 'flavor_provider.dart';

FirebaseOptions firebaseOptionsWithFlavor(Flavor flavor) {
  switch (flavor) {
    case Flavor.dev:
      return dev.DefaultFirebaseOptions.currentPlatform;
    case Flavor.stg:
      return stg.DefaultFirebaseOptions.currentPlatform;
    case Flavor.prod:
      return prod.DefaultFirebaseOptions.currentPlatform;
  }
}
