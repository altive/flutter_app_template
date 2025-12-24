import 'dart:convert';

import 'package:mock_web_server/mock_web_server.dart';
import 'package:pub_dev_api_client/pub_dev_api_client.dart';
import 'package:pub_dev_api_client/src/models/package_pubspec.dart';
import 'package:test/test.dart';

void main() {
  PubDevApiClient createClient({required String baseUrl}) {
    final client = PubDevApiClient(
      baseUrl: baseUrl,
      timeoutDuration: const Duration(milliseconds: 30000),
    );
    return client;
  }

  Future<MockWebServer> createMockWebServer(
    Map<String, Object?>? response,
  ) async {
    final server = MockWebServer();
    addTearDown(server.shutdown);
    await server.start();
    server.enqueue(
      body: jsonEncode(response),
      headers: {'content-type': 'application/json'},
    );
    return server;
  }

  group('fromParameters', () {
    test('Ensure that RestApiClient can be instantiated '
        'using the fromParameters constructor', () {
      final client = PubDevApiClient(
        baseUrl: 'https://example.com/api-base-url',
        timeoutDuration: const Duration(seconds: 30),
      );

      expect(client, isA<PubDevApiClient>());
    });
  });

  group('getSearchedPackages', () {
    const mockResponse = GetSearchedPackagesResponseBody(
      packages: [
        PackageName(name: 'package1'),
        PackageName(name: 'package2'),
      ],
    );

    test('Verify that the request is sent to the correct endpoint'
        ' when the method is called', () async {
      final mockServer = await createMockWebServer(mockResponse.toJson());

      final client = createClient(baseUrl: mockServer.url);

      await client.getSearchedPackages();

      final request = mockServer.takeRequest();

      expect(request.uri.path, '/search');
    });

    test('Verify that the correct query parameters are included in the request'
        ' when it is sent', () async {
      final mockServer = await createMockWebServer(mockResponse.toJson());

      final client = createClient(baseUrl: mockServer.url);

      await client.getSearchedPackages(searchWord: 'word', page: 2);

      final request = mockServer.takeRequest();

      expect(request.uri.queryParameters['q'], 'word');
      expect(request.uri.queryParameters['sort'], 'top');
      expect(request.uri.queryParameters['page'], '2');
    });

    test('Verify that the parsed response object is correctly returned'
        ' when the request is sent', () async {
      final mockServer = await createMockWebServer(mockResponse.toJson());
      final client = createClient(baseUrl: mockServer.url);
      final response = await client.getSearchedPackages();

      expect(response, mockResponse);
    });
  });

  group('getPackageDetails', () {
    const mockResponse = GetPackageDetailsResponseBody(
      name: 'package1',
      latest: LatestPackageRelease(
        pubspec: PackagePubspec(
          name: 'package1',
          version: '1.0.0',
          description: 'description description description',
        ),
      ),
    );

    test('Verify that the request is sent to the correct endpoint'
        ' when the method is called', () async {
      final mockServer = await createMockWebServer(mockResponse.toJson());

      final client = createClient(baseUrl: mockServer.url);

      await client.getPackageDetails(packageName: 'package1');

      final request = mockServer.takeRequest();

      expect(request.uri.path, '/packages/package1');
    });

    test('Verify that the parsed response object is correctly returned'
        ' when the request is sent', () async {
      final mockServer = await createMockWebServer(mockResponse.toJson());
      final client = createClient(baseUrl: mockServer.url);
      final response = await client.getPackageDetails(packageName: 'package1');

      expect(response, mockResponse);
    });
  });
}
