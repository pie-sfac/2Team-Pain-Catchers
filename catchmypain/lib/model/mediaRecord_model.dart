import 'package:freezed_annotation/freezed_annotation.dart';

part 'mediaRecord_model.freezed.dart';
part 'mediaRecord_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class MediaRecordModel with _$MediaRecordModel {
  factory MediaRecordModel(
      {required String uuid,
      required String type,
      required String url,
      required String thumbnailUrl}) = _MediaRecordModel;

  factory MediaRecordModel.fromJson(Map<String, dynamic> json) =>
      _$MediaRecordModelFromJson(json);
}
