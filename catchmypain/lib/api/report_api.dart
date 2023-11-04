import 'package:catchmypain/model/apiResponse.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:retrofit/retrofit.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'report_api.g.dart';

@riverpod
ReportApi reportApi(Ref ref) {
  return ReportApi(Dio());
}

@RestApi(baseUrl: 'https://flutterapi.tykan.me')
abstract class ReportApi {
  factory ReportApi(Dio dio, {String? baseUrl}) = _ReportApi;

  @GET('/personal-reports/{uuid}')
  Future<ApiResponse> getReport({@Path('uuid') required String uuid});
}
