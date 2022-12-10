import 'package:freezed_annotation/freezed_annotation.dart';
import 'location.dart';

part 'route_step.freezed.dart';

part 'route_step.g.dart';

@freezed
class RouteStep with _$RouteStep {
  const factory RouteStep({
    String? direction,
    required Location location,
  }) = _RouteStep;

  factory RouteStep.fromJson(Map<String, Object?> json) => _$RouteStepFromJson(json);
}
