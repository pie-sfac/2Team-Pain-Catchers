import 'dart:io';

import 'package:catchmypain/api/getlocaldata.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/exercise_ability_card_widget.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:path_provider/path_provider.dart';

class ExerciseAbilityWidget extends StatelessWidget {
  const ExerciseAbilityWidget({super.key});

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
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 30),
            child: Text('신주희 회원님의 최근 운동 기록입니다.'),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 50),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                FutureBuilder<String>(
                  future: GetLocalData.getChartFilePath(), // 비동기 함수
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
                    if (snapshot.connectionState == ConnectionState.done) {
                      if (snapshot.hasData) {
                        final file = File(snapshot.data!);
                        return FutureBuilder<bool>(
                          future: file.exists(),
                          builder: (BuildContext context,
                              AsyncSnapshot<bool> fileSnapshot) {
                            if (fileSnapshot.connectionState ==
                                ConnectionState.done) {
                              if (fileSnapshot.hasData &&
                                  fileSnapshot.data == true) {
                                // 파일이 존재할 경우 이미지를 표시합니다.
                                return Image.file(
                                  file,
                                  width:
                                      MediaQuery.of(context).size.width * 0.85,
                                  height:
                                      MediaQuery.of(context).size.height * 0.75,
                                );
                              } else {
                                // 파일이 존재하지 않을 경우 메시지를 표시합니다.
                                return const Text('파일을 찾을 수 없습니다.');
                              }
                            }
                            // 파일 존재 여부 확인 중
                            return const CircularProgressIndicator();
                          },
                        );
                      } else if (snapshot.hasError) {
                        return Text('Error: ${snapshot.error}');
                      }
                    }
                    // 경로 가져오는 중
                    return const CircularProgressIndicator();
                  },
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
