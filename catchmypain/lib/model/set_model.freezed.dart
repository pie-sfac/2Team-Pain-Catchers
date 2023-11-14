// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'set_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

SetModel _$SetModelFromJson(Map<String, dynamic> json) {
  return _SetModel.fromJson(json);
}

/// @nodoc
mixin _$SetModel {
  int get setNum => throw _privateConstructorUsedError;
  double get weight => throw _privateConstructorUsedError;
  int get repeat => throw _privateConstructorUsedError;
  int? get time => throw _privateConstructorUsedError;
  int? get distance => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SetModelCopyWith<SetModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SetModelCopyWith<$Res> {
  factory $SetModelCopyWith(SetModel value, $Res Function(SetModel) then) =
      _$SetModelCopyWithImpl<$Res, SetModel>;
  @useResult
  $Res call({int setNum, double weight, int repeat, int? time, int? distance});
}

/// @nodoc
class _$SetModelCopyWithImpl<$Res, $Val extends SetModel>
    implements $SetModelCopyWith<$Res> {
  _$SetModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNum = null,
    Object? weight = null,
    Object? repeat = null,
    Object? time = freezed,
    Object? distance = freezed,
  }) {
    return _then(_value.copyWith(
      setNum: null == setNum
          ? _value.setNum
          : setNum // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SetModelImplCopyWith<$Res>
    implements $SetModelCopyWith<$Res> {
  factory _$$SetModelImplCopyWith(
          _$SetModelImpl value, $Res Function(_$SetModelImpl) then) =
      __$$SetModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int setNum, double weight, int repeat, int? time, int? distance});
}

/// @nodoc
class __$$SetModelImplCopyWithImpl<$Res>
    extends _$SetModelCopyWithImpl<$Res, _$SetModelImpl>
    implements _$$SetModelImplCopyWith<$Res> {
  __$$SetModelImplCopyWithImpl(
      _$SetModelImpl _value, $Res Function(_$SetModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? setNum = null,
    Object? weight = null,
    Object? repeat = null,
    Object? time = freezed,
    Object? distance = freezed,
  }) {
    return _then(_$SetModelImpl(
      setNum: null == setNum
          ? _value.setNum
          : setNum // ignore: cast_nullable_to_non_nullable
              as int,
      weight: null == weight
          ? _value.weight
          : weight // ignore: cast_nullable_to_non_nullable
              as double,
      repeat: null == repeat
          ? _value.repeat
          : repeat // ignore: cast_nullable_to_non_nullable
              as int,
      time: freezed == time
          ? _value.time
          : time // ignore: cast_nullable_to_non_nullable
              as int?,
      distance: freezed == distance
          ? _value.distance
          : distance // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SetModelImpl implements _SetModel {
  _$SetModelImpl(
      {required this.setNum,
      required this.weight,
      required this.repeat,
      this.time,
      this.distance});

  factory _$SetModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$SetModelImplFromJson(json);

  @override
  final int setNum;
  @override
  final double weight;
  @override
  final int repeat;
  @override
  final int? time;
  @override
  final int? distance;

  @override
  String toString() {
    return 'SetModel(setNum: $setNum, weight: $weight, repeat: $repeat, time: $time, distance: $distance)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SetModelImpl &&
            (identical(other.setNum, setNum) || other.setNum == setNum) &&
            (identical(other.weight, weight) || other.weight == weight) &&
            (identical(other.repeat, repeat) || other.repeat == repeat) &&
            (identical(other.time, time) || other.time == time) &&
            (identical(other.distance, distance) ||
                other.distance == distance));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, setNum, weight, repeat, time, distance);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SetModelImplCopyWith<_$SetModelImpl> get copyWith =>
      __$$SetModelImplCopyWithImpl<_$SetModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SetModelImplToJson(
      this,
    );
  }
}

abstract class _SetModel implements SetModel {
  factory _SetModel(
      {required final int setNum,
      required final double weight,
      required final int repeat,
      final int? time,
      final int? distance}) = _$SetModelImpl;

  factory _SetModel.fromJson(Map<String, dynamic> json) =
      _$SetModelImpl.fromJson;

  @override
  int get setNum;
  @override
  double get weight;
  @override
  int get repeat;
  @override
  int? get time;
  @override
  int? get distance;
  @override
  @JsonKey(ignore: true)
  _$$SetModelImplCopyWith<_$SetModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
