import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl/intl.dart';
import 'package:util/util.dart';

part 'onetaplog.freezed.dart';
part 'onetaplog.g.dart';

@freezed
class OTLog with _$OTLog {
  const factory OTLog({
    required String title,
    @iconDataConverter required IconData iconData,
    @colorConverter required Color color,
    required DateTime lastUpdatedAt,
  }) = _OTLog;
  factory OTLog.fromJson(Map<String, dynamic> json) => _$OTLogFromJson(json);

  const OTLog._();

  String get lastUpdatedText {
    final now = DateTime.now();
    final difference = now.difference(lastUpdatedAt);
    if (difference.inHours < 1) {
      return '${difference.inMinutes}分前';
    }
    if (difference.inDays < 1) {
      return '${difference.inHours}時間前';
    }
    if (difference.inDays < 30) {
      return '${difference.inDays}日前';
    }
    if (difference.inDays < 183) {
      return '${difference.inDays ~/ 30}ヶ月前';
    }
    if (difference.inDays < 365) {
      return '${difference.inDays}日前';
    }
    return '${difference.inDays ~/ 365}年前';
    return DateFormat.MMMEd('ja').add_Hm().format(lastUpdatedAt);
  }
}

final existingLgsProvider = Provider((ref) {
  return sampleOTLogs;
});

final sampleOTLogs = [
  OTLog(
    title: '猫水取り替え',
    lastUpdatedAt: DateTime.now().subtract(const Duration(minutes: 1)),
    iconData: Icons.wash_outlined,
    color: Colors.teal,
  ),
  OTLog(
    title: '猫水取り替え',
    lastUpdatedAt: DateTime.now().subtract(const Duration(minutes: 59)),
    iconData: Icons.wash_outlined,
    color: Colors.orange,
  ),
  OTLog(
    title: '猫ごはん購入',
    lastUpdatedAt: DateTime.now().subtract(const Duration(hours: 5)),
    iconData: Icons.wash_outlined,
    color: Colors.red,
  ),
  OTLog(
    title: '猫トイレ掃除',
    lastUpdatedAt: DateTime.now().subtract(const Duration(hours: 20)),
    iconData: Icons.wash_outlined,
    color: Colors.amber,
  ),
  OTLog(
    title: '授乳',
    lastUpdatedAt: DateTime.now().subtract(const Duration(days: 5)),
    iconData: Icons.mail_lock,
    color: Colors.green,
  ),
  OTLog(
    title: '授乳',
    lastUpdatedAt: DateTime.now().subtract(const Duration(days: 18)),
    iconData: Icons.mail_lock,
    color: Colors.purple,
  ),
  OTLog(
    title: 'オムツ替え',
    lastUpdatedAt: DateTime.now().subtract(const Duration(days: 31)),
    iconData: Icons.hourglass_bottom,
    color: Colors.blue,
  ),
  OTLog(
    title: '一日に一リットル以上の水を必ず飲むことをここに誓って必ず達成します！！！',
    lastUpdatedAt: DateTime.now().subtract(const Duration(days: 365)),
    iconData: Icons.watch_later,
    color: Colors.blueAccent,
  ),
];
