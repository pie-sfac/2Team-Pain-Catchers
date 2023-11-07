import 'dart:io';
import 'package:catchmypain/view/widgets/exercise_video_listTile.dart';
import 'package:catchmypain/view/widgets/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

class ExerciseVideoRecordWidget extends StatefulWidget {
  const ExerciseVideoRecordWidget({super.key});

  @override
  State<ExerciseVideoRecordWidget> createState() =>
      _ExerciseVideoRecordWidgetState();
}

class _ExerciseVideoRecordWidgetState extends State<ExerciseVideoRecordWidget> {
  Map<String, String> videoThumbnails = {};
  bool isLoading = true;
  @override
  void initState() {
    super.initState();
    _generateThumbnails();
  }

  Future<void> _generateThumbnails() async {
    VideoManager videoManager = VideoManager();
    Map<String, String> thumbnails =
        await videoManager.generateThumbnailsForVideos();
    setState(() {
      videoThumbnails = thumbnails;
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? const Center(child: CircularProgressIndicator())
        : Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(
                height: 10,
              ),
              const Text(
                '팔 올리기',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.left,
              ),
              GridView.builder(
                shrinkWrap: true,
                physics: const ScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 5,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 4,
                  childAspectRatio: 1,
                ),
                itemCount: videoThumbnails.length,
                itemBuilder: (BuildContext context, int index) {
                  String thumbnailPath =
                      videoThumbnails.values.elementAt(index);
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => VideoPlayerScreen(
                              videoPath: videoThumbnails.keys.elementAt(index)),
                        ),
                      );
                    },
                    child: ExerciseVideoListTile(thumbnailPath: thumbnailPath),
                  );
                },
              ),
            ],
          );
  }
}

class VideoManager {
  final FlutterFFmpeg _ffmpeg = FlutterFFmpeg();

  // Lists the files in the Videos directory and generates thumbnails for them.
  Future<Map<String, String>> generateThumbnailsForVideos() async {
    Map<String, String> thumbnails = {};

    // Get the application documents directory and videos path.
    final Directory appDirectory = await getApplicationDocumentsDirectory();
    final String videoDirectoryPath = '${appDirectory.path}/Videos';
    final Directory videoDirectory = Directory(videoDirectoryPath);

    // Check if the video directory exists
    if (await videoDirectory.exists()) {
      // List all files in the directory
      List<FileSystemEntity> files = await videoDirectory.list().toList();

      // Process video files
      for (FileSystemEntity file in files) {
        if (file is File) {
          // Generate thumbnail for each video file
          String thumbnailPath = await getFirstFrame(file.path);
          if (thumbnailPath.isNotEmpty) {
            thumbnails[file.path] = thumbnailPath;
          }
        }
      }
    } else {
      print("The Videos directory does not exist.");
    }

    return thumbnails;
  }

  Future<String> getFirstFrame(String videoPath) async {
    final String thumbnailFileName =
        '${path.basenameWithoutExtension(videoPath)}_thumbnail.jpg';
    final Directory tempDir = await getTemporaryDirectory();
    final String thumbnailPath = path.join(tempDir.path, thumbnailFileName);

    final file = File(thumbnailPath);
    if (await file.exists()) {
      print("Thumbnail already exists for $videoPath");
      return thumbnailPath;
    } else {
      int rc = await _ffmpeg.execute(
          '-i "$videoPath" -ss 00:00:01.000 -frames:v 1 "$thumbnailPath"');
      if (rc == 0) {
        print("Thumbnail created for $videoPath");
        return thumbnailPath;
      } else {
        print("Thumbnail creation failed for $videoPath with rc: $rc");
        return '';
      }
    }
  }
}
