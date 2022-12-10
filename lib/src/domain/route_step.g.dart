// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route_step.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RouteStep _$$_RouteStepFromJson(Map<String, dynamic> json) => _$_RouteStep(
      direction: json['direction'] as String?,
      location: Location.fromJson(json['location'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$_RouteStepToJson(_$_RouteStep instance) =>
    <String, dynamic>{
      'direction': instance.direction,
      'location': instance.location,
    };
