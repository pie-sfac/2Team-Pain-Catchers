// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'exerciseRecord_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ExerciseRecordModelImpl _$$ExerciseRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$ExerciseRecordModelImpl(
      exerciseName: json['exerciseName'] as String,
      orderNum: (json['orderNum'] as num).toDouble(),
      memo: json['memo'] as String,
      createdAt: json['createdAt'] as String,
      sets: (json['sets'] as List<dynamic>)
          .map((e) => SetModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ExerciseRecordModelImplToJson(
        _$ExerciseRecordModelImpl instance) =>
    <String, dynamic>{
      'exerciseName': instance.exerciseName,
      'orderNum': instance.orderNum,
      'memo': instance.memo,
      'createdAt': instance.createdAt,
      'sets': instance.sets,
    };
