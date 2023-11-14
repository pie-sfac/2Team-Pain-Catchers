// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'center_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

CenterModel _$CenterModelFromJson(Map<String, dynamic> json) {
  return _CenterModel.fromJson(json);
}

/// @nodoc
mixin _$CenterModel {
  int get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get code => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CenterModelCopyWith<CenterModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CenterModelCopyWith<$Res> {
  factory $CenterModelCopyWith(
          CenterModel value, $Res Function(CenterModel) then) =
      _$CenterModelCopyWithImpl<$Res, CenterModel>;
  @useResult
  $Res call({int id, String name, String code});
}

/// @nodoc
class _$CenterModelCopyWithImpl<$Res, $Val extends CenterModel>
    implements $CenterModelCopyWith<$Res> {
  _$CenterModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CenterModelImplCopyWith<$Res>
    implements $CenterModelCopyWith<$Res> {
  factory _$$CenterModelImplCopyWith(
          _$CenterModelImpl value, $Res Function(_$CenterModelImpl) then) =
      __$$CenterModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, String name, String code});
}

/// @nodoc
class __$$CenterModelImplCopyWithImpl<$Res>
    extends _$CenterModelCopyWithImpl<$Res, _$CenterModelImpl>
    implements _$$CenterModelImplCopyWith<$Res> {
  __$$CenterModelImplCopyWithImpl(
      _$CenterModelImpl _value, $Res Function(_$CenterModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? code = null,
  }) {
    return _then(_$CenterModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      code: null == code
          ? _value.code
          : code // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CenterModelImpl implements _CenterModel {
  _$CenterModelImpl({required this.id, required this.name, required this.code});

  factory _$CenterModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$CenterModelImplFromJson(json);

  @override
  final int id;
  @override
  final String name;
  @override
  final String code;

  @override
  String toString() {
    return 'CenterModel(id: $id, name: $name, code: $code)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CenterModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.code, code) || other.code == code));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, name, code);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CenterModelImplCopyWith<_$CenterModelImpl> get copyWith =>
      __$$CenterModelImplCopyWithImpl<_$CenterModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CenterModelImplToJson(
      this,
    );
  }
}

abstract class _CenterModel implements CenterModel {
  factory _CenterModel(
      {required final int id,
      required final String name,
      required final String code}) = _$CenterModelImpl;

  factory _CenterModel.fromJson(Map<String, dynamic> json) =
      _$CenterModelImpl.fromJson;

  @override
  int get id;
  @override
  String get name;
  @override
  String get code;
  @override
  @JsonKey(ignore: true)
  _$$CenterModelImplCopyWith<_$CenterModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
