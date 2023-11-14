import 'package:freezed_annotation/freezed_annotation.dart';

part 'recordItem_model.freezed.dart';
part 'recordItem_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class RecordItemModel with _$RecordItemModel {
  factory RecordItemModel({
    required bool hidden,
    required String orderNum,
    required String memo,
    required String createdAt,
    required String sets,
  }) = _RecordItemModel;

  factory RecordItemModel.fromJson(Map<String, dynamic> json) =>
      _$RecordItemModelFromJson(json);
}
