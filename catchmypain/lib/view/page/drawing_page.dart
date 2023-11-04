
// ignore_for_file: prefer_const_constructors

import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:catchmypain/view/widgets/drawing_canvas.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DrawingPage extends ConsumerWidget {
   const DrawingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // colorProvider를 감시하여 현재 Color 상태를 가져옵니다.
    // final selectedColor = ref.watch(colorProvider);
    // final strokeSize = ref.watch(sizeProvider);
    // final allSketches = ref.watch(sketchesProvider); 
    // final currentSketch = ref.watch(sketchProvider);
    bool isMenuOpen = true;

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          icon: Icon(Icons.menu),
          onPressed: () => isMenuOpen,
        ),
        title: Text('Drawing App'),
        centerTitle: true,
      ),
      body: PageView(
        children: [
          Stack(
            children: [
              Container(
                decoration: BoxDecoration(
                    image:
                        DecorationImage(image: AssetImage('assets/sidePlank.jpg'))),
              ),
              Container(
                //color: kCanvasColor,
                width: double.maxFinite,
                height: double.maxFinite,
                child: DrawingCanvas(
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height,
                ),
              ),
              Visibility(
                visible: isMenuOpen,
                child: Positioned(
                  child: Container(
                    color: Colors.white,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
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
                            IconButton(
                              icon: Icon(Icons.circle),
                              onPressed: () {
                                 ref.read(colorProvider.notifier).state = Colors.black;
                              },
                              color: Colors.black,
                            ),
                          ],
                        ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     IconButton(
                        //       icon: Icon(Icons.circle_outlined),
                        //       onPressed: () {
                        //         drawingMode.value = DrawingMode.circle;
                        //       },
                        //     ),
                        //     IconButton(
                        //       icon: Icon(Icons.square_outlined),
                        //       onPressed: () {
                        //         drawingMode.value = DrawingMode.rect;
                        //       },
                        //     ),
                        //     IconButton(
                        //       icon: Icon(Icons.horizontal_rule),
                        //       onPressed: () {
                        //         drawingMode.value = DrawingMode.line;
                        //       },
                        //     ),
                        //     IconButton(
                        //       icon: Icon(Icons.edit),
                        //       onPressed: () {
                        //         drawingMode.value = DrawingMode.pencil;
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     SizedBox(
                        //       width: 8,
                        //     ),
                        //     Icon(Icons.line_weight),
                        //     SizedBox(
                        //       width: 4,
                        //     ),
                        //     Slider(
                        //       thumbColor: Colors.white,
                        //       activeColor: Colors.grey,
                        //       inactiveColor: Colors.grey.withOpacity(0.5),
                        //       value: strokeSize.value,
                        //       min: 0,
                        //       max: 50,
                        //       onChanged: (val) {
                        //         strokeSize.value = val;
                        //       },
                        //     ),
                        //   ],
                        // ),
                        // Row(
                        //   mainAxisSize: MainAxisSize.min,
                        //   children: [
                        //     IconButton(
                        //         onPressed: allSketches.value.isNotEmpty
                        //             ? () => undoRedoStack.value.undo()
                        //             : null,
                        //         icon: Icon(Icons.undo)),
                        //     IconButton(
                        //         onPressed: allSketches.value.isNotEmpty
                        //             ? () => undoRedoStack.value.redo()
                        //             : null,
                        //         icon: Icon(Icons.redo))
                        //   ],
                        // )
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
          Text('빈 페이지'),
        ],
      ),
      // floatingActionButton: Column(
      //   mainAxisAlignment: MainAxisAlignment.end,
      //   children: [
      //     FloatingActionButton(
      //       child: Icon(Icons.refresh),
      //       onPressed: allSketches.value.isNotEmpty
      //           ? () => undoRedoStack.value.clear()
      //           : null,
      //     ),
      //     FloatingActionButton(
      //       child: Icon(Icons.save),
      //       onPressed: () => savedSketches.value = allSketches.value,
      //     ),
      //   ],
      // ),
    );
  }
}