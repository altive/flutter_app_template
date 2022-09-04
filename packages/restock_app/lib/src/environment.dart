import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'utils/utils.dart';

final environmentProvider = Provider<Environment>(
  (ref) => throw UnimplementedError(),
);

class Environment {
  const Environment(this.flavor);

  final Flavor flavor;

  Future<void> initialize() async {
    await dotenv.load(fileName: '${flavor.name}.env');
  }

  String get paapiAccessKey {
    return dotenv.get('PAAPI_ACCESS_KEY');
  }

  String get paapiSecretKey {
    return dotenv.get('PAAPI_SECRET_KEY');
  }

  String get paapiPartnerTag {
    return dotenv.get('PAAPI_PARTNER_TAG');
  }

  String get revenuecatPublicApiAndroidKey {
    return dotenv.get('REVENUECAT_PUBLIC_API_ANDROID_KEY');
  }

  String get revenuecatPublicApiIosKey {
    return dotenv.get('REVENUECAT_PUBLIC_API_IOS_KEY');
  }
}
