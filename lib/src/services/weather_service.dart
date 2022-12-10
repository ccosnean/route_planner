import 'package:dio/dio.dart';
import 'package:dio_http_cache_lts/dio_http_cache_lts.dart';
import 'package:route_planner/src/domain/location.dart';
import 'package:route_planner/src/domain/weather.dart';
import 'package:route_planner/src/services/base_service.dart';

import '../domain/api_error.dart';

class WeatherService extends BaseService {
  final url = 'https://scrmobiletest.azurewebsites.net/api/Weather';

  WeatherService({Dio? client}) : super(client: client) {
    this.client.interceptors.add(
          DioCacheManager(
            CacheConfig(baseUrl: url, defaultMaxAge: const Duration(hours: 6)),
          ).interceptor,
        );
  }

  Future<Weather> getWeather(Location location) async {
    var response = await client.get('$url/${location.lat}/${location.lng}');

    if (response.statusCode == null || response.statusCode! >= 400) {
      throw ApiError(message: "The GET $url failed.");
    }

    return Weather.fromJson(response.data);
  }
}
