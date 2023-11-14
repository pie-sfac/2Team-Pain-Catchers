// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/material.dart';


class Sketch {
  List<Offset> points;
  Color color;
  double size;
  DrawingMode mode;

  Sketch({
    required this. points,
    this.color = Colors.black,
    this. size = 10,
    this.mode = DrawingMode.pencil,
  });

  @override
  String toString() {
    return 'Sketch(points: $points, color: $color, size: $size, mode: $mode)';
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'points': points.map((x) => x.toMap()).toList(),
      'color': color.value,
      'size': size,
      'mode': mode.toString(),
    };
  }

  factory Sketch.fromMap(Map<String, dynamic> map) {


    return Sketch(
      points: List<Offset>.from((map['points'] as List).map<Offset>((x) => OffsetExtension.fromMap(x as Map<String,dynamic>),),),
      color: Color(map['color'] as int),
      size: map['size'] as double,
      mode: DrawingModeExtension.fromMap(map['mode']),
    );
  }

  String toJson() => json.encode(toMap());

  factory Sketch.fromJson(String source) => Sketch.fromMap(json.decode(source) as Map<String, dynamic>);
}

enum DrawingMode { pencil, line, arrow, eraser, rect, circle }

extension OffsetExtension on Offset {
  Map<String, dynamic> toMap() {
    return {
      'dx': dx,
      'dy': dy,
    };
  }

  static Offset fromMap(Map<String, dynamic> map) {
    return Offset(
      map['dx'] as double,
      map['dy'] as double,
    );
  }
}

extension DrawingModeExtension on DrawingMode {

  static DrawingMode fromMap(String modeString) {
    return DrawingMode.values.firstWhere((e) => e.toString() == modeString);
  }
}

List<Sketch> sketchesFromJson(String jsonString) {    // String을 List<Sketch>로  
    List<Map<String, dynamic>> tmp =
        List<Map<String, dynamic>>.from(json.decode(jsonString));    
    return tmp.map((e) => Sketch.fromMap(e)).toList();
}

String sketchesToJson(List<Sketch> sketches) {  // List<Sketch>를 String으로 
  return sketches.map((e) => e.toJson()).toList().toString();
}