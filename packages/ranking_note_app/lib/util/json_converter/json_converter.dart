import 'package:json_annotation/json_annotation.dart';

import 'timestamp_converter.dart';

const allJsonConverters = <JsonConverter<dynamic, dynamic>>[
  timestampConverter,
];

const allJsonConvertersSerializable = JsonSerializable(
  converters: allJsonConverters,
);
