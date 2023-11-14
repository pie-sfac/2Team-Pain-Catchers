// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'exerciseRecord_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

ExerciseRecordModel _$ExerciseRecordModelFromJson(Map<String, dynamic> json) {
  return _ExerciseRecordModel.fromJson(json);
}

/// @nodoc
mixin _$ExerciseRecordModel {
  String get exerciseName => throw _privateConstructorUsedError;
  double get orderNum => throw _privateConstructorUsedError;
  String get memo => throw _privateConstructorUsedError;
  String get createdAt => throw _privateConstructorUsedError;
  List<SetModel> get sets => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $ExerciseRecordModelCopyWith<ExerciseRecordModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ExerciseRecordModelCopyWith<$Res> {
  factory $ExerciseRecordModelCopyWith(
          ExerciseRecordModel value, $Res Function(ExerciseRecordModel) then) =
      _$ExerciseRecordModelCopyWithImpl<$Res, ExerciseRecordModel>;
  @useResult
  $Res call(
      {String exerciseName,
      double orderNum,
      String memo,
      String createdAt,
      List<SetModel> sets});
}

/// @nodoc
class _$ExerciseRecordModelCopyWithImpl<$Res, $Val extends ExerciseRecordModel>
    implements $ExerciseRecordModelCopyWith<$Res> {
  _$ExerciseRecordModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseName = null,
    Object? orderNum = null,
    Object? memo = null,
    Object? createdAt = null,
    Object? sets = null,
  }) {
    return _then(_value.copyWith(
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as double,
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
              as List<SetModel>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$ExerciseRecordModelImplCopyWith<$Res>
    implements $ExerciseRecordModelCopyWith<$Res> {
  factory _$$ExerciseRecordModelImplCopyWith(_$ExerciseRecordModelImpl value,
          $Res Function(_$ExerciseRecordModelImpl) then) =
      __$$ExerciseRecordModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String exerciseName,
      double orderNum,
      String memo,
      String createdAt,
      List<SetModel> sets});
}

/// @nodoc
class __$$ExerciseRecordModelImplCopyWithImpl<$Res>
    extends _$ExerciseRecordModelCopyWithImpl<$Res, _$ExerciseRecordModelImpl>
    implements _$$ExerciseRecordModelImplCopyWith<$Res> {
  __$$ExerciseRecordModelImplCopyWithImpl(_$ExerciseRecordModelImpl _value,
      $Res Function(_$ExerciseRecordModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? exerciseName = null,
    Object? orderNum = null,
    Object? memo = null,
    Object? createdAt = null,
    Object? sets = null,
  }) {
    return _then(_$ExerciseRecordModelImpl(
      exerciseName: null == exerciseName
          ? _value.exerciseName
          : exerciseName // ignore: cast_nullable_to_non_nullable
              as String,
      orderNum: null == orderNum
          ? _value.orderNum
          : orderNum // ignore: cast_nullable_to_non_nullable
              as double,
      memo: null == memo
          ? _value.memo
          : memo // ignore: cast_nullable_to_non_nullable
              as String,
      createdAt: null == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as String,
      sets: null == sets
          ? _value._sets
          : sets // ignore: cast_nullable_to_non_nullable
              as List<SetModel>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$ExerciseRecordModelImpl implements _ExerciseRecordModel {
  _$ExerciseRecordModelImpl(
      {required this.exerciseName,
      required this.orderNum,
      required this.memo,
      required this.createdAt,
      required final List<SetModel> sets})
      : _sets = sets;

  factory _$ExerciseRecordModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$ExerciseRecordModelImplFromJson(json);

  @override
  final String exerciseName;
  @override
  final double orderNum;
  @override
  final String memo;
  @override
  final String createdAt;
  final List<SetModel> _sets;
  @override
  List<SetModel> get sets {
    if (_sets is EqualUnmodifiableListView) return _sets;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_sets);
  }

  @override
  String toString() {
    return 'ExerciseRecordModel(exerciseName: $exerciseName, orderNum: $orderNum, memo: $memo, createdAt: $createdAt, sets: $sets)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ExerciseRecordModelImpl &&
            (identical(other.exerciseName, exerciseName) ||
                other.exerciseName == exerciseName) &&
            (identical(other.orderNum, orderNum) ||
                other.orderNum == orderNum) &&
            (identical(other.memo, memo) || other.memo == memo) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            const DeepCollectionEquality().equals(other._sets, _sets));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, exerciseName, orderNum, memo,
      createdAt, const DeepCollectionEquality().hash(_sets));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$ExerciseRecordModelImplCopyWith<_$ExerciseRecordModelImpl> get copyWith =>
      __$$ExerciseRecordModelImplCopyWithImpl<_$ExerciseRecordModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ExerciseRecordModelImplToJson(
      this,
    );
  }
}

abstract class _ExerciseRecordModel implements ExerciseRecordModel {
  factory _ExerciseRecordModel(
      {required final String exerciseName,
      required final double orderNum,
      required final String memo,
      required final String createdAt,
      required final List<SetModel> sets}) = _$ExerciseRecordModelImpl;

  factory _ExerciseRecordModel.fromJson(Map<String, dynamic> json) =
      _$ExerciseRecordModelImpl.fromJson;

  @override
  String get exerciseName;
  @override
  double get orderNum;
  @override
  String get memo;
  @override
  String get createdAt;
  @override
  List<SetModel> get sets;
  @override
  @JsonKey(ignore: true)
  _$$ExerciseRecordModelImplCopyWith<_$ExerciseRecordModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
