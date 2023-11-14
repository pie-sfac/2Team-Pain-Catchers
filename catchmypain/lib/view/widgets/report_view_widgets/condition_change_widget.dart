// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catchmypain/model/condition_model.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/condition_change_card_widget.dart';
import 'package:flutter/material.dart';

class ConditionChangeWidget extends StatelessWidget {
  const ConditionChangeWidget({
    Key? key,
    required this.conditionList,
  }) : super(key: key);
  final List<ConditionModel> conditionList;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Padding(
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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('신주희 회원님의 최근 기분 변화입니다.'),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
              child: SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 150,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 80),
                      child: ConditionChangeCardWidget(
                          imgPath:
                              'asset/images/Emotion_${conditionList[index].condition}_on.png',
                          condition: conditionList[index].condition,
                          cndDate: conditionList[index].date),
                    );
                  },
                  itemCount: conditionList.length,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
