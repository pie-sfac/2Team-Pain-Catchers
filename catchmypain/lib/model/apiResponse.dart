import 'package:catchmypain/model/condition_model.dart';
import 'package:catchmypain/model/member_model.dart';
import 'package:catchmypain/model/painHistory_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'apiResponse.freezed.dart';
part 'apiResponse.g.dart';

@freezed
class ApiResponse with _$ApiResponse {
  const factory ApiResponse({
    required MemberModel member,
    required List<PainHistoryModel> painHistory,
    required List<ConditionModel> condition,
  }) = _ApiResponse;

  factory ApiResponse.fromJson(Map<String, dynamic> json) => ApiResponse(
        member: MemberModel.fromJson(json['member'] as Map<String, dynamic>),
        painHistory: (json['painHistory'] as List<dynamic>).map((e) {
          // print('painHistory type: ${json['painHistory'].runtimeType}');
          // print('painHistory value: ${json['painHistory']}');
          // print('e : ${e.runtimeType}');
          return PainHistoryModel.fromJson(e as Map<String, dynamic>);
        }).toList(),
        condition: (json['condition'] as List<dynamic>)
            .map((e) => ConditionModel.fromJson(e as Map<String, dynamic>))
            .toList(),
      );
}
