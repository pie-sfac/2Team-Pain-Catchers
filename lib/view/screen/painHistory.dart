import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:uuid/uuid.dart';

final uuid = Uuid().v4(); //랜덤으로 uuid v4형식으로 생성

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var url = 'https://flutterapi.tykan.me/personal-reports/$uuid';
  var dio = Dio();
  var memberName = '';
  List<dynamic> painHistory = [];
  double minLevel = 0;
  double maxLevel = 0;
  List<double> levels = [];
  List<double> reversedNumbers = [];

  void getData() async {
    print(uuid);
    var res = await dio.get(url);
    try {
      if (res.statusCode == 200) {
        memberName = res.data['member']['name'];
        painHistory = res.data['painHistory']['items'];
        print(res.data['member']['name']);
        print(painHistory);
        findMinMaxLevels(painHistory);
      }
    } catch (e) {
      print('오류 : $e');
    }
    setState(() {});
  }

  findMinMaxLevels(List<dynamic> history) {
    if (history.isEmpty) {
      return null;
    }

    minLevel = history[0]["level"].toDouble();
    maxLevel = history[0]["level"].toDouble();

    for (var entry in history) {
      int level = entry["level"];
      if (level < minLevel) {
        minLevel = level.toDouble();
      }
      if (level > maxLevel) {
        maxLevel = level.toDouble();
      }
    }
    print(minLevel);
    print(maxLevel);
    var ranMin = minLevel - 1;
    var ranMax = maxLevel + 1;
    generateValuesInRange(ranMin, ranMax, (ranMax - ranMin) / 5);
    return;
  }

  generateValuesInRange(double minValue, double maxValue, double interval) {
    for (double value = minValue; value <= maxValue; value += interval) {
      levels.add(value);
    }
    print(levels);
    reversedNumbers = levels.reversed.toList();
    return;
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    double containerWidth = MediaQuery.of(context).size.width * 0.8;
    double containerHeight = MediaQuery.of(context).size.width * 0.6;

    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
            title: Row(children: [
          InkWell(
            onTap: getData,
            child: Text('getData'),
          ),
          SizedBox(
            width: 10,
          ),
          Text(memberName)
        ])),
        body: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(children: [
              Row(mainAxisSize: MainAxisSize.min, children: [
                //y축
                SizedBox(
                  width: 30,
                  height: containerHeight,
                  child: ListView.builder(
                    itemExtent: containerHeight / levels.length,
                    itemCount: levels.length,
                    itemBuilder: (context, index) {
                      print(containerHeight / levels.length);
                      print('containerHeight: $containerHeight');
                      return Text(reversedNumbers[index].toString());
                    },
                  ),
                ),
                //차트
                Stack(
                  children: [
                    Container(
                      width: containerWidth,
                      height: containerHeight,
                      color: Colors.black12,
                    ),
                    Positioned(
                        top: 0,
                        child: SizedBox(
                            width: containerWidth,
                            height: containerHeight,
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                itemExtent:
                                    (containerWidth) / painHistory.length,
                                itemCount: painHistory.length,
                                itemBuilder: (context, index) {
                                  double level =
                                      painHistory[index]['level'].toDouble();
                                  double topPosition = (containerHeight -
                                      (level *
                                          (containerHeight / levels.length)));

                                  return Container(
                                    margin: EdgeInsets.only(top: topPosition),
                                    child: Icon(
                                      Icons.circle,
                                      color: Colors.amber,
                                    ),
                                    alignment: Alignment.topCenter,
                                  );
                                }))),
                  ],
                )
              ]),
              //x축
              SizedBox(
                  height: 45,
                  child: Padding(
                      padding: EdgeInsets.fromLTRB(
                          MediaQuery.of(context).size.width * 0.15,
                          8,
                          MediaQuery.of(context).size.width * 0.05,
                          8),
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        itemExtent: (containerWidth) / painHistory.length,
                        itemCount: painHistory.length,
                        itemBuilder: (context, index) =>
                            Text(painHistory[index]['date']),
                      )))
            ])),
      ),
    );
  }
}
