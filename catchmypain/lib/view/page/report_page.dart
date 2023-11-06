import 'package:catchmypain/view/widgets/report_view_widgets/advertisement_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/center_recommend_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/condition_change_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/feedback_list_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/head_title.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/image_list_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/pain_change_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/share_report_widget.dart';
import 'package:flutter/material.dart';

class ReportPage extends StatelessWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: ListView(
        children: [
          const HeadTitleWidget(),
          const AdvertisementWidget(),
          const ImageListWidget(),
          const SizedBox(height: 20),
          FeedBackListWidget(),
          const SizedBox(height: 10),
          const CenterRecommendWdiget(),
          const PainChangeWidget(),
          const ConditionChangeWidget(),
          const ShareReportWidget(),
        ],
      ),
    );
  }
}

class NewPage extends StatelessWidget {
  const NewPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("과거 레포트Page")),
      body: const Center(child: Text("This is a new page")),
    );
  }
}
