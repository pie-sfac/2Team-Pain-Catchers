import 'package:catchmypain/model/sketch.dart';
import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawingCanvas extends ConsumerWidget {
  final double height;
  final double width;

  const DrawingCanvas({
    super.key,
    required this.height,
    required this.width,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Stack(
      children: [
        buildAllPaths(context, ref),
        buildCurrentPath(context, ref),
      ],
    );
  }

  Widget buildAllPaths(context, ref) {
    final allSketches = ref.watch(sketchesProvider);
    return RepaintBoundary(
      child: SizedBox(
        height: height,
        width: width,
        child: CustomPaint(
          painter: SketchPainter(
            sketches: allSketches, //안되면 .state
          ),
        ),
      ),
    );
  }

  Widget buildCurrentPath(BuildContext context, ref) {
    final currentSketch = ref.watch(sketchProvider);
    final allSketches = ref.watch(sketchesProvider);
    final selectedColor = ref.watch(colorProvider);
    final strokeSize = ref.watch(sizeProvider);
    final drawingMode = ref.watch(drawingModeProvider);

    return Listener(
      onPointerDown: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);

        ref.read(sketchProvider.notifier).state = Sketch(
            points: [offset],
            color: selectedColor,
            size: strokeSize,
            mode: drawingMode);

        if (ref.read(stackProvider).isNotEmpty) {       //모르겠당... 
          ref.read(stackProvider.notifier).state = List<Sketch>.from([]);
        }
      },
      onPointerMove: (details) {
        final box = context.findRenderObject() as RenderBox;
        final offset = box.globalToLocal(details.position);

        final points = List<Offset>.from(currentSketch?.points ?? [])
          ..add(offset);
        ref.read(sketchProvider.notifier).state = Sketch(
            points: points,
            color: selectedColor,
            size: strokeSize,
            mode: drawingMode);
      },
      onPointerUp: (details) {
               // 이거 맞나

        if (currentSketch != null) {
          ref.read(sketchesProvider.notifier).state =
              List<Sketch>.from(allSketches)..add(currentSketch!);
        }
        // 현재 스케치를 초기화합니다.
        ref.read(sketchProvider.notifier).state = Sketch(
            points: [],
            color: selectedColor,
            size: strokeSize,
            mode: drawingMode);
      },
      child: RepaintBoundary(
        child: SizedBox(
          height: height,
          width: width,
          child: CustomPaint(
            painter: SketchPainter(
              sketches: currentSketch == null ? [] : [currentSketch],
            ),
          ),
        ),
      ),
    );
  }
}

class SketchPainter extends CustomPainter {
  final List<Sketch> sketches;

  SketchPainter({required this.sketches});

  @override
  void paint(Canvas canvas, Size size) {
    // TODO: implement paint
    for (Sketch sketch in sketches) {
      final points = sketch.points;

      final path = Path();
      path.moveTo(points.first.dx, points.first.dy);

      for (int i = 1; i < points.length - 1; i++) {
        final p0 = points[i];
        final p1 = points[i + 1];
        path.quadraticBezierTo(
            p0.dx, p0.dy, (p0.dx + p1.dx) / 2, (p0.dy + p1.dy) / 2); // 이기 뭐꼬
      }

      Paint paint = Paint()
        ..color = sketch.color
        ..strokeWidth = sketch.size
        ..strokeCap = StrokeCap.round
        ..style = PaintingStyle.stroke;

      Offset firstPoint = sketch.points.first;
      Offset lastPoint = sketch.points.last;
      Rect rect = Rect.fromPoints(firstPoint, lastPoint);

      if (sketch.mode == DrawingMode.pencil) {
        canvas.drawPath(path, paint);
      } else if (sketch.mode == DrawingMode.line) {
        canvas.drawLine(firstPoint, lastPoint, paint);
      } else if (sketch.mode == DrawingMode.circle) {
        canvas.drawOval(rect, paint);
      } else if (sketch.mode == DrawingMode.rect) {
        canvas.drawRect(rect, paint);
      }
    }
  }

  @override
  bool shouldRepaint(covariant SketchPainter oldDelegate) {
    // return oldDelegate.sketches != sketches;
    return true;
  }
}
