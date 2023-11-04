import 'package:catchmypain/model/condition_model.dart';
import 'package:catchmypain/provider/api_provider.dart';
import 'package:catchmypain/provider/page_provider.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:catchmypain/painter/line_painter.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid().v4(); //랜덤으로 uuid v4형식으로 생성

// class ChartPage extends StatelessWidget {
//   const ChartPage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(
//       body: Center(
//         child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [Text('It is ChartPage')]),
//       ),
//     );
//   }
// }

// class ExerciseCameraPage extends ConsumerWidget {
//   const ExerciseCameraPage({
//     Key? key,
//   }) : super(key: key);

// class ChartPage extends StatefulWidget {
//   const ChartPage({super.key});

//   @override
//   State<ChartPage> createState() => _ChartPageState();
// }

class ChartPage extends ConsumerWidget {
  const ChartPage({
    Key? key,
  }) : super(key: key);

  // void getData() async {
  //   print(uuid);
  //   var res = await dio.get(url);
  //   try {
  //     if (res.statusCode == 200) {
  //       memberName = res.data['member']['name'];
  //       condition = res.data['condition']['items'];
  //       print(res.data['member']['name']);
  //       print(condition);
  //       // findMinMaxmoods(condition);
  //     }
  //   } catch (e) {
  //     print('오류 : $e');
  //   }
  //   setState(() {});
  // }

  //텍스트 영역 크기
  //텍스트 영역의 크기와 icon의 크기를 동일하게 하기 위해
  Size textSize(String text, TextStyle style) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return painter.size;
  }

  // @override
  // void initState() {
  //   super.initState();
  //   getData();
  // }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // var url = 'https://flutterapi.tykan.me/personal-reports/$uuid';
    // var dio = Dio();
    var memberName = '';
    Size? textSpanSize;
    double fontSize = 15;
    double iconSize = 0; //y축 아이콘의 사이즈와 차트위에 아이콘의 사이즈 동일하게 하기
    double sizedBoxWidth = 0;
    //가져온 데이터
    List<ConditionModel> condition = [];
    //y축
    List<IconData> moods = [
      Icons.mood,
      Icons.sentiment_satisfied,
      Icons.sentiment_neutral,
      Icons.sentiment_dissatisfied,
      Icons.mood_bad,
    ];
    Map<String, dynamic> moodsToInt = {
      'VERY_BAD': 1,
      'BAD': 2,
      'NORMAL': 3,
      'GOOD': 4,
      'VERY_GOOD': 5
    };

    final int chartIndex = ref.watch(chartIndexProvider) as int;
    // // `reportProvider`로부터 데이터 가져오기
    final reportDataAsyncValue = ref.watch(
        reportProvider(uuid)); // 여기서 report의 타입은 AsyncValue<ApiResponse> 입니다.
    print('reportDataAsyncValue: ${reportDataAsyncValue.value}');

    double containerWidth = MediaQuery.of(context).size.width * 0.8;
    double containerHeight = MediaQuery.of(context).size.width * 0.5;

    return reportDataAsyncValue.when(
        loading: () => CircularProgressIndicator(), // 로딩 중 상태 UI
        error: (error, stack) => Text('Error: $error'), // 에러 상태 UI
        data: (report) {
          memberName = report.member.name;
          condition = report.condition;
          print(memberName);
          print(condition);

          //x축 텍스트의 높이와 아이콘 사이즈를 동일하게 설정
          if (textSpanSize == null && condition.isNotEmpty) {
            textSpanSize =
                textSize(condition[0].date, TextStyle(fontSize: fontSize));
            iconSize = textSpanSize!.height;
            //y축 범례 너비 설정
            sizedBoxWidth = iconSize + 5;
          }

          // 데이터가 준비되었을 때 UI
          return Scaffold(
            body: chartIndex == 1
                ? Center(
                    child: Padding(
                        padding: const EdgeInsets.all(8),
                        child: Column(children: [
                          Row(mainAxisSize: MainAxisSize.min, children: [
                            //y축
                            SizedBox(
                              width: sizedBoxWidth,
                              height: containerHeight,
                              child: ListView.builder(
                                itemExtent: containerHeight / moods.length,
                                itemCount: moods.length,
                                itemBuilder: (context, index) {
                                  print(containerHeight / moods.length);
                                  print('containerHeight: $containerHeight');
                                  return Icon(
                                    moods[index],
                                    size: iconSize,
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              width: 8,
                            ),
                            //그래프
                            Stack(
                              children: [
                                Container(
                                  width: containerWidth,
                                  height: containerHeight,
                                  color: Colors.black12,
                                ),
                                CustomPaint(
                                  size: Size(containerWidth, containerHeight),
                                  painter: LinePainter(condition,
                                      containerHeight, moods.length, iconSize),
                                ),
                                //... : 스프레드 연산자. 컬렉션의 항목들을 개별 항목으로 확장하고, 주로 리스트나 다른 컬렉션 내에 다른 컬렉션의 항목들을 포함시킬 때 사용
                                ...condition.asMap().entries.map((item) {
                                  double level =
                                      moodsToInt[item.value.condition];
                                  double topPosition = containerHeight -
                                      (level *
                                          (containerHeight / moods.length));
                                  double leftPosition =
                                      (containerWidth / condition.length) *
                                          item.key; //item.key : index

                                  print(iconSize);
                                  return Positioned(
                                    left: leftPosition +
                                        (containerWidth / condition.length) /
                                            2 -
                                        iconSize / 2, //아이콘의 중심을 해당 위치로 옮기기위해
                                    top: topPosition +
                                        (containerHeight / moods.length) / 2 -
                                        iconSize / 2,
                                    child: Icon(
                                      Icons.circle,
                                      color: Colors.amber,
                                      size: iconSize,
                                    ),
                                  );
                                }).toList(),
                              ],
                            )
                          ]),
                          //x축
                          Padding(
                              padding:
                                  EdgeInsets.only(left: sizedBoxWidth, top: 8),
                              child: SizedBox(
                                  height: 45,
                                  width: containerWidth,
                                  child: ListView.builder(
                                    scrollDirection: Axis.horizontal,
                                    itemExtent:
                                        (containerWidth) / condition.length,
                                    itemCount: condition.length,
                                    itemBuilder: (context, index) => Center(
                                        child: Text(
                                      condition[index].date,
                                      style: TextStyle(fontSize: fontSize),
                                    )),
                                  )))
                        ])),
                  )
                : Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('It is ChartPage')]),
                  ),
          );
        });
  }
}
