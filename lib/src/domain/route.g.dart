// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'route.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Route _$$_RouteFromJson(Map<String, dynamic> json) => _$_Route(
      duration: json['duration'] as int,
      distance: json['distance'] as int,
      steps: (json['steps'] as List<dynamic>?)
          ?.map((e) => RouteStep.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$_RouteToJson(_$_Route instance) => <String, dynamic>{
      'duration': instance.duration,
      'distance': instance.distance,
      'steps': instance.steps,
    };
