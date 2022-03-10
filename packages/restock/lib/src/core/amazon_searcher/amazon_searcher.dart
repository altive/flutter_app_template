import 'package:amazon_paapi/amazon_paapi.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

export 'package:amazon_paapi/amazon_paapi.dart';

/// AmazonのProduct Advertising API のクライアントを提供する
final paapiClientProvider = Provider<PaapiClient>((ref) {
  return PaapiClient(
    accessKey: '',
    secretKey: '',
    partnerTag: '',
  );
});
