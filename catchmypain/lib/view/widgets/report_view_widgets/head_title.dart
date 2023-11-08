import 'package:flutter/material.dart';

class HeadTitleWidget extends StatelessWidget {
  const HeadTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            "최상현 회원님",
            style: TextStyle(
              color: Colors.black,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          InkWell(
            // onTap: () {
            //   Navigator.of(context)
            //       .push(MaterialPageRoute(builder: (context) => NewPage()));
            // },
            child: Text(
              "과거 레포트 보러가기 >",
              style: TextStyle(
                color: Color.fromRGBO(115, 115, 115, 1),
                fontSize: 15,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
