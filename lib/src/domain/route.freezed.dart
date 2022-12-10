// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'route.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

Route _$RouteFromJson(Map<String, dynamic> json) {
  return _Route.fromJson(json);
}

/// @nodoc
mixin _$Route {
  int get duration => throw _privateConstructorUsedError;
  int get distance => throw _privateConstructorUsedError;
  List<RouteStep>? get steps => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RouteCopyWith<Route> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RouteCopyWith<$Res> {
  factory $RouteCopyWith(Route value, $Res Function(Route) then) =
      _$RouteCopyWithImpl<$Res, Route>;
  @useResult
  $Res call({int duration, int distance, List<RouteStep>? steps});
}

/// @nodoc
class _$RouteCopyWithImpl<$Res, $Val extends Route>
    implements $RouteCopyWith<$Res> {
  _$RouteCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? distance = null,
    Object? steps = freezed,
  }) {
    return _then(_value.copyWith(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      steps: freezed == steps
          ? _value.steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RouteStep>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RouteCopyWith<$Res> implements $RouteCopyWith<$Res> {
  factory _$$_RouteCopyWith(_$_Route value, $Res Function(_$_Route) then) =
      __$$_RouteCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int duration, int distance, List<RouteStep>? steps});
}

/// @nodoc
class __$$_RouteCopyWithImpl<$Res> extends _$RouteCopyWithImpl<$Res, _$_Route>
    implements _$$_RouteCopyWith<$Res> {
  __$$_RouteCopyWithImpl(_$_Route _value, $Res Function(_$_Route) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? duration = null,
    Object? distance = null,
    Object? steps = freezed,
  }) {
    return _then(_$_Route(
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as int,
      distance: null == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int,
      steps: freezed == steps
          ? _value._steps
          : steps // ignore: cast_nullable_to_non_nullable
              as List<RouteStep>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_Route implements _Route {
  const _$_Route(
      {required this.duration,
      required this.distance,
      final List<RouteStep>? steps})
      : _steps = steps;

  factory _$_Route.fromJson(Map<String, dynamic> json) =>
      _$$_RouteFromJson(json);

  @override
  final int duration;
  @override
  final int distance;
  final List<RouteStep>? _steps;
  @override
  List<RouteStep>? get steps {
    final value = _steps;
    if (value == null) return null;
    if (_steps is EqualUnmodifiableListView) return _steps;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  String toString() {
    return 'Route(duration: $duration, distance: $distance, steps: $steps)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_Route &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.distance, distance) ||
                other.distance == distance) &&
            const DeepCollectionEquality().equals(other._steps, _steps));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, duration, distance,
      const DeepCollectionEquality().hash(_steps));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RouteCopyWith<_$_Route> get copyWith =>
      __$$_RouteCopyWithImpl<_$_Route>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_RouteToJson(
      this,
    );
  }
}

abstract class _Route implements Route {
  const factory _Route(
      {required final int duration,
      required final int distance,
      final List<RouteStep>? steps}) = _$_Route;

  factory _Route.fromJson(Map<String, dynamic> json) = _$_Route.fromJson;

  @override
  int get duration;
  @override
  int get distance;
  @override
  List<RouteStep>? get steps;
  @override
  @JsonKey(ignore: true)
  _$$_RouteCopyWith<_$_Route> get copyWith =>
      throw _privateConstructorUsedError;
}
