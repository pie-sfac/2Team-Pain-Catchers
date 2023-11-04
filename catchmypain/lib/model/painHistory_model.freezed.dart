// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'painHistory_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

PainHistoryModel _$PainHistoryModelFromJson(Map<String, dynamic> json) {
  return _PainHistoryModel.fromJson(json);
}

/// @nodoc
mixin _$PainHistoryModel {
  String get date => throw _privateConstructorUsedError;
  int get level => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PainHistoryModelCopyWith<PainHistoryModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PainHistoryModelCopyWith<$Res> {
  factory $PainHistoryModelCopyWith(
          PainHistoryModel value, $Res Function(PainHistoryModel) then) =
      _$PainHistoryModelCopyWithImpl<$Res, PainHistoryModel>;
  @useResult
  $Res call({String date, int level});
}

/// @nodoc
class _$PainHistoryModelCopyWithImpl<$Res, $Val extends PainHistoryModel>
    implements $PainHistoryModelCopyWith<$Res> {
  _$PainHistoryModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? level = null,
  }) {
    return _then(_value.copyWith(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PainHistoryModelImplCopyWith<$Res>
    implements $PainHistoryModelCopyWith<$Res> {
  factory _$$PainHistoryModelImplCopyWith(_$PainHistoryModelImpl value,
          $Res Function(_$PainHistoryModelImpl) then) =
      __$$PainHistoryModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String date, int level});
}

/// @nodoc
class __$$PainHistoryModelImplCopyWithImpl<$Res>
    extends _$PainHistoryModelCopyWithImpl<$Res, _$PainHistoryModelImpl>
    implements _$$PainHistoryModelImplCopyWith<$Res> {
  __$$PainHistoryModelImplCopyWithImpl(_$PainHistoryModelImpl _value,
      $Res Function(_$PainHistoryModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? date = null,
    Object? level = null,
  }) {
    return _then(_$PainHistoryModelImpl(
      date: null == date
          ? _value.date
          : date // ignore: cast_nullable_to_non_nullable
              as String,
      level: null == level
          ? _value.level
          : level // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PainHistoryModelImpl implements _PainHistoryModel {
  _$PainHistoryModelImpl({required this.date, required this.level});

  factory _$PainHistoryModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$PainHistoryModelImplFromJson(json);

  @override
  final String date;
  @override
  final int level;

  @override
  String toString() {
    return 'PainHistoryModel(date: $date, level: $level)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PainHistoryModelImpl &&
            (identical(other.date, date) || other.date == date) &&
            (identical(other.level, level) || other.level == level));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, date, level);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PainHistoryModelImplCopyWith<_$PainHistoryModelImpl> get copyWith =>
      __$$PainHistoryModelImplCopyWithImpl<_$PainHistoryModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PainHistoryModelImplToJson(
      this,
    );
  }
}

abstract class _PainHistoryModel implements PainHistoryModel {
  factory _PainHistoryModel(
      {required final String date,
      required final int level}) = _$PainHistoryModelImpl;

  factory _PainHistoryModel.fromJson(Map<String, dynamic> json) =
      _$PainHistoryModelImpl.fromJson;

  @override
  String get date;
  @override
  int get level;
  @override
  @JsonKey(ignore: true)
  _$$PainHistoryModelImplCopyWith<_$PainHistoryModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
