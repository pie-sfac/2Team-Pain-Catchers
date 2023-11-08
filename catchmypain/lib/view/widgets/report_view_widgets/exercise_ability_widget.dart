import 'package:catchmypain/view/widgets/report_view_widgets/exercise_ability_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExerciseAbilityWidget extends StatelessWidget {
  const ExerciseAbilityWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: const Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Icon(Icons.circle, color: Colors.blue, size: 10),
                SizedBox(width: 10),
                Expanded(
                  child: Text(
                    '운동 능력 평가',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('신주희 회원님의 최근 운동 기록입니다.'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ExerciseAbilityCardWidget(
                    abilityType: '차트',
                    imgPath: 'asset/images/exercise_chart.png'),
                ExerciseAbilityCardWidget(
                  imgPath: 'asset/images/exercise_table.png',
                  abilityType: '테이블',
                ),
                ExerciseAbilityCardWidget(
                  imgPath: 'asset/images/paint_user.png',
                  abilityType: '사진',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
