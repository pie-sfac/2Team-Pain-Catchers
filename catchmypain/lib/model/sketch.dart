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
}

enum DrawingMode { pencil, line, arrow, eraser, rect, circle }