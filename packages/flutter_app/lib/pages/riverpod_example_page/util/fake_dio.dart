final dio = FakeDio();

class Response<T> {
  const Response({required this.data});
  final T data;
}

class FakeDio {
  FakeDio();

  List<Map<String, Object?>> _todos = [
    for (final i in [1, 2, 3])
      {
        'id': 'T_00$i',
        'title': 'T 00$i',
        'completed': false,
      },
  ];

  Future<Response<List<Map<String, Object?>>>> get<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 400));
    return Response(
      data: _todos,
    );
  }

  Future<Response<List<Map<String, Object?>>>> post<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    final newTodos = [
      ..._todos,
      data as Map<String, dynamic>,
    ];
    _todos = newTodos;
    return Response(
      data: newTodos,
    );
  }

  Future<Response<List<Map<String, Object?>>>> delete<T>(
    String path, {
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    final todoId = path.split('/').last;
    _todos = [
      for (final todo in _todos)
        if (todo['id'] != todoId) todo,
    ];
    return Response(
      data: _todos,
    );
  }

  Future<Response<List<Map<String, Object?>>>> patch<T>(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    void Function(int, int)? onReceiveProgress,
  }) async {
    await Future<void>.delayed(const Duration(milliseconds: 100));
    final todoId = path.split('/').last;
    final body = data as Map<String, Object?>?;
    _todos = [
      for (final todo in _todos)
        if (todo['id'] == todoId) {...todo, ...?body} else todo,
    ];
    return Response(
      data: _todos,
    );
  }
}
