import 'package:catchmypain/model/exercisedata.dart';
import 'package:flutter/material.dart';
import 'package:catchmypain/util/utils.dart' as utils;

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
                  TextButton(onPressed: () => {}, child: const Text('테이블')),
                  Container(
                    height: 15,
                    width: 1,
                    decoration: const BoxDecoration(color: Colors.grey),
                  ),
                  TextButton(onPressed: () => {}, child: const Text('차트')),
                ],
              ),
            ],
          ),
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
      ),
    );
  }
}
