import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:rest_client/rest_client.dart';

void main() {
  final Dio dio = Dio(
    BaseOptions(
      baseUrl: 'https://dog.ceo/api',
    ),
  );

  final DogApiClient dogApiClient = DogApiClient(dio);

  test('test', () async {
    final dogImage = await dogApiClient.getDogImageRandom();

    expect(dogImage.message, isNotEmpty);
  });
}
