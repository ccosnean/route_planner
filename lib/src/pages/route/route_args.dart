import 'package:equatable/equatable.dart';

class RouteArgs extends Equatable {
  final String origin;
  final String destination;

  const RouteArgs(this.origin, this.destination);

  @override
  List<Object?> get props => [origin, destination];
}
