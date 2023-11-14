import 'dart:io';

import 'package:path_provider/path_provider.dart';

class GetLocalData {
  static Future<String> getPoseImgFilePath() async {
    var directory = await getApplicationDocumentsDirectory();
    var poseImgDirectory = Directory('${directory.path}/poseImg');
    if (!await poseImgDirectory.exists()) {
      await poseImgDirectory.create(recursive: true);
    }
    String imagePath = '${poseImgDirectory.path}/pose_screenshot.png';
    return imagePath;
  }

  static Future<String> getChartFilePath() async {
    var directory = await getApplicationDocumentsDirectory();
    var chartDirectory = Directory('${directory.path}/chart');
    if (!await chartDirectory.exists()) {
      await chartDirectory.create(recursive: true);
    }
    String imagePath = '${chartDirectory.path}/screenshot.png';
    return imagePath;
  }
}
