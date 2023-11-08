import 'package:catchmypain/view/widgets/report_view_widgets/shared_report_widget_card.dart';
import 'package:flutter/material.dart';

class ShareReportWidget extends StatelessWidget {
  const ShareReportWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Padding(
      padding: EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                child: Text(
                  '최상현 회원님의 \n퍼스널 레포트를 공유해 보세요',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
          Text(
            '내가 작성한 만족도를 제외한 모든 정보가 함께 전달됩니다',
            style: TextStyle(color: Colors.grey),
          ),
          Row(
            children: [
              SharedReportCardWidget(copyTxt: '링크복사', iconColor: Colors.blue),
              SharedReportCardWidget(copyTxt: '카카오톡', iconColor: Colors.yellow),
            ],
          )
        ],
      ),
    );
  }
}
