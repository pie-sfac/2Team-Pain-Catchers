// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'recordItem_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$RecordItemModelImpl _$$RecordItemModelImplFromJson(
        Map<String, dynamic> json) =>
    _$RecordItemModelImpl(
      hidden: json['hidden'] as bool,
      orderNum: json['orderNum'] as String,
      memo: json['memo'] as String,
      createdAt: json['createdAt'] as String,
      sets: json['sets'] as String,
    );

Map<String, dynamic> _$$RecordItemModelImplToJson(
        _$RecordItemModelImpl instance) =>
    <String, dynamic>{
      'hidden': instance.hidden,
      'orderNum': instance.orderNum,
      'memo': instance.memo,
      'createdAt': instance.createdAt,
      'sets': instance.sets,
    };
