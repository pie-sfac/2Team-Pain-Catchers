import 'dart:io';

import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/view/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:catchmypain/util/utils.dart' as utils;
import 'package:path_provider/path_provider.dart';
import 'package:screenshot/screenshot.dart';

class ExerciseListTileSub extends StatefulWidget {
  const ExerciseListTileSub({
    Key? key,
    required this.exerciseDataList,
    required this.exerciseListTileSubData,
  }) : super(key: key);

  final List<ExerciseData> exerciseDataList;
  final ExerciseData exerciseListTileSubData;

  @override
  State<ExerciseListTileSub> createState() => _ExerciseListTileSubState();
}

class _ExerciseListTileSubState extends State<ExerciseListTileSub> {
  bool onPressCheck = true;
  ScreenshotController screenshotController = ScreenshotController();
  Widget dataTable() {
    return Column(
      children: [
        Table(
          columnWidths: {
            for (var i = 0; i < 11; i++) i: const FractionColumnWidth(1 / 11),
          },
          children: const [
            TableRow(
              children: [
                Text('횟수'),
                Text('상태'),
                Text('시간'),
                Text('왼쪽 팔꿈치'),
                Text('오른쪽 팔꿈치'),
                Text('왼쪽 겨드랑이'),
                Text('오른쪽 겨드랑이'),
                Text('왼쪽 골반'),
                Text('오른쪽 골반'),
                Text('왼쪽 무릎'),
                Text('오른쪽 무릎'),
              ],
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(4.0),
          child: Container(
            height: 1,
            decoration: BoxDecoration(color: Colors.grey.shade400),
          ),
        ),
        SizedBox(
          height: MediaQuery.of(context).size.height * 0.5,
          child: ListView.builder(
            itemCount: widget.exerciseDataList.length,
            itemBuilder: (context, i) {
              if (widget.exerciseDataList[i].recordTime !=
                  widget.exerciseListTileSubData.recordTime) {
                return const SizedBox();
              }

              return Table(
                columnWidths: {
                  for (var i = 0; i < 11; i++)
                    i: const FractionColumnWidth(1 / 11),
                },
                children: [
                  TableRow(
                    children: [
                      Text('${widget.exerciseDataList[i].count}',
                          style: const TextStyle(
                              color: Colors.black, fontSize: 20)),
                      Text(widget.exerciseDataList[i].poseState),
                      Text(widget.exerciseDataList[i].durationTime),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].ltShoulder,
                              widget.exerciseDataList[i].ltElbow,
                              widget.exerciseDataList[i].ltWrist)
                          .toStringAsFixed(1)),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].rtShoulder,
                              widget.exerciseDataList[i].rtElbow,
                              widget.exerciseDataList[i].rtWrist)
                          .toStringAsFixed(1)),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].ltElbow,
                              widget.exerciseDataList[i].ltShoulder,
                              widget.exerciseDataList[i].ltHip)
                          .toStringAsFixed(1)),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].rtElbow,
                              widget.exerciseDataList[i].rtShoulder,
                              widget.exerciseDataList[i].rtHip)
                          .toStringAsFixed(1)),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].ltShoulder,
                              widget.exerciseDataList[i].ltHip,
                              widget.exerciseDataList[i].ltKnee)
                          .toStringAsFixed(1)),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].rtShoulder,
                              widget.exerciseDataList[i].rtHip,
                              widget.exerciseDataList[i].rtKnee)
                          .toStringAsFixed(1)),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].ltHip,
                              widget.exerciseDataList[i].ltKnee,
                              widget.exerciseDataList[i].ltAnkle)
                          .toStringAsFixed(1)),
                      Text(utils
                          .angle(
                              widget.exerciseDataList[i].rtHip,
                              widget.exerciseDataList[i].rtKnee,
                              widget.exerciseDataList[i].rtAnkle)
                          .toStringAsFixed(1)),
                    ],
                  ),
                ],
              );
            },
          ),
        ),
      ],
    );
  }

  Widget dataChart() {
    int? startIndex;
    int? endIndex;

    for (int i = 0; i < widget.exerciseDataList.length; i++) {
      if (widget.exerciseDataList[i].recordTime ==
          widget.exerciseListTileSubData.recordTime) {
        startIndex ??= i;
        endIndex = i;
        continue;
      }
      if (startIndex != null) break;
    }
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Screenshot(
          controller: screenshotController,
          child: ChartWidget(
            usedData:
                widget.exerciseDataList.sublist(startIndex!, endIndex! + 1),
          ),
        ),
        ElevatedButton(
          child: const Text('내보내기'),
          onPressed: () async {
            final imageFile = await screenshotController.capture();
            // 여기서 imageFile을 로컬에 저장하거나 원하는 방식으로 처리할 수 있습니다.
            if (imageFile != null) {
              final directory = await getApplicationDocumentsDirectory();

              // 앱의 문서 디렉터리 경로를 가져옵니다.
              final chartDirectory = Directory('${directory.path}/chart');
              if (!await chartDirectory.exists()) {
                await chartDirectory.create(recursive: true);
              }
              // 파일 이름을 지정하고 경로를 생성합니다.
              final filePath = '${chartDirectory.path}/screenshot.png';
              // 파일을 저장합니다.
              final File file = File(filePath);
              // Uint8List 데이터를 파일로 씁니다.
              await file.writeAsBytes(imageFile);
              // 파일이 저장되었음을 알리는 메시지를 표시합니다.
              print('스크린샷이 저장되었습니다: $filePath');
            } else {
              // 이미지 파일이 캡처되지 않았을 때 처리할 코드를 여기에 추가할 수 있습니다.
              print('스크린샷을 캡처할 수 없습니다.');
            }
          },
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                      onPressed: () {
                        setState(() {
                          onPressCheck = true;
                        });
                      },
                      child: const Text('테이블')),
                  Container(
                    height: 15,
                    width: 1,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  TextButton(
                      onPressed: () {
                        setState(() {
                          onPressCheck = false;
                        });
                      },
                      child: const Text('차트')),
                ],
              ),
            ],
          ),
          onPressCheck ? dataTable() : dataChart(),
        ],
      ),
    );
  }
}
