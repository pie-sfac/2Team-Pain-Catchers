import 'dart:async';
import 'dart:convert';
import 'dart:io';
import 'package:catchmypain/painter/pose_painter.dart';
import 'package:catchmypain/provider/exercise_record_provider.dart';
import 'package:catchmypain/provider/push_up_provider.dart';
import 'package:catchmypain/util/exercise_verification.dart';
import 'package:camera/camera.dart';
import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/view/widgets/camera_view_widgets/countdown_timer.dart';
import 'package:catchmypain/view/widgets/camera_view_widgets/record_timer.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CameraView extends ConsumerStatefulWidget {
  const CameraView(
      {Key? key,
      required this.posePainter,
      required this.customPaint,
      required this.onImage,
      required this.exercise,
      this.onCameraFeedReady,
      this.onDetectorViewModeChanged,
      this.onCameraLensDirectionChanged,
      this.initialCameraLensDirection = CameraLensDirection.back})
      : super(key: key);
  final PosePainter? posePainter;
  final CustomPaint? customPaint;
  final Function(InputImage inputImage) onImage;
  final VoidCallback? onCameraFeedReady;
  final VoidCallback? onDetectorViewModeChanged;
  final Function(CameraLensDirection direction)? onCameraLensDirectionChanged;
  final CameraLensDirection initialCameraLensDirection;
  final String exercise;

  @override
  ConsumerState<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends ConsumerState<CameraView> {
  static List<CameraDescription> _cameras = [];
  CameraController? _controller;
  int _cameraIndex = -1;
  double _currentZoomLevel = 1.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  bool _changingCameraLens = false;
  bool _changingPoseDetection = true;
  Duration _myDuration = const Duration(seconds: 5);
  Duration _recordDuration = const Duration(seconds: 0);
  bool _isCountDownTimerStart = false;
  bool _isRecordTimerStart = false;

  PoseLandmark? rtShoulder;
  PoseLandmark? rtElbow;
  PoseLandmark? rtWrist;
  PoseLandmark? rtHip;
  PoseLandmark? rtKnee;
  PoseLandmark? rtAnkle;
  PoseLandmark? ltShoulder;
  PoseLandmark? ltElbow;
  PoseLandmark? ltWrist;
  PoseLandmark? ltHip;
  PoseLandmark? ltKnee;
  PoseLandmark? ltAnkle;

  Timer? _timer;
  Timer? _countdownTimer;
  Timer? _recordTimer;
  List<ExerciseData> exerciseDataList = [];
  late Box box;
  @override
  void initState() {
    super.initState();

    _initialize();
  }

  void _initialize() async {
    box = await Hive.openBox('myBox');
    if (_cameras.isEmpty) {
      _cameras = await availableCameras();
    }
    for (var i = 0; i < _cameras.length; i++) {
      if (_cameras[i].lensDirection == widget.initialCameraLensDirection) {
        _cameraIndex = i;
        break;
      }
    }
    if (_cameraIndex != -1) {
      _changingPoseDetection == true ? _startLiveFeed() : _startVideoFeed();
    }
  }

  void recordValue(DateTime startTime) {
    ExerciseData exerciseData = ExerciseData(
        count: 0,
        poseState: '',
        durationTime: '',
        recordTime: '',
        rtShoulder: CoordinateLandmark(
            x: rtShoulder!.x, y: rtShoulder!.y, z: rtShoulder!.z),
        rtElbow:
            CoordinateLandmark(x: rtElbow!.x, y: rtElbow!.y, z: rtElbow!.z),
        rtWrist:
            CoordinateLandmark(x: rtWrist!.x, y: rtWrist!.y, z: rtWrist!.z),
        rtHip: CoordinateLandmark(x: rtHip!.x, y: rtHip!.y, z: rtHip!.z),
        rtKnee: CoordinateLandmark(x: rtKnee!.x, y: rtKnee!.y, z: rtKnee!.z),
        rtAnkle:
            CoordinateLandmark(x: rtAnkle!.x, y: rtAnkle!.y, z: rtAnkle!.z),
        ltShoulder: CoordinateLandmark(
            x: ltShoulder!.x, y: ltShoulder!.y, z: ltShoulder!.z),
        ltElbow:
            CoordinateLandmark(x: ltElbow!.x, y: ltElbow!.y, z: ltElbow!.z),
        ltWrist:
            CoordinateLandmark(x: ltWrist!.x, y: ltWrist!.y, z: ltWrist!.z),
        ltHip: CoordinateLandmark(x: ltHip!.x, y: ltHip!.y, z: ltHip!.z),
        ltKnee: CoordinateLandmark(x: ltKnee!.x, y: ltKnee!.y, z: ltKnee!.z),
        ltAnkle:
            CoordinateLandmark(x: ltAnkle!.x, y: ltAnkle!.y, z: ltAnkle!.z));
    if (rtShoulder != null &&
        rtElbow != null &&
        rtWrist != null &&
        ltShoulder != null &&
        ltElbow != null &&
        ltWrist != null) {
      final elapsedTime = DateTime.now().difference(startTime);
      exerciseData.count = ref.read(pushUpCounterProvider.notifier).counter;
      exerciseData.poseState = ref.read(pushUpCounterProvider).name;
      exerciseData.durationTime =
          (elapsedTime.inMilliseconds / 1000).toStringAsFixed(2);
      String formattedDateTime =
          "${startTime.year}-${startTime.month.toString().padLeft(2, '0')}-${startTime.day.toString().padLeft(2, '0')} ${startTime.hour.toString().padLeft(2, '0')}:${startTime.minute.toString().padLeft(2, '0')}:${startTime.second.toString().padLeft(2, '0')}";
      exerciseData.recordTime = formattedDateTime;
      exerciseDataList.add(exerciseData);
    }
  }

  @override
  void didUpdateWidget(covariant CameraView oldWidget) {
    if (widget.customPaint != oldWidget.customPaint) {
      if (widget.customPaint == null) return;
      for (final pose in widget.posePainter!.poses) {
        PoseLandmark getPoseLandmark(PoseLandmarkType type1) {
          final PoseLandmark joint1 = pose.landmarks[type1]!;
          return joint1;
        }

        rtShoulder = getPoseLandmark(PoseLandmarkType.rightShoulder);
        rtElbow = getPoseLandmark(PoseLandmarkType.rightElbow);
        rtWrist = getPoseLandmark(PoseLandmarkType.rightWrist);
        rtHip = getPoseLandmark(PoseLandmarkType.rightHip);
        rtKnee = getPoseLandmark(PoseLandmarkType.rightKnee);
        rtAnkle = getPoseLandmark(PoseLandmarkType.rightAnkle);
        ltShoulder = getPoseLandmark(PoseLandmarkType.leftShoulder);
        ltElbow = getPoseLandmark(PoseLandmarkType.leftElbow);
        ltWrist = getPoseLandmark(PoseLandmarkType.leftWrist);
        ltHip = getPoseLandmark(PoseLandmarkType.leftHip);
        ltKnee = getPoseLandmark(PoseLandmarkType.leftKnee);
        ltAnkle = getPoseLandmark(PoseLandmarkType.leftAnkle);
      }
      //verification
      WidgetsBinding.instance.addPostFrameCallback((_) {
        final exerciseVerification = ExerciseVerification(ref);
        if (widget.exercise == 'arm_press') {
          exerciseVerification.ArmsUp(
              rtShoulder!, rtElbow!, rtWrist!, ltShoulder!, ltElbow!, ltWrist!);
        }
      });
    }
    super.didUpdateWidget(oldWidget);
  }

  @override
  void dispose() {
    _recordTimer?.cancel();
    _countdownTimer?.cancel();
    _timer?.cancel();
    _changingPoseDetection == true ? _stopLiveFeed() : _stopVideoFeed();
    //box.clear();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: _liveFeedBody());
  }

  Widget _liveFeedBody() {
    if (_cameras.isEmpty) return Container();
    if (_controller == null) return Container();
    if (_controller?.value.isInitialized == false) return Container();

    return Container(
      color: Colors.black,
      child: Stack(
        fit: StackFit.expand,
        children: <Widget>[
          Center(
            child: _changingCameraLens
                ? const Center(
                    child: Text('Changing camera lens'),
                  )
                : CameraPreview(
                    _controller!,
                    child: _changingPoseDetection == true
                        ? widget.customPaint
                        : const SizedBox.shrink(),
                  ),
          ),
          _startRecordBtn(),
          _isCountDownTimerStart == true
              ? CountDownTimer(myDuration: _myDuration)
              : RecordTimer(
                  isRecordTimerStart: _isRecordTimerStart,
                  recordDuration: _recordDuration),
          if (_isRecordTimerStart == true &&
              _changingPoseDetection == true) ...[
            _poseStatetxt(),
            _counterWidget(),
          ],
          _backButton(),
          _switchLiveCameraToggle(),
          _switchPoseDetectionToggle(),
          _zoomControl(),
          _exposureControl(),
        ],
      ),
    );
  }

  Widget _poseStatetxt() {
    return Positioned(
      left: 0,
      top: 50,
      right: MediaQuery.sizeOf(context).width * 0.75,
      child: Column(
        children: [
          const Text(
            'Current Pose State',
            style: TextStyle(
              color: Colors.white,
            ),
          ),
          Container(
            width: 160,
            decoration: BoxDecoration(
              color: Colors.black54,
              border:
                  Border.all(color: Colors.white.withOpacity(0.4), width: 4.0),
              borderRadius: const BorderRadius.all(Radius.circular(12)),
            ),
            child: Text(
              ref.read(pushUpCounterProvider).name,
              textAlign: TextAlign.center,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _counterWidget() {
    return Positioned(
      left: 0,
      top: 50,
      right: 0,
      child: Column(children: [
        const Text(
          'Counter',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 10,
          ),
        ),
        Container(
          width: 70,
          decoration: BoxDecoration(
            color: Colors.black54,
            border:
                Border.all(color: Colors.white.withOpacity(0.4), width: 4.0),
            borderRadius: const BorderRadius.all(Radius.circular(12)),
          ),
          child: Text(
            '${ref.read(pushUpCounterProvider.notifier).counter}',
            textAlign: TextAlign.center,
            style: const TextStyle(
              color: Colors.white,
              fontSize: 30,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ]),
    );
  }

  Widget _startRecordBtn() {
    return Positioned(
      left: MediaQuery.of(context).size.width * 0.4,
      right: MediaQuery.of(context).size.width * 0.4,
      bottom: 64,
      child: Column(
        children: [
          GestureDetector(
            onTap: _isRecordTimerStart == true
                ? _handleStopRecordBtn
                : _handleStartRecordBtn,
            child: Container(
              width: 125,
              decoration: BoxDecoration(
                color: Colors.black54,
                border: Border.all(
                    color: Colors.white.withOpacity(0.4), width: 4.0),
                borderRadius: const BorderRadius.all(Radius.circular(12)),
              ),
              child: _isRecordTimerStart == true
                  ? const Text(
                      textAlign: TextAlign.center,
                      "Stop",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    )
                  : const Text(
                      textAlign: TextAlign.center,
                      "Start",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 45,
                      ),
                    ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _backButton() => Positioned(
        top: 40,
        left: 8,
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            heroTag: Object(),
            onPressed: () {
              ref.read(pushUpCounterProvider.notifier).reset();
              context.pop();
            },
            backgroundColor: Colors.black54,
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
            ),
          ),
        ),
      );

  Widget _switchPoseDetectionToggle() => Positioned(
        bottom: 8,
        left: 8,
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            heroTag: Object(),
            onPressed: _toggleMode,
            backgroundColor: Colors.black54,
            child: const Icon(
              Icons.find_in_page,
              size: 25,
            ),
          ),
        ),
      );

  Widget _switchLiveCameraToggle() => Positioned(
        bottom: 8,
        right: 8,
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            heroTag: Object(),
            onPressed: _switchLiveCamera,
            backgroundColor: Colors.black54,
            child: Icon(
              Platform.isIOS
                  ? Icons.flip_camera_ios_outlined
                  : Icons.flip_camera_android_outlined,
              size: 25,
            ),
          ),
        ),
      );

  Widget _zoomControl() => Positioned(
        bottom: 16,
        left: 0,
        right: 0,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: SizedBox(
            width: 250,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  child: Slider(
                    value: _currentZoomLevel,
                    min: _minAvailableZoom,
                    max: _maxAvailableZoom,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                    onChanged: (value) async {
                      setState(() {
                        _currentZoomLevel = value;
                      });
                      await _controller?.setZoomLevel(value);
                    },
                  ),
                ),
                Container(
                  width: 50,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Center(
                      child: Text(
                        '${_currentZoomLevel.toStringAsFixed(1)}x',
                        style: const TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      );

  Widget _exposureControl() => Positioned(
        top: 40,
        right: 8,
        child: ConstrainedBox(
          constraints: const BoxConstraints(
            maxHeight: 250,
          ),
          child: Column(children: [
            Container(
              width: 55,
              decoration: BoxDecoration(
                color: Colors.black54,
                borderRadius: BorderRadius.circular(10.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Center(
                  child: Text(
                    '${_currentExposureOffset.toStringAsFixed(1)}x',
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
            Expanded(
              child: RotatedBox(
                quarterTurns: 3,
                child: SizedBox(
                  height: 30,
                  child: Slider(
                    value: _currentExposureOffset,
                    min: _minAvailableExposureOffset,
                    max: _maxAvailableExposureOffset,
                    activeColor: Colors.white,
                    inactiveColor: Colors.white30,
                    onChanged: (value) async {
                      setState(() {
                        _currentExposureOffset = value;
                      });
                      await _controller?.setExposureOffset(value);
                    },
                  ),
                ),
              ),
            )
          ]),
        ),
      );

  Future _startLiveFeed() async {
    final camera = _cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      // Set to ResolutionPreset.high. Do NOT set it to ResolutionPreset.max because for some phones does NOT work.
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.nv21
          : ImageFormatGroup.bgra8888,
    );
    _controller?.initialize().then((_) {
      if (!mounted) {
        return;
      }
      _controller?.getMinZoomLevel().then((value) {
        _currentZoomLevel = value;
        _minAvailableZoom = value;
      });
      _controller?.getMaxZoomLevel().then((value) {
        _maxAvailableZoom = value;
      });
      _currentExposureOffset = 0.0;
      _controller?.getMinExposureOffset().then((value) {
        _minAvailableExposureOffset = value;
      });
      _controller?.getMaxExposureOffset().then((value) {
        _maxAvailableExposureOffset = value;
      });
      _controller?.startImageStream(_processCameraImage).then((value) {
        if (widget.onCameraFeedReady != null) {
          widget.onCameraFeedReady!();
        }
        if (widget.onCameraLensDirectionChanged != null) {
          widget.onCameraLensDirectionChanged!(camera.lensDirection);
        }
      });
      setState(() {});
    });
  }

  Future<void> _startVideoFeed() async {
    final camera = _cameras[_cameraIndex];
    _controller = CameraController(
      camera,
      ResolutionPreset.high,
      enableAudio: false,
      imageFormatGroup: Platform.isAndroid
          ? ImageFormatGroup.yuv420
          : ImageFormatGroup.bgra8888,
    );

    try {
      await _controller?.initialize();
      if (!mounted) return;

      // Initialize zoom and exposure
      _currentZoomLevel = await _controller?.getMinZoomLevel() ?? 1.0;
      _minAvailableZoom = _currentZoomLevel;
      _maxAvailableZoom = await _controller?.getMaxZoomLevel() ?? 1.0;
      _currentExposureOffset = 0.0;
      _minAvailableExposureOffset =
          await _controller?.getMinExposureOffset() ?? 0.0;
      _maxAvailableExposureOffset =
          await _controller?.getMaxExposureOffset() ?? 0.0;

      setState(() {});

      // If you have any callbacks to notify that the camera is ready
      widget.onCameraFeedReady?.call();
      widget.onCameraLensDirectionChanged?.call(camera.lensDirection);
    } catch (e) {
      print(e);
      if (!mounted) return;
      setState(() {});
      // Handle if the camera initialization or video recording fails
      // For example, show an error message
    }
  }

  Future<String?> _stopVideoFeed() async {
    String? videoPath;

    if (_controller?.value.isRecordingVideo == true) {
      // Stop video recording and get the file path of the recorded video
      XFile? videoFile;
      try {
        videoFile = await _controller?.stopVideoRecording();
        videoPath = videoFile?.path;
      } on CameraException catch (e) {
        print(e);
        return null;
      }
    }
    await _controller?.dispose();
    _controller = null;
    return videoPath;
  }

  // 포즈 감지 및 비디오 녹화 중지
  Future<void> _stopEverything() async {
    if (_changingPoseDetection) {
      await _stopLiveFeed();
    } else {
      await _stopVideoFeed();
    }
  }

  // 토글 버튼 처리
  void _toggleMode() async {
    if (_changingPoseDetection) {
      // ML Kit 사용 중이면 모두 중지하고 비디오 녹화 시작
      await _stopEverything().then((_) => _startVideoFeed());
    } else {
      // 비디오 녹화 중이면 모두 중지하고 ML Kit 시작
      await _stopEverything().then((_) => _startLiveFeed());
    }
    _changingPoseDetection = !_changingPoseDetection; // 토글 상태 변경
  }

  Future _stopLiveFeed() async {
    try {
      // 이미지 스트림을 중지합니다. null과 이미지 스트림 상태를 체크합니다.
      if (_controller != null && _controller!.value.isStreamingImages) {
        await _controller?.stopImageStream();
      }

      // 컨트롤러를 dispose 합니다.
      if (_controller != null) {
        var oldController = _controller;
        _controller = null; // 먼저 컨트롤러를 null로 설정하여 더 이상 사용되지 않도록 합니다.
        await oldController?.dispose().then((value) {
          // dispose가 완료된 후 UI를 업데이트합니다.
          if (mounted) {
            setState(() {});
          }
        }).catchError((error) {
          // 오류 처리
          _controller = oldController; // 오류가 발생한 경우, 컨트롤러를 복원합니다.
        });
      }
    } catch (e) {
      print(e);
    }
  }

  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % _cameras.length;

    await _stopLiveFeed();
    await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  void _processCameraImage(CameraImage image) {
    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;
    widget.onImage(inputImage);
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = _myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        _countdownTimer!.cancel();
        _isCountDownTimerStart = false;
        ref.read(pushUpCounterProvider.notifier).reset();
        _isRecordTimerStart = true;
        _handleRecordDuration();
      } else {
        _myDuration = Duration(seconds: seconds);
      }
    });
  }

  void _handleRecordDuration() {
    final startTime = DateTime.now();
    _recordTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setRecordTime());
    _changingPoseDetection == true
        ? _timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
            recordValue(startTime);
          })
        : _controller!.startVideoRecording();
  }

  void setRecordTime() {
    const secondsBy = 1;
    setState(() {
      final seconds = _recordDuration.inSeconds + secondsBy;
      _recordDuration = Duration(seconds: seconds);
    });
  }

  void _handleStopRecordBtn() async {
    if (_changingPoseDetection) {
      ref.read(pushUpCounterProvider.notifier).reset();

      List<dynamic> currentList = box.get('pushupData', defaultValue: []);
      String exerciseDataListJson = jsonEncode(exerciseDataList);
      currentList.add(exerciseDataListJson);
      await box.put('pushupData', currentList);

      // ignore: unused_result
      ref.refresh(exerciseDataProvider);
      // ignore: unused_result
      ref.refresh(stdExerciseDataProvider);
    } else {
      var videoFile = await _controller!.stopVideoRecording();
      // 앱의 문서 디렉토리를 얻습니다.
      final Directory appDirectory = await getApplicationDocumentsDirectory();
      final String videoDirectory = '${appDirectory.path}/Videos';
      await Directory(videoDirectory).create(recursive: true);

      // 새 파일 경로를 생성합니다.
      final String filePath =
          '$videoDirectory/${path.basename(videoFile.path)}';

      // 원본 비디오 파일을 새 위치로 이동합니다.
      await videoFile.saveTo(filePath);

      setState(() {});
    }
    _recordDuration = const Duration(seconds: 0);
    _myDuration = const Duration(seconds: 5);
    _recordTimer?.cancel();
    _isRecordTimerStart = false;
  }

  void _handleStartRecordBtn() async {
    _isCountDownTimerStart = true;
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  final orientations = {
    DeviceOrientation.portraitUp: 0,
    DeviceOrientation.landscapeLeft: 90,
    DeviceOrientation.portraitDown: 180,
    DeviceOrientation.landscapeRight: 270,
  };

  InputImage? _inputImageFromCameraImage(CameraImage image) {
    if (_controller == null) return null;

    // get image rotation
    // it is used in android to convert the InputImage from Dart to Java: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/android/src/main/java/com/google_mlkit_commons/InputImageConverter.java
    // `rotation` is not used in iOS to convert the InputImage from Dart to Obj-C: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/google_mlkit_commons/ios/Classes/MLKVisionImage%2BFlutterPlugin.m
    // in both platforms `rotation` and `camera.lensDirection` can be used to compensate `x` and `y` coordinates on a canvas: https://github.com/flutter-ml/google_ml_kit_flutter/blob/master/packages/example/lib/vision_detector_views/painters/coordinates_translator.dart
    final camera = _cameras[_cameraIndex];
    final sensorOrientation = camera.sensorOrientation;
    // print(
    //     'lensDirection: ${camera.lensDirection}, sensorOrientation: $sensorOrientation, ${_controller?.value.deviceOrientation} ${_controller?.value.lockedCaptureOrientation} ${_controller?.value.isCaptureOrientationLocked}');
    InputImageRotation? rotation;
    if (Platform.isIOS) {
      rotation = InputImageRotationValue.fromRawValue(sensorOrientation);
    } else if (Platform.isAndroid) {
      var rotationCompensation =
          orientations[_controller!.value.deviceOrientation];
      if (rotationCompensation == null) return null;
      if (camera.lensDirection == CameraLensDirection.front) {
        // front-facing
        rotationCompensation = (sensorOrientation + rotationCompensation) % 360;
      } else {
        // back-facing
        rotationCompensation =
            (sensorOrientation - rotationCompensation + 360) % 360;
      }
      rotation = InputImageRotationValue.fromRawValue(rotationCompensation);
      // print('rotationCompensation: $rotationCompensation');
    }
    if (rotation == null) return null;
    // print('final rotation: $rotation');

    // get image format
    final format = InputImageFormatValue.fromRawValue(image.format.raw);
    // validate format depending on platform
    // only supported formats:
    // * nv21 for Android
    // * bgra8888 for iOS
    if (format == null ||
        (Platform.isAndroid && format != InputImageFormat.nv21) ||
        (Platform.isIOS && format != InputImageFormat.bgra8888)) return null;

    // since format is constraint to nv21 or bgra8888, both only have one plane
    if (image.planes.length != 1) return null;
    final plane = image.planes.first;

    // compose InputImage using bytes
    return InputImage.fromBytes(
      bytes: plane.bytes,
      metadata: InputImageMetadata(
        size: Size(image.width.toDouble(), image.height.toDouble()),
        rotation: rotation, // used only in Android
        format: format, // used only in iOS
        bytesPerRow: plane.bytesPerRow, // used only in iOS
      ),
    );
  }
}
