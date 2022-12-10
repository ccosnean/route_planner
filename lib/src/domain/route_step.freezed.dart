// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route_step.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RouteStep _$RouteStepFromJson(Map<String, dynamic> json) {
  return _RouteStep.fromJson(json);
}

/// @nodoc
mixin _$RouteStep {
  String? get direction => throw _privateConstructorUsedError;
  Location get location => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteStepCopyWith<RouteStep> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteStepCopyWith<$Res> {
  factory $RouteStepCopyWith(RouteStep value, $Res Function(RouteStep) then) =
      _$RouteStepCopyWithImpl<$Res, RouteStep>;
  @useResult
  $Res call({String? direction, Location location});

  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class _$RouteStepCopyWithImpl<$Res, $Val extends RouteStep>
    implements $RouteStepCopyWith<$Res> {
  _$RouteStepCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = freezed,
    Object? location = null,
  }) {
    return _then(_value.copyWith(
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $LocationCopyWith<$Res> get location {
    return $LocationCopyWith<$Res>(_value.location, (value) {
      return _then(_value.copyWith(location: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_RouteStepCopyWith<$Res> implements $RouteStepCopyWith<$Res> {
  factory _$$_RouteStepCopyWith(
          _$_RouteStep value, $Res Function(_$_RouteStep) then) =
      __$$_RouteStepCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String? direction, Location location});

  @override
  $LocationCopyWith<$Res> get location;
}

/// @nodoc
class __$$_RouteStepCopyWithImpl<$Res>
    extends _$RouteStepCopyWithImpl<$Res, _$_RouteStep>
    implements _$$_RouteStepCopyWith<$Res> {
  __$$_RouteStepCopyWithImpl(
      _$_RouteStep _value, $Res Function(_$_RouteStep) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? direction = freezed,
    Object? location = null,
  }) {
    return _then(_$_RouteStep(
      direction: freezed == direction
          ? _value.direction
          : direction // ignore: cast_nullable_to_non_nullable
              as String?,
      location: null == location
          ? _value.location
          : location // ignore: cast_nullable_to_non_nullable
              as Location,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_RouteStep implements _RouteStep {
  const _$_RouteStep({this.direction, required this.location});

  factory _$_RouteStep.fromJson(Map<String, dynamic> json) =>
      _$$_RouteStepFromJson(json);

  @override
  final String? direction;
  @override
  final Location location;

  @override
  String toString() {
    return 'RouteStep(direction: $direction, location: $location)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RouteStep &&
            (identical(other.direction, direction) ||
                other.direction == direction) &&
            (identical(other.location, location) ||
                other.location == location));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, direction, location);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteStepCopyWith<_$_RouteStep> get copyWith =>
      __$$_RouteStepCopyWithImpl<_$_RouteStep>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteStepToJson(
      this,
    );
  }
}

abstract class _RouteStep implements RouteStep {
  const factory _RouteStep(
      {final String? direction,
      required final Location location}) = _$_RouteStep;

  factory _RouteStep.fromJson(Map<String, dynamic> json) =
      _$_RouteStep.fromJson;

  @override
  String? get direction;
  @override
  Location get location;
  @override
  @JsonKey(ignore: true)
  _$$_RouteStepCopyWith<_$_RouteStep> get copyWith =>
      throw _privateConstructorUsedError;
}
