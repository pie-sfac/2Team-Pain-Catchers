// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catchmypain/model/exercisedata.dart';
import 'package:flutter/material.dart';

class ExerciseListTileSub extends StatelessWidget {
  const ExerciseListTileSub({
    Key? key,
    required this.exerciseDataList,
    required this.exerciseListTileSubData,
  }) : super(key: key);

  final List<ExerciseData> exerciseDataList;
  final ExerciseData exerciseListTileSubData;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
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
              itemCount: exerciseDataList.length,
              itemBuilder: (context, i) {
                if (exerciseDataList[i].recordTime !=
                    exerciseListTileSubData.recordTime) {
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
                        Text('${exerciseDataList[i].count}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20)),
                        Text(exerciseDataList[i].poseState),
                        Text(exerciseDataList[i].angles.durationTime),
                        Text('${exerciseDataList[i].angles.leftWES}'),
                        Text('${exerciseDataList[i].angles.rightWES}'),
                        Text('${exerciseDataList[i].angles.leftESH}'),
                        Text('${exerciseDataList[i].angles.rightESH}'),
                        Text('${exerciseDataList[i].angles.leftSHK}'),
                        Text('${exerciseDataList[i].angles.rightSHK}'),
                        Text('${exerciseDataList[i].angles.leftHKA}'),
                        Text('${exerciseDataList[i].angles.rightHKA}'),
                      ],
                    ),
                  ],
                );
              },
            ),
          )
        ],
      ),
    );
  }
}
