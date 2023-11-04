import 'dart:io';
import 'package:catchmypain/view/widgets/video_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';

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
        : GridView.builder(
            shrinkWrap: true, // 뷰를 자식 요소들의 크기에 맞춤
            physics: const ClampingScrollPhysics(), // 부모 스크롤에 따라 함께 스크롤
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              // 한 줄에 표시할 아이템의 개수
              crossAxisCount: 3,
              // 아이템 간의 가로 간격
              crossAxisSpacing: 4,
              // 아이템 간의 세로 간격
              mainAxisSpacing: 4,
              // 아이템의 가로 세로 비율
              childAspectRatio: 1,
            ),
            itemCount: videoThumbnails.length,
            itemBuilder: (BuildContext context, int index) {
              String thumbnailPath = videoThumbnails.values.elementAt(index);
              return GestureDetector(
                onTap: () {
                  // 여기에 Navigator를 사용하여 비디오 플레이어 화면으로 이동합니다.
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => VideoPlayerScreen(
                          videoPath: videoThumbnails.keys.elementAt(index)),
                    ),
                  );
                },
                child: GridTile(
                  footer: const Center(child: Text('Its Test Image')),
                  child: SizedBox(
                    height: 100,
                    width: 100,
                    child: Image.file(
                      File(thumbnailPath),
                      fit: BoxFit.cover, // 이미지를 그리드에 맞춰서 채우도록 함
                      errorBuilder: (BuildContext context, Object exception,
                          StackTrace? stackTrace) {
                        return const Icon(Icons.error); // 이미지 로드 실패 시 아이콘 표시
                      },
                    ),
                  ), // 썸네일 하단에 텍스트 추가
                ),
              );
            },
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

  // Retrieves the first frame of a video file and saves it as a thumbnail.
  Future<String> getFirstFrame(String videoPath) async {
    final String thumbnailPath =
        '${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}_thumbnail.jpg';

    // Execute the FFmpeg command to extract the first frame
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
