import 'package:freezed_annotation/freezed_annotation.dart';

part 'comment_model.freezed.dart';
part 'comment_model.g.dart'; // JSON serializable 생성을 위한 부분

@freezed
class CommentModel with _$CommentModel {
  factory CommentModel({required bool hidden, required String content}) =
      _CommentModel;

  factory CommentModel.fromJson(Map<String, dynamic> json) =>
      _$CommentModelFromJson(json);
}
