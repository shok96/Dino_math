// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'MTaskResult.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MTaskResult<T> _$$_MTaskResultFromJson<T>(
  Map<String, dynamic> json,
  T Function(Object? json) fromJsonT,
) =>
    _$_MTaskResult<T>(
      isSuccessfull: json['isSuccessfull'] as bool,
      data: json['data'] as String?,
      error: json['error'] as String?,
      json_data: json['json_data'] as Map<String, dynamic>?,
      modeSourceData: json['modeSourceData'] == null
          ? null
          : ModeSourceData.fromJson(
              json['modeSourceData'] as Map<String, dynamic>),
      body: _$nullableGenericFromJson(json['body'], fromJsonT),
    );

Map<String, dynamic> _$$_MTaskResultToJson<T>(
  _$_MTaskResult<T> instance,
  Object? Function(T value) toJsonT,
) =>
    <String, dynamic>{
      'isSuccessfull': instance.isSuccessfull,
      'data': instance.data,
      'error': instance.error,
      'json_data': instance.json_data,
      'modeSourceData': instance.modeSourceData,
      'body': _$nullableGenericToJson(instance.body, toJsonT),
    };

T? _$nullableGenericFromJson<T>(
  Object? input,
  T Function(Object? json) fromJson,
) =>
    input == null ? null : fromJson(input);

Object? _$nullableGenericToJson<T>(
  T? input,
  Object? Function(T value) toJson,
) =>
    input == null ? null : toJson(input);

_$_Network _$$_NetworkFromJson(Map<String, dynamic> json) => _$_Network(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_NetworkToJson(_$_Network instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_Cache _$$_CacheFromJson(Map<String, dynamic> json) => _$_Cache(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_CacheToJson(_$_Cache instance) => <String, dynamic>{
      'runtimeType': instance.$type,
    };

_$_FireStore _$$_FireStoreFromJson(Map<String, dynamic> json) => _$_FireStore(
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_FireStoreToJson(_$_FireStore instance) =>
    <String, dynamic>{
      'runtimeType': instance.$type,
    };
