import 'package:route_planner/src/domain/location.dart';

abstract class RouteEvent {}

class PagePushed extends RouteEvent {}

class LocationShown extends RouteEvent {

  final Location location;

  LocationShown(this.location);
}