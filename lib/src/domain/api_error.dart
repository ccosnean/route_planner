import 'package:freezed_annotation/freezed_annotation.dart';


part 'api_error.freezed.dart';

part 'api_error.g.dart';

@freezed
class ApiError with _$ApiError {
  const factory ApiError({
    String? message,
  }) = _ApiError;

  factory ApiError.fromJson(Map<String, Object?> json) =>
      _$ApiErrorFromJson(json);
}