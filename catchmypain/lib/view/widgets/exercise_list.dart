import 'package:catchmypain/view/widgets/exercise_card.dart';
import 'package:flutter/material.dart';

class ExerciseListWidget extends StatelessWidget {
  const ExerciseListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> exerciseList = ['push_up', 'squat'];
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
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
      ],
    );
  }
}
