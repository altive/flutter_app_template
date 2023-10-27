import 'package:flutter_app/pages/riverpod_example_page/async_notifier_provider_page/async_notifier_provider_page.dart';
import 'package:flutter_app/pages/riverpod_example_page/entities/todo.dart';
import 'package:flutter_app/pages/riverpod_example_page/util/dio_provider.dart';
import 'package:flutter_app/pages/riverpod_example_page/util/fake_dio.dart';
import 'package:flutter_app/pages/riverpod_example_page/util/util.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../util/provider/listener.dart';
import '../../../util/provider/provider_container.dart';
import 'async_notifier_provider_page_test.mocks.dart';

/// _State is Type of the Notifier state.
typedef _State = List<Todo>;

@GenerateNiceMocks([MockSpec<FakeDio>()])
void main() {
  group('AsyncTodoList', () {
    group('build', () {
      test('最初はローディング状態で、Futureの完了後にはデータが取得できること', () async {
        final sut = asyncTodoListProvider;
        final mockDio = MockFakeDio();

        const result = Todo(
          id: '6b114801-9d60-4c7f-88dc-7a89cf231856',
          title: 'Buy a coffee',
        );

        final container = createContainer(
          overrides: [dioProvider.overrideWithValue(mockDio)],
        );

        when(
          mockDio.get<List<Map<String, dynamic>>>(
            'https://example.com/api/todo',
          ),
        ).thenAnswer((_) async => Response(data: [result.toJson()]));

        final listener = Listener<AsyncValue<_State>>();

        container.listen(
          sut,
          listener.call,
          fireImmediately: true,
        );

        verify(
          listener(
            null,
            const AsyncLoading<_State>(),
          ),
        );

        final got = await container.read(sut.future);

        expect(got, equals([result]));
      });
    });
  });
}
