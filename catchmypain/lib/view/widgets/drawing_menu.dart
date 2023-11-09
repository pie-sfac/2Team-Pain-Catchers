// ignore_for_file: use_key_in_widget_constructors, prefer_const_constructors

import 'package:catchmypain/model/sketch.dart';
import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawingMenu extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // TODO: implement build

    final selectedColor = ref.watch(colorProvider);
    final strokeSize = ref.watch(sizeProvider);
    final allSketches = ref.watch(sketchesProvider);
    final List<Sketch> sketchStack = ref.watch(stackProvider);

    void undo() {
      if (ref.read(sketchesProvider.notifier).state.isEmpty) {
        return;
      } else {
        Sketch tmp = ref.read(sketchesProvider.notifier).state.removeLast();
        ref.read(stackProvider.notifier).state.add(tmp);
        ref.read(sketchProvider.notifier).state = Sketch(
            points: [],
            color: selectedColor,
            size: strokeSize,
            mode: DrawingMode.pencil);
        // Trigger a rebuild after state change
        ref.refresh(sketchProvider);
      }
    }

    void redo() {
      if (sketchStack.isEmpty) {
        return;
      } else {
        Sketch tmp = ref.read(stackProvider.notifier).state.removeLast();
        ref.read(sketchesProvider.notifier).state.add(tmp);
        ref.read(sketchProvider.notifier).state = tmp;
        ref.refresh(sketchProvider);
      }
    }

    return Container(
      decoration: BoxDecoration(
        color: Colors.white54,
        // border: Border.all(),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8),
              Icon(Icons.palette, color: Color.fromRGBO(45, 98, 234, 1)),
              IconButton(
                icon: Icon(Icons.circle),
                onPressed: () {
                  ref.read(colorProvider.notifier).state = Colors.black;
                },
                color: Colors.black,
              ),
              IconButton(
                icon: Icon(Icons.circle),
                onPressed: () {
                  ref.read(colorProvider.notifier).state = Colors.red;
                },
                color: Colors.red,
              ),
              IconButton(
                icon: Icon(Icons.circle),
                onPressed: () {
                  ref.read(colorProvider.notifier).state = Colors.yellow;
                },
                color: Colors.yellow,
              ),
              IconButton(
                icon: Icon(Icons.circle),
                onPressed: () {
                  ref.read(colorProvider.notifier).state = Colors.blue;
                },
                color: Colors.blue,
              ),
              IconButton(
                icon: Icon(Icons.circle),
                onPressed: () {
                  ref.read(colorProvider.notifier).state = Colors.green;
                },
                color: Colors.green,
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(width: 8),
              Icon(Icons.draw, color: Color.fromRGBO(45, 98, 234, 1)),
              IconButton(
                icon: Icon(Icons.brush),
                onPressed: () {
                  ref.read(drawingModeProvider.notifier).state =
                      DrawingMode.pencil;
                },
              ),
              IconButton(
                icon: Icon(Icons.circle_outlined),
                onPressed: () {
                  ref.read(drawingModeProvider.notifier).state =
                      DrawingMode.circle;
                },
              ),
              IconButton(
                icon: Icon(Icons.square_outlined),
                onPressed: () {
                  ref.read(drawingModeProvider.notifier).state =
                      DrawingMode.rect;
                },
              ),
              IconButton(
                icon: Icon(Icons.horizontal_rule),
                onPressed: () {
                  ref.read(drawingModeProvider.notifier).state =
                      DrawingMode.line;
                },
              ),
            ],
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              SizedBox(
                width: 8,
              ),
              Icon(Icons.line_weight, color: Color.fromRGBO(45, 98, 234, 1)),
              Slider(
                thumbColor: Colors.white,
                activeColor: Color.fromRGBO(45, 98, 234, 1),
                inactiveColor: Color.fromRGBO(191, 209, 255, 1),
                value: strokeSize,
                min: 0,
                max: 30,
                onChanged: (val) {
                  ref.read(sizeProvider.notifier).state = val;
                },
              ),
            ],
          ),
          Row(
            children: [
              SizedBox(
                width: 72,
              ),
              IconButton(
                  onPressed: () => undo(),
                  icon: Icon(
                    Icons.undo,
                    color: Color.fromRGBO(45, 98, 234, 1),
                  )),
              SizedBox(
                width: 8,
              ),
              IconButton(
                  onPressed: () => redo(),
                  icon: Icon(
                    Icons.redo,
                    color: Color.fromRGBO(45, 98, 234, 1),
                  ))
            ],
          )
        ],
      ),
    );
  }
}
