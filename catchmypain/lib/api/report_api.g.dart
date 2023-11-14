// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'report_api.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

// ignore_for_file: unnecessary_brace_in_string_interps,no_leading_underscores_for_local_identifiers

class _ReportApi implements ReportApi {
  _ReportApi(
    this._dio, {
    this.baseUrl,
  }) {
    baseUrl ??= 'https://flutterapi.tykan.me';
  }

  final Dio _dio;

  String? baseUrl;

  @override
  Future<ApiResponse> getReport({required String uuid}) async {
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{};
    final _headers = <String, dynamic>{};
    final Map<String, dynamic>? _data = null;
    final _result = await _dio
        .fetch<Map<String, dynamic>>(_setStreamType<ApiResponse>(Options(
      method: 'GET',
      headers: _headers,
      extra: _extra,
    )
            .compose(
              _dio.options,
              '/personal-reports/${uuid}',
              queryParameters: queryParameters,
              data: _data,
            )
            .copyWith(
                baseUrl: _combineBaseUrls(
              _dio.options.baseUrl,
              baseUrl,
            ))));
    final value = ApiResponse.fromJson({
      'uuid': _result.data!['uuid'],
      'writer': _result.data!['writer'],
      'center': _result.data!['center'],
      'member': _result.data!['member'],
      'comment': _result.data!['comment'],
      'media': _result.data!['media']['items'],
      'archiveLink': _result.data!['archiveLink']['items'],
      'painHistory': _result.data!['painHistory']['items'],
      'condition': _result.data!['condition']['items'],
      'exercise': _result.data!['exercise']['items']
    });
    print('value : ${value}');
    return value;
  }

  RequestOptions _setStreamType<T>(RequestOptions requestOptions) {
    if (T != dynamic &&
        !(requestOptions.responseType == ResponseType.bytes ||
            requestOptions.responseType == ResponseType.stream)) {
      if (T == String) {
        requestOptions.responseType = ResponseType.plain;
      } else {
        requestOptions.responseType = ResponseType.json;
      }
    }
    return requestOptions;
  }

  String _combineBaseUrls(
    String dioBaseUrl,
    String? baseUrl,
  ) {
    if (baseUrl == null || baseUrl.trim().isEmpty) {
      return dioBaseUrl;
    }

    final url = Uri.parse(baseUrl);

    if (url.isAbsolute) {
      return url.toString();
    }

    return Uri.parse(dioBaseUrl).resolveUri(url).toString();
  }
}
