// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_package_release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LatestPackageRelease _$LatestPackageReleaseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('_LatestPackageRelease', json, ($checkedConvert) {
  final val = _LatestPackageRelease(
    pubspec: $checkedConvert(
      'pubspec',
      (v) => PackagePubspec.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$LatestPackageReleaseToJson(
  _LatestPackageRelease instance,
) => <String, dynamic>{'pubspec': instance.pubspec.toJson()};
