import 'package:equatable/equatable.dart';
import 'package:route_planner/src/domain/location.dart';
import 'package:route_planner/src/domain/route.dart';
import 'package:route_planner/src/domain/weather.dart';

abstract class RouteState extends Equatable {
  @override
  List<Object?> get props => [];
}

class InitialRouteState extends RouteState {}

class Loading extends RouteState {}

class FetchedRoute extends RouteState {
  final String origin;
  final String destination;
  final Route route;

  FetchedRoute(
    this.origin,
    this.destination,
    this.route,
  );
}

abstract class WeatherForLocation extends RouteState {
  final Location location;

  WeatherForLocation(this.location);

  @override
  List<Object?> get props => [location];
}

class LoadingWeatherForLocation extends WeatherForLocation {
  LoadingWeatherForLocation(super.location);
}

class FetchedWeatherForLocation extends WeatherForLocation {
  @override
  final Location location;
  final Weather weather;

  FetchedWeatherForLocation(this.location, this.weather) : super(location);
}
