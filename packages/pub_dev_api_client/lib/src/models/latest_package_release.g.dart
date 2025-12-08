// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'latest_package_release.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LatestPackageRelease _$LatestPackageReleaseFromJson(
  Map<String, dynamic> json,
) => $checkedCreate('LatestPackageRelease', json, ($checkedConvert) {
  final val = LatestPackageRelease(
    pubspec: $checkedConvert(
      'pubspec',
      (v) => PackagePubspec.fromJson(v as Map<String, dynamic>),
    ),
  );
  return val;
});

Map<String, dynamic> _$LatestPackageReleaseToJson(
  LatestPackageRelease instance,
) => <String, dynamic>{'pubspec': instance.pubspec.toJson()};
