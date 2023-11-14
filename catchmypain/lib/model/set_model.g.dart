// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'set_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SetModelImpl _$$SetModelImplFromJson(Map<String, dynamic> json) =>
    _$SetModelImpl(
      setNum: json['setNum'] as int,
      weight: (json['weight'] as num).toDouble(),
      repeat: json['repeat'] as int,
      time: json['time'] as int?,
      distance: json['distance'] as int?,
    );

Map<String, dynamic> _$$SetModelImplToJson(_$SetModelImpl instance) =>
    <String, dynamic>{
      'setNum': instance.setNum,
      'weight': instance.weight,
      'repeat': instance.repeat,
      'time': instance.time,
      'distance': instance.distance,
    };
