import 'package:flutter/material.dart';

class LinePainter extends CustomPainter {
  final List<dynamic> chartData;
  final double containerHeight;
  final int levelLenth;
  final double iconSize;
  Map<String, dynamic> moodsToInt = {
    'VERY_BAD': 1,
    'BAD': 2,
    'NORMAL': 3,
    'GOOD': 4,
    'VERY_GOOD': 5
  };

  LinePainter(
      this.chartData, this.containerHeight, this.levelLenth, this.iconSize);

  //level 반환 : painHistory data
  //condition 반환 : condition data
  String checkData(List<dynamic> chartData) {
    if (chartData[0].containsKey('level')) {
      return 'level';
    } else if (chartData[0].containsKey('condition')) {
      return 'condition';
    }
    return ''; // 기본값을 반환합니다. 필요에 따라 다른 값을 설정할 수 있습니다.
  }

  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.amber
      ..strokeWidth = 2.0;

    String keyData = chartData.isNotEmpty ? checkData(chartData) : '';

    switch (keyData) {
      //painHistory data
      case 'level':
        for (int i = 0; i < chartData.length - 1; i++) {
          double startX = (size.width / chartData.length) * i +
              (size.width / chartData.length) / 2;
          double startY = containerHeight -
              (chartData[i]['level'].toDouble() *
                  (containerHeight / levelLenth)) +
              iconSize / 2; //아이콘의 중심에 선 위치
          double endX = (size.width / chartData.length) * (i + 1) +
              (size.width / chartData.length) / 2;
          double endY = containerHeight -
              (chartData[i + 1]['level'].toDouble() *
                  (containerHeight / levelLenth)) +
              iconSize / 2; //아이콘의 중심에 선 위치

          canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
        }
        break;
      //condition data
      case 'condition':
        for (int i = 0; i < chartData.length - 1; i++) {
          double startX = (size.width / chartData.length) * i +
              (size.width / chartData.length) / 2;
          double startY = containerHeight -
              (moodsToInt[chartData[i]['condition']] *
                  (containerHeight / levelLenth)) +
              (containerHeight / levelLenth) / 2; //아이콘의 중심에 선 위치
          double endX = (size.width / chartData.length) * (i + 1) +
              (size.width / chartData.length) / 2;
          double endY = containerHeight -
              (moodsToInt[chartData[i + 1]['condition']] *
                  (containerHeight / levelLenth)) +
              (containerHeight / levelLenth) / 2; //아이콘의 중심에 선 위치

          canvas.drawLine(Offset(startX, startY), Offset(endX, endY), paint);
        }
        break;
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
