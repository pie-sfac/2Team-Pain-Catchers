// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catchmypain/model/exercisedata.dart';
import 'package:flutter/material.dart';

class ExerciseListTile extends StatelessWidget {
  const ExerciseListTile({
    Key? key,
    required this.exerciseListTileData,
  }) : super(key: key);

  final ExerciseData exerciseListTileData;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: MediaQuery.of(context).size.height * 0.1,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  '횟수',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                ),
                Text(
                  '${exerciseListTileData.count}',
                  style: const TextStyle(fontSize: 24),
                ),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('지속시간'),
                Text('${exerciseListTileData.angles.durationTime} 초'),
              ],
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('운동 시간'),
                    Text(exerciseListTileData.recordTime),
                  ],
                ),
                const SizedBox(
                  width: 50,
                ),
                const Icon(
                  Icons.arrow_drop_down_rounded,
                  size: 30,
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
