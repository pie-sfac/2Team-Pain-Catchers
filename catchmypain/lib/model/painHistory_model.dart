import 'package:freezed_annotation/freezed_annotation.dart';

part 'painHistory_model.freezed.dart';
part 'painHistory_model.g.dart';

@freezed
class PainHistoryModel with _$PainHistoryModel {
  factory PainHistoryModel({required String date, required int level}) =
      _PainHistoryModel;

  factory PainHistoryModel.fromJson(Map<String, dynamic> json) =>
      _$PainHistoryModelFromJson(json);
}
