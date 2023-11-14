import 'package:catchmypain/provider/api_provider.dart';
import 'package:catchmypain/view/page/chart_page.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/advertisement_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/center_recommend_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/condition_change_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/exercise_ability_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/feedback_list_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/footer_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/head_title.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/image_list_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/pain_change_widget.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/share_report_widget.dart';
import 'package:catchmypain/view/widgets/show_drawing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ReportPage extends ConsumerWidget {
  const ReportPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    var reportDataAsyncValue = ref.watch(reportProvider(uuid));
    return reportDataAsyncValue.when(
        loading: () => const CircularProgressIndicator(), // 로딩 중 상태 UI
        error: (error, stack) => Text('Error: $error'), // 에러 상태 UI
        data: (report) {
          return Scaffold(
            backgroundColor: Colors.transparent,
            body: ListView(
              children: [
                const HeadTitleWidget(),
                //const AdvertisementWidget(),
                ImageListWidget(mediaRecordModel: report.media),
                const SizedBox(height: 20),
                FeedBackListWidget(
                  feedBack: report.comment.content,
                ),
                const SizedBox(height: 10),
                CenterRecommendWidget(archiveLinkList: report.archiveLink),
                //PainChangeWidget(),
                const SizedBox(height: 10),
                const ExerciseAbilityWidget(),
                const SizedBox(height: 10),
                ConditionChangeWidget(conditionList: report.condition),
                const SizedBox(height: 10),
                const Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 24,
                    ),
                    Icon(Icons.circle, color: Colors.blue, size: 10),
                    SizedBox(width: 10),
                    Text(
                      '자세 교정',
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Container(
                  height: 500,
                  alignment: Alignment.center,
                  child: const ShowDrawing(),
                ),
                const SizedBox(height: 20),
                const ShareReportWidget(),
                const SizedBox(height: 20),
                const FooterWidget()
              ],
            ),
          );
        });
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
