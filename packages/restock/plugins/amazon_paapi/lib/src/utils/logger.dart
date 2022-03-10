import 'package:simple_logger/simple_logger.dart';

final SimpleLogger logger = SimpleLogger()
  ..setLevel(
    Level.ALL,
    includeCallerInfo: !const bool.fromEnvironment('dart.vm.product'),
  );
