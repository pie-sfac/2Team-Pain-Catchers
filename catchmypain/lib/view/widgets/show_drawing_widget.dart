import 'dart:convert';
import 'dart:io';
import 'package:catchmypain/api/getlocaldata.dart';
import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:catchmypain/model/sketch.dart';
import 'package:path_provider/path_provider.dart';

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
        FutureBuilder(
          future: GetLocalData.getPoseImgFilePath(),
          builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                final file = File(snapshot.data!);
                return FutureBuilder<bool>(
                  future: file.exists(),
                  builder:
                      (BuildContext context, AsyncSnapshot<bool> fileSnapshot) {
                    if (fileSnapshot.connectionState == ConnectionState.done) {
                      if (fileSnapshot.hasData && fileSnapshot.data == true) {
                        // 파일이 존재할 경우 이미지를 표시합니다.
                        return Image.file(
                          file,
                          width: MediaQuery.of(context).size.width * 0.85,
                          height: MediaQuery.of(context).size.height * 0.75,
                        );
                      } else {
                        // 파일이 존재하지 않을 경우 메시지를 표시합니다.
                        return const Text('파일을 찾을 수 없습니다.');
                      }
                    }
                    // 파일 존재 여부 확인 중
                    return const CircularProgressIndicator();
                  },
                );
              } else if (snapshot.hasError) {
                return Text('Error: ${snapshot.error}');
              }
            }
            // 경로 가져오는 중
            return const CircularProgressIndicator();
          },
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
