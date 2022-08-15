// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'MTaskResult.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MTaskResult<T> _$MTaskResultFromJson<T>(
    Map<String, dynamic> json, T Function(Object?) fromJsonT) {
  return _MTaskResult<T>.fromJson(json, fromJsonT);
}

/// @nodoc
mixin _$MTaskResult<T> {
  bool get isSuccessfull => throw _privateConstructorUsedError;
  String? get data => throw _privateConstructorUsedError;
  String? get error => throw _privateConstructorUsedError;
  Map<String, dynamic>? get json_data => throw _privateConstructorUsedError;
  ModeSourceData? get modeSourceData => throw _privateConstructorUsedError;
  T? get body => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson(Object? Function(T) toJsonT) =>
      throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MTaskResultCopyWith<T, MTaskResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MTaskResultCopyWith<T, $Res> {
  factory $MTaskResultCopyWith(
          MTaskResult<T> value, $Res Function(MTaskResult<T>) then) =
      _$MTaskResultCopyWithImpl<T, $Res>;
  $Res call(
      {bool isSuccessfull,
      String? data,
      String? error,
      Map<String, dynamic>? json_data,
      ModeSourceData? modeSourceData,
      T? body});

  $ModeSourceDataCopyWith<$Res>? get modeSourceData;
}

/// @nodoc
class _$MTaskResultCopyWithImpl<T, $Res>
    implements $MTaskResultCopyWith<T, $Res> {
  _$MTaskResultCopyWithImpl(this._value, this._then);

  final MTaskResult<T> _value;
  // ignore: unused_field
  final $Res Function(MTaskResult<T>) _then;

  @override
  $Res call({
    Object? isSuccessfull = freezed,
    Object? data = freezed,
    Object? error = freezed,
    Object? json_data = freezed,
    Object? modeSourceData = freezed,
    Object? body = freezed,
  }) {
    return _then(_value.copyWith(
      isSuccessfull: isSuccessfull == freezed
          ? _value.isSuccessfull
          : isSuccessfull // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      json_data: json_data == freezed
          ? _value.json_data
          : json_data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      modeSourceData: modeSourceData == freezed
          ? _value.modeSourceData
          : modeSourceData // ignore: cast_nullable_to_non_nullable
              as ModeSourceData?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }

  @override
  $ModeSourceDataCopyWith<$Res>? get modeSourceData {
    if (_value.modeSourceData == null) {
      return null;
    }

    return $ModeSourceDataCopyWith<$Res>(_value.modeSourceData!, (value) {
      return _then(_value.copyWith(modeSourceData: value));
    });
  }
}

/// @nodoc
abstract class _$$_MTaskResultCopyWith<T, $Res>
    implements $MTaskResultCopyWith<T, $Res> {
  factory _$$_MTaskResultCopyWith(
          _$_MTaskResult<T> value, $Res Function(_$_MTaskResult<T>) then) =
      __$$_MTaskResultCopyWithImpl<T, $Res>;
  @override
  $Res call(
      {bool isSuccessfull,
      String? data,
      String? error,
      Map<String, dynamic>? json_data,
      ModeSourceData? modeSourceData,
      T? body});

  @override
  $ModeSourceDataCopyWith<$Res>? get modeSourceData;
}

/// @nodoc
class __$$_MTaskResultCopyWithImpl<T, $Res>
    extends _$MTaskResultCopyWithImpl<T, $Res>
    implements _$$_MTaskResultCopyWith<T, $Res> {
  __$$_MTaskResultCopyWithImpl(
      _$_MTaskResult<T> _value, $Res Function(_$_MTaskResult<T>) _then)
      : super(_value, (v) => _then(v as _$_MTaskResult<T>));

  @override
  _$_MTaskResult<T> get _value => super._value as _$_MTaskResult<T>;

  @override
  $Res call({
    Object? isSuccessfull = freezed,
    Object? data = freezed,
    Object? error = freezed,
    Object? json_data = freezed,
    Object? modeSourceData = freezed,
    Object? body = freezed,
  }) {
    return _then(_$_MTaskResult<T>(
      isSuccessfull: isSuccessfull == freezed
          ? _value.isSuccessfull
          : isSuccessfull // ignore: cast_nullable_to_non_nullable
              as bool,
      data: data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as String?,
      error: error == freezed
          ? _value.error
          : error // ignore: cast_nullable_to_non_nullable
              as String?,
      json_data: json_data == freezed
          ? _value._json_data
          : json_data // ignore: cast_nullable_to_non_nullable
              as Map<String, dynamic>?,
      modeSourceData: modeSourceData == freezed
          ? _value.modeSourceData
          : modeSourceData // ignore: cast_nullable_to_non_nullable
              as ModeSourceData?,
      body: body == freezed
          ? _value.body
          : body // ignore: cast_nullable_to_non_nullable
              as T?,
    ));
  }
}

/// @nodoc
@JsonSerializable(genericArgumentFactories: true)
class _$_MTaskResult<T> extends _MTaskResult<T> {
  _$_MTaskResult(
      {required this.isSuccessfull,
      this.data,
      this.error,
      final Map<String, dynamic>? json_data,
      this.modeSourceData,
      this.body})
      : _json_data = json_data,
        super._();

  factory _$_MTaskResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =>
      _$$_MTaskResultFromJson(json, fromJsonT);

  @override
  final bool isSuccessfull;
  @override
  final String? data;
  @override
  final String? error;
  final Map<String, dynamic>? _json_data;
  @override
  Map<String, dynamic>? get json_data {
    final value = _json_data;
    if (value == null) return null;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableMapView(value);
  }

  @override
  final ModeSourceData? modeSourceData;
  @override
  final T? body;

  @override
  String toString() {
    return 'MTaskResult<$T>(isSuccessfull: $isSuccessfull, data: $data, error: $error, json_data: $json_data, modeSourceData: $modeSourceData, body: $body)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MTaskResult<T> &&
            const DeepCollectionEquality()
                .equals(other.isSuccessfull, isSuccessfull) &&
            const DeepCollectionEquality().equals(other.data, data) &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality()
                .equals(other._json_data, _json_data) &&
            const DeepCollectionEquality()
                .equals(other.modeSourceData, modeSourceData) &&
            const DeepCollectionEquality().equals(other.body, body));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(isSuccessfull),
      const DeepCollectionEquality().hash(data),
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(_json_data),
      const DeepCollectionEquality().hash(modeSourceData),
      const DeepCollectionEquality().hash(body));

  @JsonKey(ignore: true)
  @override
  _$$_MTaskResultCopyWith<T, _$_MTaskResult<T>> get copyWith =>
      __$$_MTaskResultCopyWithImpl<T, _$_MTaskResult<T>>(this, _$identity);

  @override
  Map<String, dynamic> toJson(Object? Function(T) toJsonT) {
    return _$$_MTaskResultToJson<T>(this, toJsonT);
  }
}

abstract class _MTaskResult<T> extends MTaskResult<T> {
  factory _MTaskResult(
      {required final bool isSuccessfull,
      final String? data,
      final String? error,
      final Map<String, dynamic>? json_data,
      final ModeSourceData? modeSourceData,
      final T? body}) = _$_MTaskResult<T>;
  _MTaskResult._() : super._();

  factory _MTaskResult.fromJson(
          Map<String, dynamic> json, T Function(Object?) fromJsonT) =
      _$_MTaskResult<T>.fromJson;

  @override
  bool get isSuccessfull;
  @override
  String? get data;
  @override
  String? get error;
  @override
  Map<String, dynamic>? get json_data;
  @override
  ModeSourceData? get modeSourceData;
  @override
  T? get body;
  @override
  @JsonKey(ignore: true)
  _$$_MTaskResultCopyWith<T, _$_MTaskResult<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

ModeSourceData _$ModeSourceDataFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'network':
      return _Network.fromJson(json);
    case 'cache':
      return _Cache.fromJson(json);
    case 'firestore':
      return _FireStore.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'ModeSourceData',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$ModeSourceData {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() cache,
    required TResult Function() firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Cache value) cache,
    required TResult Function(_FireStore value) firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ModeSourceDataCopyWith<$Res> {
  factory $ModeSourceDataCopyWith(
          ModeSourceData value, $Res Function(ModeSourceData) then) =
      _$ModeSourceDataCopyWithImpl<$Res>;
}

/// @nodoc
class _$ModeSourceDataCopyWithImpl<$Res>
    implements $ModeSourceDataCopyWith<$Res> {
  _$ModeSourceDataCopyWithImpl(this._value, this._then);

  final ModeSourceData _value;
  // ignore: unused_field
  final $Res Function(ModeSourceData) _then;
}

/// @nodoc
abstract class _$$_NetworkCopyWith<$Res> {
  factory _$$_NetworkCopyWith(
          _$_Network value, $Res Function(_$_Network) then) =
      __$$_NetworkCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_NetworkCopyWithImpl<$Res> extends _$ModeSourceDataCopyWithImpl<$Res>
    implements _$$_NetworkCopyWith<$Res> {
  __$$_NetworkCopyWithImpl(_$_Network _value, $Res Function(_$_Network) _then)
      : super(_value, (v) => _then(v as _$_Network));

  @override
  _$_Network get _value => super._value as _$_Network;
}

/// @nodoc
@JsonSerializable()
class _$_Network implements _Network {
  const _$_Network({final String? $type}) : $type = $type ?? 'network';

  factory _$_Network.fromJson(Map<String, dynamic> json) =>
      _$$_NetworkFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ModeSourceData.network()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Network);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() cache,
    required TResult Function() firestore,
  }) {
    return network();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
  }) {
    return network?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Cache value) cache,
    required TResult Function(_FireStore value) firestore,
  }) {
    return network(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
  }) {
    return network?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
    required TResult orElse(),
  }) {
    if (network != null) {
      return network(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_NetworkToJson(
      this,
    );
  }
}

abstract class _Network implements ModeSourceData {
  const factory _Network() = _$_Network;

  factory _Network.fromJson(Map<String, dynamic> json) = _$_Network.fromJson;
}

/// @nodoc
abstract class _$$_CacheCopyWith<$Res> {
  factory _$$_CacheCopyWith(_$_Cache value, $Res Function(_$_Cache) then) =
      __$$_CacheCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_CacheCopyWithImpl<$Res> extends _$ModeSourceDataCopyWithImpl<$Res>
    implements _$$_CacheCopyWith<$Res> {
  __$$_CacheCopyWithImpl(_$_Cache _value, $Res Function(_$_Cache) _then)
      : super(_value, (v) => _then(v as _$_Cache));

  @override
  _$_Cache get _value => super._value as _$_Cache;
}

/// @nodoc
@JsonSerializable()
class _$_Cache implements _Cache {
  const _$_Cache({final String? $type}) : $type = $type ?? 'cache';

  factory _$_Cache.fromJson(Map<String, dynamic> json) =>
      _$$_CacheFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ModeSourceData.cache()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_Cache);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() cache,
    required TResult Function() firestore,
  }) {
    return cache();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
  }) {
    return cache?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Cache value) cache,
    required TResult Function(_FireStore value) firestore,
  }) {
    return cache(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
  }) {
    return cache?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
    required TResult orElse(),
  }) {
    if (cache != null) {
      return cache(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_CacheToJson(
      this,
    );
  }
}

abstract class _Cache implements ModeSourceData {
  const factory _Cache() = _$_Cache;

  factory _Cache.fromJson(Map<String, dynamic> json) = _$_Cache.fromJson;
}

/// @nodoc
abstract class _$$_FireStoreCopyWith<$Res> {
  factory _$$_FireStoreCopyWith(
          _$_FireStore value, $Res Function(_$_FireStore) then) =
      __$$_FireStoreCopyWithImpl<$Res>;
}

/// @nodoc
class __$$_FireStoreCopyWithImpl<$Res>
    extends _$ModeSourceDataCopyWithImpl<$Res>
    implements _$$_FireStoreCopyWith<$Res> {
  __$$_FireStoreCopyWithImpl(
      _$_FireStore _value, $Res Function(_$_FireStore) _then)
      : super(_value, (v) => _then(v as _$_FireStore));

  @override
  _$_FireStore get _value => super._value as _$_FireStore;
}

/// @nodoc
@JsonSerializable()
class _$_FireStore implements _FireStore {
  const _$_FireStore({final String? $type}) : $type = $type ?? 'firestore';

  factory _$_FireStore.fromJson(Map<String, dynamic> json) =>
      _$$_FireStoreFromJson(json);

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'ModeSourceData.firestore()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$_FireStore);
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() network,
    required TResult Function() cache,
    required TResult Function() firestore,
  }) {
    return firestore();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
  }) {
    return firestore?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? network,
    TResult Function()? cache,
    TResult Function()? firestore,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Network value) network,
    required TResult Function(_Cache value) cache,
    required TResult Function(_FireStore value) firestore,
  }) {
    return firestore(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
  }) {
    return firestore?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Network value)? network,
    TResult Function(_Cache value)? cache,
    TResult Function(_FireStore value)? firestore,
    required TResult orElse(),
  }) {
    if (firestore != null) {
      return firestore(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$_FireStoreToJson(
      this,
    );
  }
}

abstract class _FireStore implements ModeSourceData {
  const factory _FireStore() = _$_FireStore;

  factory _FireStore.fromJson(Map<String, dynamic> json) =
      _$_FireStore.fromJson;
}
