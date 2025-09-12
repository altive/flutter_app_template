import 'package:altfire_configurator/altfire_configurator.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

/// Provides a [Configurator] to retrieve parameters using "RemoteConfig".
///
/// It is recommended to call [Configurator.fetchAndActivate] before using
/// the parameters (e.g., at app startup) in order to fetch and activate them
/// for use in the app.
final configuratorProvider = Provider<Configurator>((ref) => Configurator());
