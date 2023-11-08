
import 'package:catchmypain/model/sketch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final colorProvider = StateProvider<Color>((ref) {    // Color 타입의 StateProvider를 선언합니다.
  return Colors.black;
});

final sizeProvider = StateProvider<double>((ref) => 10);    //strokeSize
 
final sketchesProvider = StateProvider<List<Sketch>>((ref) => []);    //allSketches

final sketchProvider = StateProvider<Sketch?>((ref) => null);    //currentSketch

final drawingModeProvider = StateProvider<DrawingMode>((ref) => DrawingMode.pencil);

final stackProvider = StateProvider<List<Sketch>>((ref) => []);

final saveProvider = StateProvider<List<Sketch>>((ref) => []);

final paletteProvider = StateProvider<bool>((ref) => false);

final showProvider = StateProvider<bool>((ref) => true);