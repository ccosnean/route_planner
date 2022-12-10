import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:route_planner/src/common/app_router.dart';
import 'package:route_planner/src/domain/api_error.dart';
import 'package:route_planner/src/pages/route/route_args.dart';
import 'package:route_planner/src/services/route_service.dart';
import 'package:route_planner/src/services/weather_service.dart';

import 'route_event.dart';
import 'route_state.dart';

class RouteBloc extends Bloc<RouteEvent, RouteState> {
  final Sink<AppRouterEvent> routerSink;
  final RouteArgs arguments;

  final routeService = RouteService();
  final weatherService = WeatherService();

  RouteBloc(this.routerSink, this.arguments) : super(InitialRouteState()) {
    on<PagePushed>(onPagePushed);
    on<LocationShown>(onLocationShown);
  }

  void onPagePushed(PagePushed event, Emitter<RouteState> emitter) async {
    emitter.call(Loading());

    try {
      final route = await routeService.getRoute(
        arguments.origin,
        arguments.destination,
      );

      emitter.call(
        FetchedRoute(
          arguments.origin,
          arguments.destination,
          route,
        ),
      );
    } on ApiError catch (error) {
      routerSink.add(ShowApiError(apiError: error));
    }
  }

  void onLocationShown(LocationShown event, Emitter<RouteState> emitter) async {
    emitter.call(LoadingWeatherForLocation(event.location));

    try {
      final weather = await weatherService.getWeather(event.location);

      emitter.call(
        FetchedWeatherForLocation(
          event.location,
          weather,
        ),
      );
    } on ApiError catch (error) {
      routerSink.add(ShowApiError(apiError: error));
    }
  }
}
