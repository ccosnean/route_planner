import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:route_planner/src/services/base_service.dart';

import '../domain/api_error.dart';
import '../domain/route.dart';

class RouteService extends BaseService {
  final url = 'https://scrmobiletest.azurewebsites.net/api/route';

  RouteService({Dio? client}) : super(client: client) {
    this.client.interceptors.add(
          DioCacheManager(
            CacheConfig(baseUrl: url, defaultMaxAge: const Duration(days: 3)),
          ).interceptor,
        );
  }

  Future<Route> getRoute(String origin, String destination) async {
    var response = await client.get('$url/$origin/$destination');

    if (response.statusCode == null || response.statusCode! >= 400) {
      throw ApiError(message: "The GET $url failed.");
    }

    return Route.fromJson(response.data);
  }
}
