import 'package:catchmypain/view/page/center_management_page.dart';
import 'package:catchmypain/view/page/home_page.dart';
import 'package:catchmypain/view/page/membership_management_page.dart';
import 'package:catchmypain/view/page/my_page.dart';
import 'package:catchmypain/view/page/schedule_management_page.dart';
import 'package:flutter/material.dart';

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  int bottomSelectedIndex = 0;

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    const List<BottomNavigationBarItem> navItems = [
      BottomNavigationBarItem(icon: Icon(Icons.home), label: '홈'),
      BottomNavigationBarItem(icon: Icon(Icons.calendar_today), label: '일정관리'),
      BottomNavigationBarItem(icon: Icon(Icons.people_outline), label: '회원관리'),
      BottomNavigationBarItem(icon: Icon(Icons.store_rounded), label: '센터관리'),
      BottomNavigationBarItem(
          icon: Icon(Icons.person_outline_sharp), label: '마이페이지'),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: bottomSelectedIndex == 3
            ? const Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                    Text(
                      '직원관리',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '역활관리',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '수강권관리',
                      style: TextStyle(color: Colors.black),
                    ),
                    Text(
                      '템플릿 관리',
                      style: TextStyle(color: Colors.black),
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
          controller: _pageController,
          onPageChanged: (value) {
            setState(() {
              bottomSelectedIndex = value;
            });
          },
          children: const [
            HomePage(),
            ScheduleManagementPage(),
            MembershipManagementPage(),
            CenterManagementPage(),
            MyPage(),
          ]),
      bottomNavigationBar: BottomNavigationBar(
        onTap: (value) {
          setState(() {
            bottomSelectedIndex = value;
            _pageController.jumpToPage(value);
          });
        },
        currentIndex: bottomSelectedIndex,
        items: navItems,
        type: BottomNavigationBarType.fixed,
      ),
    );
  }
}
