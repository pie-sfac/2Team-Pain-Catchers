import 'package:catchmypain/model/archiveLink_model.dart';
import 'package:catchmypain/model/center_model.dart';
import 'package:catchmypain/model/comment_model.dart';
import 'package:catchmypain/model/condition_model.dart';
import 'package:catchmypain/model/exerciseRecord_model.dart';
import 'package:catchmypain/model/mediaRecord_model.dart';
import 'package:catchmypain/model/member_model.dart';
import 'package:catchmypain/model/painHistory_model.dart';
import 'package:catchmypain/model/user_model.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apiResponse.freezed.dart';
part 'apiResponse.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required String uuid,
    required UserModel writer,
    required CenterModel center,
    required MemberModel member,
    required CommentModel comment,
    required List<MediaRecordModel> media,
    required List<ArchiveLinkModel> archiveLink,
    required List<PainHistoryModel> painHistory,
    required List<ConditionModel> condition,
    required List<ExerciseRecordModel> exercise,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) =>
      _$ApiResponseFromJson(json);
}
