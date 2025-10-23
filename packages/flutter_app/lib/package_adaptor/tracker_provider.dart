import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:tracker/tracker.dart';

/// Provides an instance of the [Tracker] class
/// from the `altfire_tracker` package.
///
/// Assumes override in ProviderScope to record Flutter framework errors
/// in `main.dart`.
final trackerProvider = Provider<Tracker>((ref) => throw UnimplementedError());
