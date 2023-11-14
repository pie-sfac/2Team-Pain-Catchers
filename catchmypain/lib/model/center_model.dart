import 'package:freezed_annotation/freezed_annotation.dart';

part 'center_model.freezed.dart';
part 'center_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class CenterModel with _$CenterModel {
  factory CenterModel(
      {required int id,
      required String name,
      required String code}) = _CenterModel;

  factory CenterModel.fromJson(Map<String, dynamic> json) =>
      _$CenterModelFromJson(json);
}
