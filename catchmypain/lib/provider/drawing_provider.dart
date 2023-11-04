
import 'package:catchmypain/model/sketch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Color 타입의 StateProvider를 선언합니다.
// 초기 값으로 Colors.blue를 설정합니다.
final colorProvider = StateProvider<Color>((ref) {
  return Colors.black;
});

final sizeProvider = StateProvider<double>((ref) => 10);

final sketchesProvider = StateProvider<List<Sketch>>((ref) => []);

final sketchProvider = StateProvider<Sketch?>((ref) => null);

final drawingModeProvider = StateProvider<DrawingMode>((ref) => DrawingMode.pencil);