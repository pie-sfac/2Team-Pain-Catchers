// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catchmypain/controller/changed_font_icon_size.dart';
import 'package:catchmypain/controller/filled_below_curvedLine_draw.dart';
import 'package:catchmypain/model/condition_model.dart';
import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/model/painHistory_model.dart';
import 'package:flutter/material.dart';
import 'package:catchmypain/util/utils.dart' as utils;

// ignore: must_be_immutable
class Chart extends StatelessWidget {
  Chart(
      {Key? key,
      required this.textSpanSize,
      required this.fontSize,
      required this.iconSize,
      required this.usedData,
      required this.containerWidth,
      required this.containerHeight,
      required this.labelCheck,
      required this.filledCheck,
      required this.lineCheck,
      required this.yLength,
      this.reversedList,
      this.moodsToInt,
      this.dataNum})
      : super(key: key);
  Size textSpanSize;
  final double fontSize;
  final double iconSize; //y축 아이콘의 사이즈와 차트위에 아이콘의 사이즈 동일하게 하기
  //가져온 데이터
  final List<dynamic> usedData;
  final double containerWidth;
  final double containerHeight;
  final bool labelCheck; //checkboxState.labelCheck
  final bool filledCheck;
  final bool lineCheck;
  final double yLength; //moods.length
  final List<double>? reversedList;
  Map<String, dynamic>? moodsToInt;
  int? dataNum;

  @override
  Widget build(BuildContext context) {
    var chartData;
    // print('1 textSpanSize : ${textSpanSize}');
    // print(fontSize);
    // print(iconSize);
    // print(usedData);
    // print(containerWidth);
    // print(containerHeight);
    // print(labelCheck);
    // print(yLength);
    // print(usedData.runtimeType);

    return Stack(
      children: [
        Container(
          width: containerWidth,
          height: containerHeight,
          color: Colors.black12,
        ),
        CustomPaint(
          size: Size(containerWidth, containerHeight),
          painter: FilledBelowCurvedPainter(usedData, yLength, reversedList,
              iconSize, dataNum!, filledCheck, lineCheck),
        ),
        //... : 스프레드 연산자. 컬렉션의 항목들을 개별 항목으로 확장하고, 주로 리스트나 다른 컬렉션 내에 다른 컬렉션의 항목들을 포함시킬 때 사용
        ...usedData
            .asMap()
            .entries
            .where((item) => item.key < dataNum!)
            .map((item) {
          if (item.value is PainHistoryModel) {
            chartData = item.value.level;
            print('chartData(angles.leftWES) : ${chartData}');
          } else if (item.value is ConditionModel) {
            chartData = item.value.condition;
          } else if (item.value is ExerciseData) {
            chartData = double.parse(utils
                .angle(item.value.ltShoulder, item.value.ltElbow,
                    item.value.ltWrist)
                .toStringAsFixed(1));
            print('chartData(angles.leftWES) : ${chartData}');
          }

          //item.value.runtimeType : _$36PainHistoryModelImpl
          //_$36PainHistoryModelImpl 타입은 PainHistoryModel 타입과 정확히 같지 않습니다
          //PainHistoryModel 인터페이스를 구현하지만, 실제로는 다른 타입
          //따라서 is 키워드를 사용하여 객체가 특정 타입의 인스턴스인지를 확인
          double level = item.value is ConditionModel
              ? moodsToInt![chartData].toDouble()
              : chartData.toDouble();
          double topPosition = 0;
          double leftPosition = 0;
          textSpanSize = TextSizeControl().textSize(
              item.value is ConditionModel ? chartData : chartData.toString(),
              TextStyle(fontSize: fontSize));
          print('textSpanSize : ${textSpanSize}');

          //범례가 아이콘일 때
          if (item.value is ConditionModel) {
            if (labelCheck == true) {
              topPosition = containerHeight -
                  (level * (containerHeight / yLength)) +
                  (containerHeight / yLength) / 2 -
                  iconSize / 2 -
                  textSpanSize.height;
              leftPosition = (containerWidth / usedData.length) *
                      item.key + //item.key : index
                  (containerWidth / usedData.length) / 2 -
                  textSpanSize.width / 2;
            } else {
              topPosition = containerHeight -
                  (level * (containerHeight / yLength)) +
                  (containerHeight / yLength) / 2 -
                  iconSize / 2;
              leftPosition = (containerWidth / usedData.length) *
                      item.key + //item.key : index
                  (containerWidth / usedData.length) / 2 -
                  iconSize / 2; //아이콘의 중심을 해당 위치로 옮기기위해
            }
          }
          //범례가 텍스트일 때
          else {
            var interHeight = (reversedList![0] - reversedList![1]);
            if (labelCheck == true) {
              topPosition = containerHeight -
                  containerHeight /
                      (reversedList!.first -
                          (reversedList!.last - interHeight)) *
                      (level - (reversedList!.last - interHeight)) -
                  // (level * (containerHeight / yLength)) -
                  textSpanSize.height;
              leftPosition = (containerWidth / usedData.take(dataNum!).length) *
                      item.key + //item.key : index
                  (containerWidth / usedData.take(dataNum!).length) / 2 -
                  (textSpanSize.width > iconSize
                      ? textSpanSize.width / 2
                      : iconSize / 2);
            } else {
              topPosition = containerHeight -
                  containerHeight /
                      (reversedList!.first -
                          (reversedList!.last - interHeight)) *
                      (level - (reversedList!.last - interHeight));
              leftPosition = (containerWidth / usedData.take(dataNum!).length) *
                      item.key + //item.key : index
                  (containerWidth / usedData.take(dataNum!).length) / 2 -
                  iconSize / 2;
            }
            print('topposition : ${topPosition}');
            print('leftPosition : ${leftPosition}');
          }

          // print(iconSize);
          return Positioned(
            left: leftPosition,
            top: topPosition,
            child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                mainAxisSize: MainAxisSize.min,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  labelCheck == true
                      ? Text(
                          item.value is ConditionModel
                              ? chartData
                              : chartData.toString(),
                          style: TextStyle(fontSize: fontSize),
                        )
                      : const SizedBox(),
                  Icon(
                    Icons.circle,
                    color: Colors.amber,
                    size: iconSize,
                  )
                ]),
          );
        }).toList(),
      ],
    );
  }
}
