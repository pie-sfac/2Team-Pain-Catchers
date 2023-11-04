import 'package:catchmypain/model/apiResponse.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:dio/dio.dart';
import 'package:catchmypain/api/report_api.dart'; // report_api.dart에서 ReportApi를 가져옵니다.

// Provider for the ReportApi
final reportApiProvider = Provider<ReportApi>((ref) {
  return ReportApi(Dio());
});

final reportProvider =
    FutureProvider.family<ApiResponse, String>((ref, uuid) async {
  try {
    final reportApi = ref.watch(reportApiProvider);
    var response = await reportApi.getReport(uuid: uuid);
    return response; // JSON 파싱
  } catch (e, stack) {
    print('Error: $e'); // 에러 로깅
    print('StackTrace: $stack'); // 스택 트레이스 로깅
    rethrow; // 에러를 다시 던져 상위로 전파
  }
});
