import 'package:mockito/mockito.dart';

/// Listener is a mock of the ProviderContainer.listen callback.
class Listener<T> extends Mock {
  void call(T? previous, T next);
}
