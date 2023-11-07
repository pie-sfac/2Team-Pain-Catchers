import 'dart:convert';

import 'package:catchmypain/model/exercisedata.dart';
import 'package:flutter/services.dart' show rootBundle;
import 'package:flutter_riverpod/flutter_riverpod.dart';

final fileContentProvider = FutureProvider<List<ExerciseData>>((ref) async {
  try {
    // 'asset/file/pushData.txt' 경로를 사용하여 파일의 내용을 읽습니다.
    final jsonString = await rootBundle.loadString('asset/file/pushData.txt');
    // JSON 문자열을 디코드하여 Dart 객체로 변환
    List<dynamic> jsonData = json.decode(jsonString);
    List<ExerciseData> exerData =
        jsonData.map((e) => ExerciseData.fromJson(e)).toList();
    // exerData = (json.decode(jsonString) as List<dynamic>).map((e) {
    //   // print('painHistory type: ${json['painHistory'].runtimeType}');
    //   // print('painHistory value: ${json['painHistory']}');
    //   // print('e : ${e.runtimeType}');
    //   return ExerciseData.fromJson(e);
    // }).toList();
    return exerData;
  } catch (e) {
    // 에러가 발생한 경우
    throw Exception('Could not read file: $e');
  }
});
