import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key})
      : super(key: key); // Corrected the key constructor

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding:
                const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text(
                  "최상현 회원님",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => NewPage()));
                  },
                  child: const Text(
                    "과거 레포트 보러가기 >",
                    style: TextStyle(
                      color: Colors.blueGrey,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Center(
              child: Container(
                width: 600,
                height: 200,
                decoration: const BoxDecoration(
                  color: Colors.lightBlueAccent,
                ),
                child: const Center(
                  child: Text('친구에게 내 레포트 공유하고\n PT 1회권 무료로 받자!',
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                      textAlign: TextAlign.left),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// A placeholder new page to demonstrate the navigation
class NewPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("과거 레포트Page")),
      body: const Center(child: Text("This is a new page")),
    );
  }
}
