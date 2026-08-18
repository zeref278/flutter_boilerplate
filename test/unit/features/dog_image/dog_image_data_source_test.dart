import 'package:boilerplate/features/dog_image/data/data_sources/dog_image_data_source.dart';
import 'package:boilerplate/features/dog_image/data/models/dog_image_model.dart';
import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:http_mock_adapter/http_mock_adapter.dart';

void main() {
  late Dio dio;
  late DioAdapter adapter;
  late DogImageDataSource dataSource;

  const String path = '/breeds/image/random';

  setUp(() {
    dio = Dio(BaseOptions(baseUrl: 'https://dog.ceo/api'));
    adapter = DioAdapter(dio: dio);
    dio.httpClientAdapter = adapter;
    dataSource = DogImageDataSourceRemote(dio);
  });

  test('parses a successful response', () async {
    adapter.onGet(
      path,
      (server) => server.reply(200, <String, dynamic>{
        'message': 'https://dog/a.jpg',
        'status': 'success',
      }),
    );

    final DogImageModel result = await dataSource.getRandom();

    expect(result.message, 'https://dog/a.jpg');
    expect(result.status, 'success');
  });

  test('throws DioException on a server error', () async {
    adapter.onGet(
      path,
      (server) => server.reply(500, <String, dynamic>{'status': 'error'}),
    );

    expect(() => dataSource.getRandom(), throwsA(isA<DioException>()));
  });
}
