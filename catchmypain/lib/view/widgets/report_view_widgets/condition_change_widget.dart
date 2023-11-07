import 'package:catchmypain/view/widgets/report_view_widgets/condition_change_card_widget.dart';
import 'package:flutter/material.dart';

class ConditionChangeWidget extends StatelessWidget {
  const ConditionChangeWidget({super.key});

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
                    '컨디션 변화',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Text(
                  '최근 5회',
                  style: TextStyle(color: Colors.grey),
                ),
              ],
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('최상현 회원님의 최근 기분 변화입니다.'),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ConditionChangeCardWidget(
                    imgPath: 'asset/images/Emotion_Bad_on.png',
                    condition: '나쁨',
                    cndDate: '2023.11.07'),
                ConditionChangeCardWidget(
                    imgPath: 'asset/images/Emotion_Good_on.png',
                    condition: '좋음',
                    cndDate: '2023.11.06'),
                ConditionChangeCardWidget(
                    imgPath: 'asset/images/Emotion_Normal_on.png',
                    condition: '보통',
                    cndDate: '2023.11.04'),
                ConditionChangeCardWidget(
                    imgPath: 'asset/images/Emotion_Verybad_on.png',
                    condition: '매우 나쁨',
                    cndDate: '2023.11.02'),
                ConditionChangeCardWidget(
                    imgPath: 'asset/images/Emotion_Verygood_on.png',
                    condition: '매우 좋음',
                    cndDate: '2023.11.01'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
