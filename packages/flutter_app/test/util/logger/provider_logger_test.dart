import 'package:flutter_app/util/logger/provider_logger.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('constructor', () {
    test(
      '環境変数でのログ出力指定がない場合、ログ出力タイプが空配列であること',
      () {
        expect(ProviderLogger().outputLogTypes, isEmpty);
      },
    );
  });
}
