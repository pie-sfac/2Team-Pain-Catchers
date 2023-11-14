import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class UserModel with _$UserModel {
  factory UserModel({required int id, required String name}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}
