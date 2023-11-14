import 'dart:convert';

import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catchmypain/model/sketch.dart';

import 'drawing_canvas.dart';

class ShowDrawing extends ConsumerWidget {
  const ShowDrawing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // List<Map<String, dynamic>> tmp =
    //     List<Map<String, dynamic>>.from(json.decode(ref.read(jsonProvider)));    // fromJson()
    List<Sketch> sketches = sketchesFromJson(ref.read(jsonProvider));

    return Stack(
      children: [
        Container(
          decoration: const BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/video_capture.jpg'))),
        ),
        RepaintBoundary(
          child: SizedBox(
            child: CustomPaint(
              painter: SketchPainter(
                sketches: sketches,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
