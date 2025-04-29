#!/usr/bin/env dart
// 問題なし
// ignore_for_file: avoid_print

// FlutterFire設定ファイル生成スクリプト
//
// 実行方法:
// ```sh
// dart flutterfire_configure.dart
// ```

import 'dart:io';

/// フレーバーを表すEnum
enum Flavor {
  dev(
    projectId: 'restock-development',
    androidPackage: 'jp.altive.rollingstock.development',
    iosBundle: 'jp.altive.rollingstock.development',
  ),
  stg(
    projectId: 'rolling-stock-app',
    androidPackage: 'jp.altive.rollingstock',
    iosBundle: 'jp.altive.rollingstock',
  ),
  prod(
    projectId: 're-stock',
    androidPackage: 'jp.altive.restock',
    iosBundle: 'jp.altive.restock',
  );

  /// コンストラクタ
  const Flavor({
    required this.projectId,
    required this.androidPackage,
    required this.iosBundle,
  });

  /// Firebaseプロジェクト名
  final String projectId;

  /// Androidパッケージ名
  final String androidPackage;

  /// iOSバンドルID
  final String iosBundle;
}

/// iOS Schemes
const iosSchemes = ['Debug', 'Profile', 'Release'];

/// 対象プラットフォーム
const platforms = 'android,ios';

void main() async {
  print('🔥 FlutterFire Configure コマンドを実行します...');

  // 各フレーバーとiOS Schemeの組み合わせを処理
  for (final flavor in Flavor.values) {
    print('🍸 Flavor: ${flavor.name} の設定を開始...');

    for (final scheme in iosSchemes) {
      print('🔨 Xcode Config: $scheme-${flavor.name} の生成を開始...');

      // FlutterFire コマンドを実行
      final result = await Process.run('flutterfire', [
        'configure',
        '--yes',
        '--project',
        flavor.projectId,
        '--out',
        'lib/environment/src/firebase_options_${flavor.name}.dart',
        '--android-out',
        'android/app/src/${flavor.name}/google-services.json',
        '--ios-out',
        'ios/${flavor.name}/',
        '--platforms',
        platforms,
        '--android-package-name',
        flavor.androidPackage,
        '--ios-bundle-id',
        flavor.iosBundle,
        '--ios-build-config=$scheme-${flavor.name}',
      ]);

      if (result.exitCode != 0) {
        print('❌ エラーが発生しました: ${result.stderr}');
        exit(1);
      }
    }
  }
  print('✅ すべてのFlutterFire設定が正常に生成されました！');
}
