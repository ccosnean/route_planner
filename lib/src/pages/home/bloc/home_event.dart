import 'package:equatable/equatable.dart';

abstract class HomeEvent extends Equatable {}

class FormSubmitted extends HomeEvent {
  final String origin;
  final String destination;

  FormSubmitted(this.origin, this.destination);

  @override
  List<Object?> get props => [origin, destination];
}
