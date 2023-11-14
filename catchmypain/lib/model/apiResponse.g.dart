// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'apiResponse.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ApiResponseImpl _$$ApiResponseImplFromJson(Map<String, dynamic> json) =>
    _$ApiResponseImpl(
      uuid: json['uuid'] as String,
      writer: UserModel.fromJson(json['writer'] as Map<String, dynamic>),
      center: CenterModel.fromJson(json['center'] as Map<String, dynamic>),
      member: MemberModel.fromJson(json['member'] as Map<String, dynamic>),
      comment: CommentModel.fromJson(json['comment'] as Map<String, dynamic>),
      media: (json['media'] as List<dynamic>)
          .map((e) => MediaRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      archiveLink: (json['archiveLink'] as List<dynamic>)
          .map((e) => ArchiveLinkModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      painHistory: (json['painHistory'] as List<dynamic>)
          .map((e) => PainHistoryModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      condition: (json['condition'] as List<dynamic>)
          .map((e) => ConditionModel.fromJson(e as Map<String, dynamic>))
          .toList(),
      exercise: (json['exercise'] as List<dynamic>)
          .map((e) => ExerciseRecordModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ApiResponseImplToJson(_$ApiResponseImpl instance) =>
    <String, dynamic>{
      'uuid': instance.uuid,
      'writer': instance.writer,
      'center': instance.center,
      'member': instance.member,
      'comment': instance.comment,
      'media': instance.media,
      'archiveLink': instance.archiveLink,
      'painHistory': instance.painHistory,
      'condition': instance.condition,
      'exercise': instance.exercise,
    };
