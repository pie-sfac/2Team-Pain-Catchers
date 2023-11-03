import 'dart:convert';

// ignore_for_file: public_member_api_docs, sort_constructors_first
class ExerciseData {
  int count;
  String poseState;
  Angles angles;
  String recordTime;

  ExerciseData({
    required this.count,
    required this.poseState,
    required this.angles,
    required this.recordTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'count': count,
      'poseState': poseState,
      'angles': angles.toMap(),
      'recordTime': recordTime,
    };
  }

  factory ExerciseData.fromMap(Map<String, dynamic> map) {
    return ExerciseData(
      count: map['count'] as int,
      poseState: map['poseState'] as String,
      angles: Angles.fromMap(map['angles'] as Map<String, dynamic>),
      recordTime: map['recordTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory ExerciseData.fromJson(String source) =>
      ExerciseData.fromMap(json.decode(source) as Map<String, dynamic>);
}

class Angles {
  String durationTime;
  //오른쪽 팔꿈치 각도
  double rightWES;
  //오른쪽 겨드랑이 각도
  double rightESH;
  //오른쪽 골반 각도
  double rightSHK;
  //오른쪽 무릎 각도
  double rightHKA;
  //왼쪽 팔꿈치 각도
  double leftWES;
  //왼쪽 겨드랑이 각도
  double leftESH;
  //왼쪽 골반 각도
  double leftSHK;
  //왼쪽 무릎 각도
  double leftHKA;
  Angles({
    required this.rightWES,
    required this.rightESH,
    required this.rightSHK,
    required this.rightHKA,
    required this.leftWES,
    required this.leftESH,
    required this.leftSHK,
    required this.leftHKA,
    required this.durationTime,
  });

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'rightWES': rightWES,
      'rightESH': rightESH,
      'rightSHK': rightSHK,
      'rightHKA': rightHKA,
      'leftWES': leftWES,
      'leftESH': leftESH,
      'leftSHK': leftSHK,
      'leftHKA': leftHKA,
      'durationTime': durationTime,
    };
  }

  factory Angles.fromMap(Map<String, dynamic> map) {
    return Angles(
      rightWES: map['rightWES'] as double,
      rightESH: map['rightESH'] as double,
      rightSHK: map['rightSHK'] as double,
      rightHKA: map['rightHKA'] as double,
      leftWES: map['leftWES'] as double,
      leftESH: map['leftESH'] as double,
      leftSHK: map['leftSHK'] as double,
      leftHKA: map['leftHKA'] as double,
      durationTime: map['durationTime'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Angles.fromJson(String source) =>
      Angles.fromMap(json.decode(source) as Map<String, dynamic>);
}
