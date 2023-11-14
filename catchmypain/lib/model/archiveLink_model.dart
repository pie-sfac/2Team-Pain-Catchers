import 'package:freezed_annotation/freezed_annotation.dart';

part 'archiveLink_model.freezed.dart';
part 'archiveLink_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class ArchiveLinkModel with _$ArchiveLinkModel {
  factory ArchiveLinkModel(
      {required String url,
      required String title,
      required String description}) = _ArchiveLinkModel;

  factory ArchiveLinkModel.fromJson(Map<String, dynamic> json) =>
      _$ArchiveLinkModelFromJson(json);
}
