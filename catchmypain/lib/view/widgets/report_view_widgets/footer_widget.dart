import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class FooterWidget extends StatelessWidget {
  const FooterWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(color: Colors.grey.shade200),
      child: const Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.home_repair_service_rounded),
                Text(
                  '포인티 센터',
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
            SizedBox(
              height: 5,
            ),
            Text('서울시 남부순환로 1801, 라피스 빌딩 8층'),
            SizedBox(
              height: 5,
            ),
            Text('02-840-9002'),
            SizedBox(
              height: 5,
            ),
            Row(
              children: [
                Text(
                  '카카오톡 문의 : ',
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
                Text(
                  '포인티 센터 바로가기',
                  style: TextStyle(
                      decoration: TextDecoration.underline,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
