import 'package:analysis_logger/analysis_logger.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'analysis_logger_provider.g.dart';

/// `analysis_logger` パッケージの `AnalysisLogger` クラスインスタンスを提供する。
@Riverpod(keepAlive: true)
AnalysisLogger analysisLogger(AnalysisLoggerRef ref) {
  throw UnimplementedError();
}
