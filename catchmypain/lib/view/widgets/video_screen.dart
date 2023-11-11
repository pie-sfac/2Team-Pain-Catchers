import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_ffmpeg/flutter_ffmpeg.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

class VideoPlayerScreen extends StatefulWidget {
  final String videoPath;

  const VideoPlayerScreen({Key? key, required this.videoPath})
      : super(key: key);

  @override
  _VideoPlayerScreenState createState() => _VideoPlayerScreenState();
}

class _VideoPlayerScreenState extends State<VideoPlayerScreen> {
  late VideoPlayerController _controller;
  late Future<void> _initializeVideoPlayerFuture;

  @override
  void initState() {
    super.initState();
    // VideoPlayerController를 생성하여 비디오를 초기화합니다.
    _controller = VideoPlayerController.file(File(widget.videoPath));
    // 비디오를 로드하고 준비하는 Future를 저장합니다.
    _initializeVideoPlayerFuture = _controller.initialize();
    // 비디오를 반복재생하도록 설정합니다.
    _controller.setLooping(true);
  }

  @override
  void dispose() {
    // 위젯이 종료될 때 컨트롤러를 해제합니다.
    _controller.dispose();
    super.dispose();
  }

  Future<String> captureFrame() async {
    final FlutterFFmpeg ffmpeg = FlutterFFmpeg();
    final String thumbnailPath =
        '${(await getTemporaryDirectory()).path}/${DateTime.now().millisecondsSinceEpoch}_capture.jpg';

    // 현재 재생 시간을 밀리초 단위로 가져옵니다.
    final String currentPosition =
        ((_controller.value.position.inMilliseconds + 275) / 1000)
            .toStringAsFixed(3);

    int rc = await ffmpeg.execute(
        '-i "${widget.videoPath}" -ss $currentPosition -vframes 1 "$thumbnailPath"');

    if (rc == 0) {
      print("Frame captured: $thumbnailPath");
      return thumbnailPath;
    } else {
      print("Frame capture failed with rc: $rc");
      return '';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Video Player'),
      ),
      body: FutureBuilder(
        future: _initializeVideoPlayerFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            // 만약 VideoPlayerController가 비디오를 준비했다면,
            // 비디오의 비율에 맞춰서 플레이어를 보여줍니다.
            return Center(
              child: AspectRatio(
                aspectRatio: _controller.value.aspectRatio,
                // VideoPlayer 위젯을 사용하여 VideoPlayerController에 대한 비디오를 보여줍니다.
                child: VideoPlayer(_controller),
              ),
            );
          } else {
            // 만약 VideoPlayerController가 아직 비디오를 준비 중이라면,
            // 로딩 스피너를 보여줍니다.
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
      floatingActionButton: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FloatingActionButton(
            heroTag: Object(),
            backgroundColor: Colors.transparent,
            onPressed: () {
              // 재생버튼이 눌리면 컨트롤러를 통해 비디오를 재생/일시정지 합니다.
              setState(() {
                if (_controller.value.isPlaying) {
                  _controller.pause();
                } else {
                  _controller.play();
                }
              });
            },
            shape: const CircleBorder(
              side: BorderSide(color: Colors.white),
            ),
            // 아이콘을 재생상태에 따라 변경합니다.
            child: Icon(
              _controller.value.isPlaying ? Icons.pause : Icons.play_arrow,
            ),
          ),
          FloatingActionButton(
            heroTag: Object(),
            backgroundColor: Colors.transparent,
            onPressed: () async {
              String capturedImagePath = await captureFrame();
              if (capturedImagePath.isNotEmpty) {
                print('Save Success');
              }
            },
            shape: const CircleBorder(
              side: BorderSide(color: Colors.white),
            ),
            child: const Icon(Icons.camera),
          ),
        ],
      ),
    );
  }
}
