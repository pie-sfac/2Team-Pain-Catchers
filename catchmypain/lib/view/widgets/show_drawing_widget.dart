import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catchmypain/model/sketch.dart';

import 'drawing_canvas.dart';

class ShowDrawing extends ConsumerWidget {
  const ShowDrawing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Sketch> savedSketches = ref.read(sketchesProvider);
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
                sketches: savedSketches,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
