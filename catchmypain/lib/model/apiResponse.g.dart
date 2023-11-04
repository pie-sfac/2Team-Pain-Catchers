// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      member: MemberModel.fromJson(json['member'] as Map<String, dynamic>),
      painHistory: (json['painHistory'] as List<dynamic>)
          .map((e) => PainHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      condition: (json['condition'] as List<dynamic>)
          .map((e) => ConditionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'member': instance.member,
      'painHistory': instance.painHistory,
      'condition': instance.condition,
    };
