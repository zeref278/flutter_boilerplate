import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rest_client/rest_client.dart';

void main() {
  Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dd47327b-1823-4d83-b642-c64124bc5bd0.mock.pstmn.io/dev',
    ),
  );

  final FlavorApiClient flavorApiClient = FlavorApiClient(dio);

  test('test', () async {
    final flavor = await flavorApiClient.getFlavor();

    expect(flavor.flavor, 'dev');
  });
}
