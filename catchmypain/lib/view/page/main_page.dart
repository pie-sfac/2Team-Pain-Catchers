import 'package:catchmypain/provider/page_provider.dart';
import 'package:catchmypain/view/page/chart_page.dart';
import 'package:catchmypain/view/page/drawing_main_page.dart';
import 'package:catchmypain/view/page/exercise_camera_page.dart';
import 'package:catchmypain/view/page/report_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// ignore: must_be_immutable
class MainPage extends ConsumerWidget {
  MainPage({super.key});

  int bottomSelectedIndex = 0;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final int menuIndex = ref.watch(indexProvider) as int;
    final PageController pageController = PageController(
      initialPage: menuIndex,
    );
    const List<BottomNavigationBarItem> navItems = [
      BottomNavigationBarItem(icon: Icon(Icons.draw_outlined), label: '자세 교정'),
      BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined), label: '운동평가'),
      BottomNavigationBarItem(
          icon: Icon(Icons.add_chart_outlined), label: '차트'),
      BottomNavigationBarItem(
          icon: Icon(Icons.note_alt_outlined), label: '퍼스널레포트'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: menuIndex == 2
            ? Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  GestureDetector(
                    onTap: () {
                      ref.read(chartIndexProvider.notifier).value = 0;
                    },
                    child: const Text(
                      'PainHistory',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(chartIndexProvider.notifier).value = 1;
                    },
                    child: const Text(
                      'Condition',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      ref.read(chartIndexProvider.notifier).value = 2;
                    },
                    child: const Text(
                      'exercise',
                      style: TextStyle(color: Colors.black),
                    ),
                  ),
                ],
              )
            : menuIndex == 1
                ? Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                        GestureDetector(
                          onTap: () {
                            ref.read(cameraIndexProvider.notifier).value = 0;
                          },
                          child: const Text(
                            '운동 선택',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(cameraIndexProvider.notifier).value = 1;
                          },
                          child: const Text(
                            '운동 기록',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            ref.read(cameraIndexProvider.notifier).value = 2;
                          },
                          child: const Text(
                            '운동 영상',
                            style: TextStyle(color: Colors.black),
                          ),
                        ),
                      ])
                : const SizedBox(),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.person_4_rounded,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '최상현',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    '플랜 이용중',
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          ),
          const Center(
            child: Text(
              '|',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              )),
        ],
        leading: Image.asset('asset/images/wix_logo.png'),
        leadingWidth: 80,
      ),
      body: PageView(
          controller: pageController,
          onPageChanged: (i) => ref.read(indexProvider.notifier).value = i,
          children: const [
            DrawingMainPage(),
            ExerciseCameraPage(),
            ChartPage(),
            ReportPage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          ref.read(indexProvider.notifier).value = value;
          pageController.jumpToPage(value);
        },
        currentIndex: menuIndex,
        items: navItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
