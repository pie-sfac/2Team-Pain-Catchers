import 'dart:convert';

import 'package:google_ml_kit/google_ml_kit.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExerciseData {
  int count;
  String poseState;
  String durationTime;
  String recordTime;
  CoordinateLandmark rtShoulder;
  CoordinateLandmark rtElbow;
  CoordinateLandmark rtWrist;
  CoordinateLandmark rtHip;
  CoordinateLandmark rtKnee;
  CoordinateLandmark rtAnkle;
  CoordinateLandmark ltShoulder;
  CoordinateLandmark ltElbow;
  CoordinateLandmark ltWrist;
  CoordinateLandmark ltHip;
  CoordinateLandmark ltKnee;
  CoordinateLandmark ltAnkle;
  ExerciseData({
    required this.count,
    required this.poseState,
    required this.durationTime,
    required this.recordTime,
    required this.rtShoulder,
    required this.rtElbow,
    required this.rtWrist,
    required this.rtHip,
    required this.rtKnee,
    required this.rtAnkle,
    required this.ltShoulder,
    required this.ltElbow,
    required this.ltWrist,
    required this.ltHip,
    required this.ltKnee,
    required this.ltAnkle,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'poseState': poseState,
      'durationTime': durationTime,
      'recordTime': recordTime,
      'rtShoulder': rtShoulder.toMap(),
      'rtElbow': rtElbow.toMap(),
      'rtWrist': rtWrist.toMap(),
      'rtHip': rtHip.toMap(),
      'rtKnee': rtKnee.toMap(),
      'rtAnkle': rtAnkle.toMap(),
      'ltShoulder': ltShoulder.toMap(),
      'ltElbow': ltElbow.toMap(),
      'ltWrist': ltWrist.toMap(),
      'ltHip': ltHip.toMap(),
      'ltKnee': ltKnee.toMap(),
      'ltAnkle': ltAnkle.toMap(),
    };
  }

  factory ExerciseData.fromMap(Map<String, dynamic> map) {
    return ExerciseData(
      count: map['count'] as int,
      poseState: map['poseState'] as String,
      durationTime: map['durationTime'] as String,
      recordTime: map['recordTime'] as String,
      rtShoulder:
          CoordinateLandmark.fromMap(map['rtShoulder'] as Map<String, dynamic>),
      rtElbow:
          CoordinateLandmark.fromMap(map['rtElbow'] as Map<String, dynamic>),
      rtWrist:
          CoordinateLandmark.fromMap(map['rtWrist'] as Map<String, dynamic>),
      rtHip: CoordinateLandmark.fromMap(map['rtHip'] as Map<String, dynamic>),
      rtKnee: CoordinateLandmark.fromMap(map['rtKnee'] as Map<String, dynamic>),
      rtAnkle:
          CoordinateLandmark.fromMap(map['rtAnkle'] as Map<String, dynamic>),
      ltShoulder:
          CoordinateLandmark.fromMap(map['ltShoulder'] as Map<String, dynamic>),
      ltElbow:
          CoordinateLandmark.fromMap(map['ltElbow'] as Map<String, dynamic>),
      ltWrist:
          CoordinateLandmark.fromMap(map['ltWrist'] as Map<String, dynamic>),
      ltHip: CoordinateLandmark.fromMap(map['ltHip'] as Map<String, dynamic>),
      ltKnee: CoordinateLandmark.fromMap(map['ltKnee'] as Map<String, dynamic>),
      ltAnkle:
          CoordinateLandmark.fromMap(map['ltAnkle'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseData.fromJson(String source) =>
      ExerciseData.fromMap(json.decode(source) as Map<String, dynamic>);
}

// class Angles {
//   //오른쪽 팔꿈치 각도
//   double rightWES;
//   //오른쪽 겨드랑이 각도
//   double rightESH;
//   //오른쪽 골반 각도
//   double rightSHK;
//   //오른쪽 무릎 각도
//   double rightHKA;
//   //왼쪽 팔꿈치 각도
//   double leftWES;
//   //왼쪽 겨드랑이 각도
//   double leftESH;
//   //왼쪽 골반 각도
//   double leftSHK;
//   //왼쪽 무릎 각도
//   double leftHKA;
//   Angles({
//     required this.rightWES,
//     required this.rightESH,
//     required this.rightSHK,
//     required this.rightHKA,
//     required this.leftWES,
//     required this.leftESH,
//     required this.leftSHK,
//     required this.leftHKA,
//     required this.durationTime,
//   });

//   Map<String, dynamic> toMap() {
//     return <String, dynamic>{
//       'rightWES': rightWES,
//       'rightESH': rightESH,
//       'rightSHK': rightSHK,
//       'rightHKA': rightHKA,
//       'leftWES': leftWES,
//       'leftESH': leftESH,
//       'leftSHK': leftSHK,
//       'leftHKA': leftHKA,
//       'durationTime': durationTime,
//     };
//   }

//   factory Angles.fromMap(Map<String, dynamic> map) {
//     return Angles(
//       rightWES: map['rightWES'] as double,
//       rightESH: map['rightESH'] as double,
//       rightSHK: map['rightSHK'] as double,
//       rightHKA: map['rightHKA'] as double,
//       leftWES: map['leftWES'] as double,
//       leftESH: map['leftESH'] as double,
//       leftSHK: map['leftSHK'] as double,
//       leftHKA: map['leftHKA'] as double,
//       durationTime: map['durationTime'] as String,
//     );
//   }

//   String toJson() => json.encode(toMap());

//   factory Angles.fromJson(String source) =>
//       Angles.fromMap(json.decode(source) as Map<String, dynamic>);
// }

class CoordinateLandmark {
  double x;
  double y;
  double z;
  CoordinateLandmark({
    required this.x,
    required this.y,
    required this.z,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'x': x,
      'y': y,
      'z': z,
    };
  }

  factory CoordinateLandmark.fromMap(Map<String, dynamic> map) {
    return CoordinateLandmark(
      x: map['x'] as double,
      y: map['y'] as double,
      z: map['z'] as double,
    );
  }

  String toJson() => json.encode(toMap());

  factory CoordinateLandmark.fromPoseLandMark(PoseLandmark value) {
    return CoordinateLandmark(
      x: value.x,
      y: value.y,
      z: value.z,
    );
  }

  factory CoordinateLandmark.fromJson(String source) =>
      CoordinateLandmark.fromMap(json.decode(source) as Map<String, dynamic>);
}
