// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'recordItem_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

RecordItemModel _$RecordItemModelFromJson(Map<String, dynamic> json) {
  return _RecordItemModel.fromJson(json);
}

/// @nodoc
mixin _$RecordItemModel {
  bool get hidden => throw _privateConstructorUsedError;
  String get orderNum => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  String get sets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $RecordItemModelCopyWith<RecordItemModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RecordItemModelCopyWith<$Res> {
  factory $RecordItemModelCopyWith(
          RecordItemModel value, $Res Function(RecordItemModel) then) =
      _$RecordItemModelCopyWithImpl<$Res, RecordItemModel>;
  @useResult
  $Res call(
      {bool hidden,
      String orderNum,
      String memo,
      String createdAt,
      String sets});
}

/// @nodoc
class _$RecordItemModelCopyWithImpl<$Res, $Val extends RecordItemModel>
    implements $RecordItemModelCopyWith<$Res> {
  _$RecordItemModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidden = null,
    Object? orderNum = null,
    Object? memo = null,
    Object? createdAt = null,
    Object? sets = null,
  }) {
    return _then(_value.copyWith(
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$RecordItemModelImplCopyWith<$Res>
    implements $RecordItemModelCopyWith<$Res> {
  factory _$$RecordItemModelImplCopyWith(_$RecordItemModelImpl value,
          $Res Function(_$RecordItemModelImpl) then) =
      __$$RecordItemModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool hidden,
      String orderNum,
      String memo,
      String createdAt,
      String sets});
}

/// @nodoc
class __$$RecordItemModelImplCopyWithImpl<$Res>
    extends _$RecordItemModelCopyWithImpl<$Res, _$RecordItemModelImpl>
    implements _$$RecordItemModelImplCopyWith<$Res> {
  __$$RecordItemModelImplCopyWithImpl(
      _$RecordItemModelImpl _value, $Res Function(_$RecordItemModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? hidden = null,
    Object? orderNum = null,
    Object? memo = null,
    Object? createdAt = null,
    Object? sets = null,
  }) {
    return _then(_$RecordItemModelImpl(
      hidden: null == hidden
          ? _value.hidden
          : hidden // ignore: cast_nullable_to_non_nullable
              as bool,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as String,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value.sets
          : sets // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$RecordItemModelImpl implements _RecordItemModel {
  _$RecordItemModelImpl(
      {required this.hidden,
      required this.orderNum,
      required this.memo,
      required this.createdAt,
      required this.sets});

  factory _$RecordItemModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$RecordItemModelImplFromJson(json);

  @override
  final bool hidden;
  @override
  final String orderNum;
  @override
  final String memo;
  @override
  final String createdAt;
  @override
  final String sets;

  @override
  String toString() {
    return 'RecordItemModel(hidden: $hidden, orderNum: $orderNum, memo: $memo, createdAt: $createdAt, sets: $sets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$RecordItemModelImpl &&
            (identical(other.hidden, hidden) || other.hidden == hidden) &&
            (identical(other.orderNum, orderNum) ||
                other.orderNum == orderNum) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.sets, sets) || other.sets == sets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, hidden, orderNum, memo, createdAt, sets);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$RecordItemModelImplCopyWith<_$RecordItemModelImpl> get copyWith =>
      __$$RecordItemModelImplCopyWithImpl<_$RecordItemModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$RecordItemModelImplToJson(
      this,
    );
  }
}

abstract class _RecordItemModel implements RecordItemModel {
  factory _RecordItemModel(
      {required final bool hidden,
      required final String orderNum,
      required final String memo,
      required final String createdAt,
      required final String sets}) = _$RecordItemModelImpl;

  factory _RecordItemModel.fromJson(Map<String, dynamic> json) =
      _$RecordItemModelImpl.fromJson;

  @override
  bool get hidden;
  @override
  String get orderNum;
  @override
  String get memo;
  @override
  String get createdAt;
  @override
  String get sets;
  @override
  @JsonKey(ignore: true)
  _$$RecordItemModelImplCopyWith<_$RecordItemModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
