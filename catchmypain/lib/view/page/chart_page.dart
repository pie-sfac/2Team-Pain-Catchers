import 'package:catchmypain/controller/changed_font_icon_size.dart';
import 'package:catchmypain/controller/yRange.dart';
import 'package:catchmypain/model/condition_model.dart';
import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/model/painHistory_model.dart';
import 'package:catchmypain/provider/api_provider.dart';
import 'package:catchmypain/provider/checkbox_lebel.dart';
import 'package:catchmypain/provider/exercise_record_provider.dart';
import 'package:catchmypain/provider/page_provider.dart';
import 'package:catchmypain/provider/read_file_provider.dart';
import 'package:catchmypain/view/widgets/chart_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:uuid/uuid.dart';

final uuid = const Uuid().v4(); //랜덤으로 uuid v4형식으로 생성

class ChartPage extends ConsumerStatefulWidget {
  const ChartPage({Key? key}) : super(key: key);

  @override
  ConsumerState<ChartPage> createState() => _ChartPageState();
}

class _ChartPageState extends ConsumerState<ChartPage> {
  var memberName = '';
  Size? textSpanSize;
  double fontSize = 15;
  double iconSize = 0; //y축 아이콘의 사이즈와 차트위에 아이콘의 사이즈 동일하게 하기
  double sizedBoxWidth = 0;
  double fontSizeContainerWidth = 110;
  //가져온 데이터
  List<dynamic> usedData = [];
  List<ConditionModel> condition = [];
  List<PainHistoryModel> painHistory = [];
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
  double minLevel = 0;
  double maxLevel = 0;
  List<double> levels = []; //y축 범위
  List<double> reversedLevels = [];
  int dataNum = 10; //가져온 운동데이터 사용 개수

  void _handleTextChange(String value) {
    setState(() {
      fontSize = value.isNotEmpty ? double.parse(value) : 15;
      iconSize = TextSizeControl().iconSize(
          usedData[0] is ExerciseData
              ? usedData[0].durationTime
              : usedData[0].date,
          value);
      sizedBoxWidth = usedData[0] is PainHistoryModel
          ? TextSizeControl()
                  .textSize(reversedLevels[0].toString(),
                      TextStyle(fontSize: fontSize))
                  .width +
              5
          : iconSize + 8;
    });
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final int chartIndex = ref.watch(chartIndexProvider) as int;
    // `reportProvider`로부터 데이터 가져오기
    final reportDataAsyncValue = ref.watch(
        reportProvider(uuid)); // 여기서 report의 타입은 AsyncValue<ApiResponse> 입니다.
    //로컬데이터 읽어옴
    // AsyncValue<List<ExerciseData>> fileContent = ref.watch(fileContentProvider);
    //hive 데이터베이스
    //운동 영상 모든 데이터
    AsyncValue<List<ExerciseData>> exerciseDataAsyncValue =
        ref.watch(exerciseDataProvider);
    //각 운동 영상 기록의 마지막 데이터의 리스트
    AsyncValue<List<ExerciseData>> stdExerciseDataAsyncValue =
        ref.watch(stdExerciseDataProvider);

    print('reportDataAsyncValue: ${reportDataAsyncValue.value}');
    print('exerciseDataAsyncValue: ${exerciseDataAsyncValue.value}');
    print(
        'stdExerciseDataAsyncValue: ${stdExerciseDataAsyncValue.value!.first.durationTime}');
    bool labelCheckboxState = ref.watch(checkboxProvider);
    bool filledCheckboxState = ref.watch(filledProvider);
    bool lineCheckboxState = ref.watch(lineProvider);

    double containerWidth = MediaQuery.of(context).size.width * 0.8;
    double containerHeight = MediaQuery.of(context).size.height * 0.7;

    Widget dataWidget() {
      //텍스트의 높이와 아이콘 사이즈를 동일하게 설정
      if (usedData.isNotEmpty) {
        textSpanSize = TextSizeControl().textSize(
            [0, 2].contains(chartIndex)
                ? reversedLevels[0].toString()
                : usedData[0].date,
            TextStyle(fontSize: fontSize));
        iconSize = textSpanSize!.height;
        //y축 범례 너비 설정
        sizedBoxWidth = [0, 2].contains(chartIndex)
            ? textSpanSize!.width + 5
            : iconSize + 5;
        print('sizedBoxWidth : ${sizedBoxWidth}');
      }

      // 데이터가 준비되었을 때 UI
      return Scaffold(
          body: Center(
              child: Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(children: [
                    Row(
                        mainAxisSize: MainAxisSize.min,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          //y축
                          SizedBox(
                            width: sizedBoxWidth,
                            height: containerHeight,
                            child: ListView.builder(
                              itemExtent: [0, 2].contains(chartIndex)
                                  ? containerHeight / reversedLevels.length
                                  : containerHeight / moods.length,
                              itemCount: [0, 2].contains(chartIndex)
                                  ? reversedLevels.length
                                  : moods.length,
                              itemBuilder: (context, index) {
                                print(containerHeight / moods.length);
                                print('containerHeight: $containerHeight');
                                return [0, 2].contains(chartIndex)
                                    ? Text(
                                        reversedLevels[index].toString(),
                                        style: TextStyle(fontSize: fontSize),
                                      )
                                    : Icon(
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
                          Chart(
                            fontSize: fontSize,
                            iconSize: iconSize,
                            usedData: usedData,
                            containerWidth: containerWidth,
                            containerHeight: containerHeight,
                            labelCheck: labelCheckboxState,
                            filledCheck: filledCheckboxState,
                            lineCheck: lineCheckboxState,
                            yLength: [0, 2].contains(chartIndex)
                                ? reversedLevels.length.toDouble()
                                : moods.length.toDouble(),
                            reversedList: [0, 2].contains(chartIndex)
                                ? reversedLevels
                                : null,
                            moodsToInt:
                                [0, 2].contains(chartIndex) ? null : moodsToInt,
                            dataNum: dataNum,
                          ),
                          //글자 크기, 라벨 설정
                          Container(
                              padding: const EdgeInsets.only(left: 8),
                              width: fontSizeContainerWidth,
                              height: 230,
                              child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    TextField(
                                      onChanged: _handleTextChange,
                                      decoration: InputDecoration(
                                        floatingLabelAlignment:
                                            FloatingLabelAlignment.center,
                                        hintText: '글자 크기(15)',
                                        hintStyle: TextStyle(fontSize: 11),
                                        border: OutlineInputBorder(
                                          // 테두리 스타일 설정
                                          borderRadius: BorderRadius.circular(
                                              10.0), // 둥근 모서리 설정
                                          borderSide: BorderSide(
                                              color: Colors.blue), // 테두리 색상 설정
                                        ),
                                      ),
                                    ),
                                    Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                            value: labelCheckboxState,
                                            onChanged: (bool? value) {
                                              if (value != null) {
                                                ref
                                                    .read(checkboxProvider
                                                        .notifier)
                                                    .state = value;
                                              }
                                            },
                                          ),
                                          Text('라벨표시')
                                        ]),
                                    Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                            value: filledCheckboxState,
                                            onChanged: (bool? value) {
                                              if (value != null) {
                                                ref
                                                    .read(
                                                        filledProvider.notifier)
                                                    .state = value;
                                              }
                                            },
                                          ),
                                          Text('선밑 색')
                                        ]),
                                    Row(
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Checkbox(
                                            value: lineCheckboxState,
                                            onChanged: (bool? value) {
                                              if (value != null) {
                                                ref
                                                    .read(lineProvider.notifier)
                                                    .state = value;
                                              }
                                            },
                                          ),
                                          Text('직선')
                                        ]),
                                  ]))
                        ]),
                    //x축
                    Padding(
                        padding: EdgeInsets.only(left: sizedBoxWidth, top: 8),
                        child: SizedBox(
                            height: 45,
                            width: containerWidth + fontSizeContainerWidth,
                            child: ListView.builder(
                              scrollDirection: Axis.horizontal,
                              itemExtent: (containerWidth) /
                                  (chartIndex == 2 ? dataNum : usedData.length),
                              itemCount:
                                  chartIndex == 2 ? dataNum : usedData.length,
                              itemBuilder: (context, index) => Center(
                                  child: Text(
                                chartIndex < 2
                                    ? usedData[index].date
                                    : usedData[index].durationTime,
                                style: TextStyle(fontSize: fontSize),
                              )),
                            )))
                  ]))));
    }

    if (chartIndex < 2) {
      return reportDataAsyncValue.when(
          loading: () => CircularProgressIndicator(), // 로딩 중 상태 UI
          error: (error, stack) => Text('Error: $error'), // 에러 상태 UI
          data: (report) {
            memberName = report.member.name;
            condition = report.condition;
            painHistory = report.painHistory;
            usedData = chartIndex == 0 ? painHistory : condition;
            if (usedData.length != 0) {
              //범례 범위 리스트(역순)
              reversedLevels = YRange().findMinMaxLevels(painHistory);
              return dataWidget();
            }

            return Center(
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [Text('No Data')]),
            );
          });
    } else {
      return exerciseDataAsyncValue.when(
          loading: () => CircularProgressIndicator(), // 로딩 중 상태 UI
          error: (error, stack) => Text('Error: $error'), // 에러 상태 UI
          data: (exerciseDataList) {
            return stdExerciseDataAsyncValue.when(
                loading: () => CircularProgressIndicator(), // 로딩 중 상태 UI
                error: (error, stack) => Text('Error: $error'), // 에러 상태 UI
                data: (stdExerciseDataList) {
                  usedData = exerciseDataList;

                  if (usedData.length != 0) {
                    //범례 범위 리스트(역순)
                    reversedLevels = YRange().findMinMaxExer(usedData, dataNum);
                    print('reversedLevels : ${reversedLevels}');
                    return dataWidget();
                  }
                  return Center(
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [Text('No Data')]),
                  );
                });
          });
    }
  }
}
