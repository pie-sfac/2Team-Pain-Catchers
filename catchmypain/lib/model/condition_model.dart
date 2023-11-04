import 'package:freezed_annotation/freezed_annotation.dart';

part 'condition_model.freezed.dart';
part 'condition_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class ConditionModel with _$ConditionModel {
  factory ConditionModel({required String date, required String condition}) =
      _ConditionModel;

  factory ConditionModel.fromJson(Map<String, dynamic> json) =>
      _$ConditionModelFromJson(json);
}
