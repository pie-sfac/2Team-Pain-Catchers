import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../model/sketch.dart';
import 'drawing_canvas.dart';

class ShowDrawing extends ConsumerWidget {
  const ShowDrawing({super.key});
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
   List<Sketch> savedSketches = ref.read(sketchesProvider);
   print(savedSketches);
   
    return  RepaintBoundary(
          child: SizedBox(
            // height: MediaQuery.of(context).size.height,
            // width: MediaQuery.of(context).size.width,
            child: CustomPaint(
              painter: SketchPainter(
                sketches: savedSketches ,
              ),
            ),
          ),
        );
  }
}