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

        //painHistory, condition의 데이터타입이 List<dynamic>이기 때문에
        //Map<String, dynamic>으로 바꿔줘야함
        //map()의 요소, e의 데이터타입과 모델클래스.fromJson에서 설정할 데이터 타입 맞춰줘야함
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
