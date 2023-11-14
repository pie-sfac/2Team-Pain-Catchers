import 'package:catchmypain/model/set_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'exerciseRecord_model.freezed.dart';
part 'exerciseRecord_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class ExerciseRecordModel with _$ExerciseRecordModel {
  factory ExerciseRecordModel({
    required String exerciseName,
    required double orderNum,
    required String memo,
    required String createdAt,
    required List<SetModel> sets,
  }) = _ExerciseRecordModel;

  factory ExerciseRecordModel.fromJson(Map<String, dynamic> json) =>
      _$ExerciseRecordModelFromJson(json);
}
