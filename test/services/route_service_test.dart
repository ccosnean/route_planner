import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';
import 'package:route_planner/src/domain/api_error.dart';
import 'package:route_planner/src/domain/route.dart';
import 'package:route_planner/src/services/route_service.dart';

import 'route_service_test.mocks.dart';

@GenerateMocks([Dio])
void main() {
  const baseUrl = 'https://scrmobiletest.azurewebsites.net/api/route';
  late MockDio client;

  setUp(() {
    client = MockDio();
    when(client.interceptors).thenAnswer((_) => Interceptors());
  });

  group('RouteService', () {
    const origin = 'warsaw';
    const destination = 'barcelona';
    const url = "$baseUrl/$origin/$destination";

    test("getRoute between cities", () async {
      const expectedRouteResponse = {
        "duration": 82428,
        "distance": 2351591,
        "steps": [
          {
            "direction": null,
            "location": {"lat": 52.2291168, "lng": 21.015462}
          },
          {
            "direction": "turn-left",
            "location": {"lat": 52.228491299999988, "lng": 21.0156824}
          },
          {
            "direction": "turn-left",
            "location": {"lat": 52.2288285, "lng": 21.0173736}
          },
          {
            "direction": "turn-left",
            "location": {"lat": 52.2307453, "lng": 21.0163943}
          },
          {
            "direction": "roundabout-right",
            "location": {"lat": 52.2301315, "lng": 21.0119668}
          },
        ]
      };

      when(client.get(url)).thenAnswer(
        (_) => Future.value(
          Response(
            data: expectedRouteResponse,
            statusCode: 200,
            requestOptions: RequestOptions(path: ''),
          ),
        ),
      );

      final subject = RouteService(client: client);

      final response = await subject.getRoute(origin, destination);

      expect(response, Route.fromJson(expectedRouteResponse));
    });

    test("failing to getRoute between cities", () async {
      when(client.get(url)).thenAnswer(
        (_) => Future.value(
          Response(
            statusCode: 500,
            requestOptions: RequestOptions(path: ''),
          ),
        ),
      );

      final subject = RouteService(client: client);

      expect(
        () => subject.getRoute(origin, destination),
        throwsA(isA<ApiError>()),
      );
    });
  });
}
