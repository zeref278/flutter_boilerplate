import 'package:rest_client/rest_client.dart';

import 'flavor_repository.dart';

class FlavorRepositoryImpl implements FlavorRepository {
  FlavorRepositoryImpl({
    required FlavorApiClient flavorApiClient,
  }) : _flavorApiClient = flavorApiClient;

  final FlavorApiClient _flavorApiClient;

  @override
  Future<String> getFlavor() async {
    final FlavorModel response = await _flavorApiClient.getFlavor();
    return response.flavor;
  }
}
