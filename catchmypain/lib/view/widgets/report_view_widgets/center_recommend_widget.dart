import 'package:catchmypain/view/widgets/report_view_widgets/center_recommend_card_widget.dart';
import 'package:flutter/material.dart';

class CenterRecommendWdiget extends StatelessWidget {
  const CenterRecommendWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    '센터 추천 링크',
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
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            padding: const EdgeInsets.all(20),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(251, 251, 251, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(128, 128, 128, 1)
                      .withOpacity(0.5), // Shadow color
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // Changes position of shadow
                ),
              ],
            ),
            child: GridView(
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
              children: const [
                CenterRecommendCardWidget(
                  imgPath: 'asset/images/center_recommend_1.png',
                  recommendTxt: '다리 스트레칭 이렇게 하면 간편하게!',
                ),
                CenterRecommendCardWidget(
                    imgPath: 'asset/images/center_recommend_2.png',
                    recommendTxt: '허리가 안좋다면 회사에서 이런 자세로 스트레칭을 해보세요!'),
                CenterRecommendCardWidget(
                    imgPath: 'asset/images/center_recommend_3.png',
                    recommendTxt: '어깨 운동에 좋은 운동은 이것입니다!'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
