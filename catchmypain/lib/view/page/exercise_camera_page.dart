// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/provider/page_provider.dart';
import 'package:catchmypain/provider/preferences_provider.dart';
import 'package:catchmypain/view/widgets/exercise_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseCameraPage extends ConsumerWidget {
  const ExerciseCameraPage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int cameraMenuIndex = ref.watch(cameraIndexProvider) as int;
    List<String> exerciseList = ['push_up', 'squat'];
    List<ExerciseData> exerciseDataList = [];

    String? pushUpData =
        ref.read(preferencesNotifierProvider.notifier).getString('pushupData');
    if (pushUpData == null) {
    } else {
      var sharedData = jsonDecode(pushUpData);
      if (sharedData != null) {
        for (var item in sharedData) {
          var data = ExerciseData.fromJson(item);
          exerciseDataList.add(data);
          print(data.count);
        }
      }
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (cameraMenuIndex == 0) ...[
              const SizedBox(
                height: 10,
              ),
              const Text(
                '운동 목록',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              const SizedBox(
                height: 10,
              ),
              SizedBox(
                height: 250,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: exerciseList.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: SizedBox(
                        height: 200,
                        width: 200,
                        child: ExerciseCard(
                          exercise: exerciseList[index],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ] else if (cameraMenuIndex == 1) ...[
              const SizedBox(
                height: 10,
              ),
              const Text(
                '푸시업',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(
                  height: MediaQuery.of(context).size.height * 0.725,
                  child: ListView.builder(
                    itemCount: exerciseDataList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'count : ${exerciseDataList[index].count}',
                            style: const TextStyle(
                                color: Colors.black, fontSize: 20),
                          ),
                          Text(
                              'poseState : ${exerciseDataList[index].poseState}'),
                          Text(
                              'recordTime : ${exerciseDataList[index].recordTime}'),
                          Text(
                              'leftWES : ${exerciseDataList[index].angles.leftWES}'),
                          Text(
                              'rightWES : ${exerciseDataList[index].angles.rightWES}'),
                        ],
                      );
                    },
                  ))
            ]
          ],
        ),
      ),
    );
  }
}
