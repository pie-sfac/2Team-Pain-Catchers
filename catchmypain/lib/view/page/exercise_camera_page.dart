import 'package:catchmypain/provider/page_provider.dart';
import 'package:catchmypain/view/widgets/exercise_List.dart';
import 'package:catchmypain/view/widgets/exercise_record.dart';
import 'package:catchmypain/view/widgets/exercise_video_record.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseCameraPage extends ConsumerStatefulWidget {
  const ExerciseCameraPage({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ExerciseCameraPage> createState() => _ExerciseCameraPageState();
}

class _ExerciseCameraPageState extends ConsumerState<ExerciseCameraPage> {
  @override
  Widget build(BuildContext context) {
    final int cameraMenuIndex = ref.watch(cameraIndexProvider) as int;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            if (cameraMenuIndex == 0) ...[
              const ExerciseListWidget(),
            ] else if (cameraMenuIndex == 1) ...[
              const ExerciseRecordWidget()
            ] else if (cameraMenuIndex == 2) ...[
              const ExerciseVideoRecordWidget()
            ]
          ],
        ),
      ),
    );
  }
}
