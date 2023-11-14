import 'package:catchmypain/controller/changed_font_icon_size.dart';
import 'package:catchmypain/controller/yRange.dart';
import 'package:catchmypain/view/widgets/chart_data_widget.dart';
import 'package:flutter/material.dart';

class ChartWidget extends StatelessWidget {
  final List<dynamic> usedData;

  const ChartWidget({
    Key? key,
    required this.usedData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double fontSize = 10;
    double iconSize = 0;
    double sizedBoxWidth = 0;
    int dataNum = usedData.length;
    List<double> reversedLevels = YRange().findMinMaxExer(usedData, dataNum);
    double containerWidth = MediaQuery.of(context).size.width * 0.8;
    double containerHeight = MediaQuery.of(context).size.height * 0.5;

    //텍스트의 높이와 아이콘 사이즈를 동일하게 설정
    if (usedData.isNotEmpty) {
      Size textSpanSize = TextSizeControl().textSize(
          reversedLevels[0].toString(), TextStyle(fontSize: fontSize));
      iconSize = textSpanSize.height;
      //y축 범례 너비 설정
      sizedBoxWidth = textSpanSize.width + 5;
    }

    return Column(
      children: [
        Row(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              _buildYAxis(
                  reversedLevels, sizedBoxWidth, containerHeight, fontSize),
              const SizedBox(
                width: 8,
              ),
              // _buildChart(),
              Chart(
                fontSize: fontSize,
                iconSize: iconSize,
                usedData: usedData,
                containerWidth: containerWidth,
                containerHeight: containerHeight,
                labelCheck: true,
                filledCheck: true,
                lineCheck: true,
                yLength: reversedLevels.length.toDouble(),
                reversedList: reversedLevels,
                // moodsToInt: null,
                dataNum: dataNum,
                exerciseCount: false,
              ),
            ]),
        Padding(
            padding: EdgeInsets.only(left: sizedBoxWidth, top: 8),
            child: _buildXAxis(containerWidth, dataNum, fontSize)),
      ],
    );
  }

  Widget _buildYAxis(List<double> reversedLevels, double sizedBoxWidth,
      double containerHeight, double fontSize) {
    // Y축 UI 구현
    return SizedBox(
      width: sizedBoxWidth,
      height: containerHeight,
      child: ListView.builder(
        itemExtent: containerHeight / reversedLevels.length,
        itemCount: reversedLevels.length,
        itemBuilder: (context, index) {
          return Text(
            reversedLevels[index].toString(),
            style: TextStyle(fontSize: fontSize),
          );
        },
      ),
    );
  }

  // Widget _buildChart() {
  //   // 그래프 UI 구현
  //   return Container(
  //     width: containerWidth,
  //     height: containerHeight,
  //     // 그래프 위젯 구현
  //     // 예: CustomPaint 또는 Stack
  //   );
  // }

  Widget _buildXAxis(double containerWidth, int dataNum, double fontSize) {
    // X축 UI 구현
    return SizedBox(
        height: 45,
        width: containerWidth,
        child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemExtent: (containerWidth) / (dataNum),
          itemCount: dataNum,
          itemBuilder: (context, index) {
            {
              if (index % 40 == 0) {
                return OverflowBox(
                  minWidth: 0.0,
                  maxWidth: double.infinity,
                  alignment: Alignment.centerLeft,
                  child: Text(
                    usedData[index].durationTime,
                    style: TextStyle(fontSize: fontSize),
                  ),
                );
              }
              return SizedBox();
            }
          },
        ));
  }
}
