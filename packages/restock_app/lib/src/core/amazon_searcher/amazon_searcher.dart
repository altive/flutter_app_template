import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../environment.dart';

export 'package:amazon_paapi/amazon_paapi.dart';

/// AmazonのProduct Advertising API のクライアントを提供する
final paapiClientProvider = Provider<PaapiClient>((ref) {
  final env = ref.watch(environmentProvider);
  return PaapiClient(
    accessKey: env.paapiAccessKey,
    secretKey: env.paapiSecretKey,
    partnerTag: env.paapiPartnerTag,
  );
});
