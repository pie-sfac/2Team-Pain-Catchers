import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catchmypain/model/sketch.dart';

import 'drawing_canvas.dart';

class ShowDrawing extends ConsumerWidget {

  ShowDrawing({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<Sketch> savedSketches = ref.read(sketchesProvider);
    return Stack(
      children: [
        Container(
          decoration: BoxDecoration(
              image: DecorationImage(
                  image: AssetImage('asset/images/paint_pose.png'))),
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
