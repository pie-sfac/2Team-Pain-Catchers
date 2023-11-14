import 'package:freezed_annotation/freezed_annotation.dart';

part 'set_model.freezed.dart';
part 'set_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class SetModel with _$SetModel {
  factory SetModel({
    required int setNum,
    required double weight,
    required int repeat,
    int? time,
    int? distance,
  }) = _SetModel;

  factory SetModel.fromJson(Map<String, dynamic> json) =>
      _$SetModelFromJson(json);
}
