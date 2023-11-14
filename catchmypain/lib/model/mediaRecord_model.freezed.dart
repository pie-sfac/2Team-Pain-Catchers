// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'mediaRecord_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MediaRecordModel _$MediaRecordModelFromJson(Map<String, dynamic> json) {
  return _MediaRecordModel.fromJson(json);
}

/// @nodoc
mixin _$MediaRecordModel {
  String get uuid => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  String get url => throw _privateConstructorUsedError;
  String get thumbnailUrl => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaRecordModelCopyWith<MediaRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaRecordModelCopyWith<$Res> {
  factory $MediaRecordModelCopyWith(
          MediaRecordModel value, $Res Function(MediaRecordModel) then) =
      _$MediaRecordModelCopyWithImpl<$Res, MediaRecordModel>;
  @useResult
  $Res call({String uuid, String type, String url, String thumbnailUrl});
}

/// @nodoc
class _$MediaRecordModelCopyWithImpl<$Res, $Val extends MediaRecordModel>
    implements $MediaRecordModelCopyWith<$Res> {
  _$MediaRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_value.copyWith(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$MediaRecordModelImplCopyWith<$Res>
    implements $MediaRecordModelCopyWith<$Res> {
  factory _$$MediaRecordModelImplCopyWith(_$MediaRecordModelImpl value,
          $Res Function(_$MediaRecordModelImpl) then) =
      __$$MediaRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String uuid, String type, String url, String thumbnailUrl});
}

/// @nodoc
class __$$MediaRecordModelImplCopyWithImpl<$Res>
    extends _$MediaRecordModelCopyWithImpl<$Res, _$MediaRecordModelImpl>
    implements _$$MediaRecordModelImplCopyWith<$Res> {
  __$$MediaRecordModelImplCopyWithImpl(_$MediaRecordModelImpl _value,
      $Res Function(_$MediaRecordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? uuid = null,
    Object? type = null,
    Object? url = null,
    Object? thumbnailUrl = null,
  }) {
    return _then(_$MediaRecordModelImpl(
      uuid: null == uuid
          ? _value.uuid
          : uuid // ignore: cast_nullable_to_non_nullable
              as String,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      url: null == url
          ? _value.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnailUrl: null == thumbnailUrl
          ? _value.thumbnailUrl
          : thumbnailUrl // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaRecordModelImpl implements _MediaRecordModel {
  _$MediaRecordModelImpl(
      {required this.uuid,
      required this.type,
      required this.url,
      required this.thumbnailUrl});

  factory _$MediaRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaRecordModelImplFromJson(json);

  @override
  final String uuid;
  @override
  final String type;
  @override
  final String url;
  @override
  final String thumbnailUrl;

  @override
  String toString() {
    return 'MediaRecordModel(uuid: $uuid, type: $type, url: $url, thumbnailUrl: $thumbnailUrl)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaRecordModelImpl &&
            (identical(other.uuid, uuid) || other.uuid == uuid) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.url, url) || other.url == url) &&
            (identical(other.thumbnailUrl, thumbnailUrl) ||
                other.thumbnailUrl == thumbnailUrl));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, uuid, type, url, thumbnailUrl);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaRecordModelImplCopyWith<_$MediaRecordModelImpl> get copyWith =>
      __$$MediaRecordModelImplCopyWithImpl<_$MediaRecordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaRecordModelImplToJson(
      this,
    );
  }
}

abstract class _MediaRecordModel implements MediaRecordModel {
  factory _MediaRecordModel(
      {required final String uuid,
      required final String type,
      required final String url,
      required final String thumbnailUrl}) = _$MediaRecordModelImpl;

  factory _MediaRecordModel.fromJson(Map<String, dynamic> json) =
      _$MediaRecordModelImpl.fromJson;

  @override
  String get uuid;
  @override
  String get type;
  @override
  String get url;
  @override
  String get thumbnailUrl;
  @override
  @JsonKey(ignore: true)
  _$$MediaRecordModelImplCopyWith<_$MediaRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
