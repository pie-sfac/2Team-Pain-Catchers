// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'mediaRecord_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaRecordModelImpl _$$MediaRecordModelImplFromJson(
        Map<String, dynamic> json) =>
    _$MediaRecordModelImpl(
      uuid: json['uuid'] as String,
      type: json['type'] as String,
      url: json['url'] as String,
      thumbnailUrl: json['thumbnailUrl'] as String,
    );

Map<String, dynamic> _$$MediaRecordModelImplToJson(
        _$MediaRecordModelImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'type': instance.type,
      'url': instance.url,
      'thumbnailUrl': instance.thumbnailUrl,
    };
