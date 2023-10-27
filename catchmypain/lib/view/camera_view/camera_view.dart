import 'dart:async';
import 'dart:io';
import 'package:catchmypain/model/push_up_model.dart';
import 'package:catchmypain/painter/pose_painter.dart';
import 'package:catchmypain/util/utils.dart' as utils;
import 'package:camera/camera.dart';
import 'package:catchmypain/model/exercisedata.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_ml_kit/google_ml_kit.dart';
import 'package:google_mlkit_commons/google_mlkit_commons.dart';
import 'package:path/path.dart' as path;
import 'package:path_provider/path_provider.dart';

class CameraView extends ConsumerStatefulWidget {
  const CameraView(
      {Key? key,
      required this.posePainter,
      required this.customPaint,
      required this.onImage,
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

  @override
  ConsumerState<CameraView> createState() => _CameraViewState();
}

class _CameraViewState extends ConsumerState<CameraView> {
  static List<CameraDescription> _cameras = [];
  InputImage? currentCameraImage;
  CameraController? _controller;
  XFile? videoFile;
  int _cameraIndex = -1;
  double _currentZoomLevel = 1.0;
  double _minAvailableZoom = 1.0;
  double _maxAvailableZoom = 1.0;
  double _minAvailableExposureOffset = 0.0;
  double _maxAvailableExposureOffset = 0.0;
  double _currentExposureOffset = 0.0;
  bool _changingCameraLens = false;
  Duration myDuration = const Duration(seconds: 5);
  bool _isCountDownTimerStart = false;
  bool _isRecordTimerStart = false;
  Duration _recordDuration = const Duration(seconds: 0);
  ExerciseData exerciseData = ExerciseData(
      count: 0,
      poseState: '',
      angles: Angles(
          rightWES: 0,
          rightESH: 0,
          rightSHK: 0,
          rightHKA: 0,
          leftWES: 0,
          leftESH: 0,
          leftSHK: 0,
          leftHKA: 0),
      durationTime: '');
  PoseLandmark? p1;
  PoseLandmark? p2;
  PoseLandmark? p3;
  PoseLandmark? p4;
  PoseLandmark? p5;
  PoseLandmark? p6;
  Timer? _timer;
  Timer? _countdownTimer;
  Timer? _recordTimer;

  @override
  void initState() {
    super.initState();

    _initialize();
  }

  void _initialize() async {
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
      _startLiveFeed();
    }

    _timer = Timer.periodic(const Duration(milliseconds: 250), (timer) {
      printValue();
    });
  }

  void printValue() {
    final bloc = BlocProvider.of<PushUpCounter>(context);
    if (p1 != null &&
        p2 != null &&
        p3 != null &&
        p4 != null &&
        p5 != null &&
        p6 != null) {
      final rtaAngle = utils.angle(p1!, p2!, p3!);
      final ltaAngle = utils.angle(p4!, p5!, p6!);

      exerciseData.count = bloc.counter;
      exerciseData.poseState = bloc.state.name;
      exerciseData.angles.rightWES = rtaAngle;
      exerciseData.angles.leftWES = ltaAngle;
      print(
          'counter = ${exerciseData.count} /&/&/&/& poseState = ${exerciseData.poseState}  /&/&/&/& '
          'rtaAngle : ${exerciseData.angles.rightWES.toStringAsFixed(2)} /&/&/&/& ltaAngle: ${exerciseData.angles.leftWES.toStringAsFixed(2)}');
    }
  }

  @override
  void didUpdateWidget(covariant CameraView oldWidget) {
    if (widget.customPaint != oldWidget.customPaint) {
      if (widget.customPaint == null) return;
      final bloc = BlocProvider.of<PushUpCounter>(context);
      for (final pose in widget.posePainter!.poses) {
        PoseLandmark getPoseLandmark(PoseLandmarkType type1) {
          final PoseLandmark joint1 = pose.landmarks[type1]!;
          return joint1;
        }

        p1 = getPoseLandmark(PoseLandmarkType.rightShoulder);
        p2 = getPoseLandmark(PoseLandmarkType.rightElbow);
        p3 = getPoseLandmark(PoseLandmarkType.rightWrist);
        p4 = getPoseLandmark(PoseLandmarkType.leftShoulder);
        p5 = getPoseLandmark(PoseLandmarkType.leftElbow);
        p6 = getPoseLandmark(PoseLandmarkType.leftWrist);
      }

      //verification
      if (p1 != null &&
          p2 != null &&
          p3 != null &&
          p4 != null &&
          p5 != null &&
          p6 != null) {
        final rtaAngle = utils.angle(p1!, p2!, p3!);
        final ltaAngle = utils.angle(p4!, p5!, p6!);

        final rta = utils.isPushUp(rtaAngle, bloc.state);
        final lta = utils.isPushUp(ltaAngle, bloc.state);

        // If both arms satisfy push-up conditions
        if (rta != null && lta != null) {
          if (rta == PushUpState.init && lta == PushUpState.init) {
            bloc.setPushUpState(
                rta); // Assuming rta and lta have the same state
          } else if (rta == PushUpState.pushDown &&
              lta == PushUpState.pushDown) {
            bloc.setPushUpState(rta);
          } else if (rta == PushUpState.complete &&
              lta == PushUpState.complete) {
            //_saveImage(currentCameraImage!.bytes);
            bloc.increment();
            bloc.setPushUpState(PushUpState.pushUp); // Reset to neutral state
          }
        }
      }
    }
    super.didUpdateWidget(oldWidget);
  }

  void _saveImage(Uint8List? byteData) async {
    final directory = await getApplicationDocumentsDirectory();
    final imagePath = path.join(
        directory.path, 'pushup_${DateTime.now().millisecondsSinceEpoch}.png');
    final File imageFile = File(imagePath);

    // Save the image as a PNG file
    await imageFile.writeAsBytes(byteData!);
    print("Image saved to: $imagePath");
  }

  @override
  void dispose() {
    _recordTimer?.cancel();
    _countdownTimer?.cancel();
    _timer?.cancel();
    _stopLiveFeed();
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
    String strDigits(int n) => n.toString().padLeft(2, '0');
    String seconds = strDigits(myDuration.inSeconds.remainder(60));

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
                    child: widget.customPaint,
                  ),
          ),
          _isCountDownTimerStart == true ? _timerTxt(seconds) : _recordTxt(),
          _startRecordBtn(),
          _isRecordTimerStart == true ? _counterWidget() : const SizedBox(),
          _backButton(),
          _switchLiveCameraToggle(),
          //_detectionViewModeToggle(),
          _zoomControl(),
          _exposureControl(),
        ],
      ),
    );
  }

  Widget _recordTxt() {
    return _isRecordTimerStart
        ? Positioned(
            left: MediaQuery.sizeOf(context).width * 0.8,
            top: 50,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                        color: Colors.white.withOpacity(0.4), width: 4.0),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${_recordDuration.inMinutes}:${_recordDuration.inSeconds % 60}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }

  Widget _timerTxt(String sec) {
    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.5,
      right: 0,
      left: 0,
      child: Text(
        textAlign: TextAlign.center,
        sec,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 90,
        ),
      ),
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

  Widget _counterWidget() {
    final bloc = BlocProvider.of<PushUpCounter>(context);
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
            '${bloc.counter}',
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

  Widget _backButton() => Positioned(
        top: 40,
        left: 8,
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            heroTag: Object(),
            onPressed: () {
              BlocProvider.of<PushUpCounter>(context).reset();
              Navigator.of(context).pop();
            },
            backgroundColor: Colors.black54,
            child: const Icon(
              Icons.arrow_back_ios_outlined,
              size: 20,
            ),
          ),
        ),
      );

  Widget _detectionViewModeToggle() => Positioned(
        bottom: 8,
        left: 8,
        child: SizedBox(
          height: 50.0,
          width: 50.0,
          child: FloatingActionButton(
            heroTag: Object(),
            onPressed: widget.onDetectorViewModeChanged,
            backgroundColor: Colors.black54,
            child: const Icon(
              Icons.photo_library_outlined,
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

  Future _stopLiveFeed() async {
    await _controller?.stopImageStream();
    await _controller?.dispose();
    _controller = null;
  }

  Future _switchLiveCamera() async {
    setState(() => _changingCameraLens = true);
    _cameraIndex = (_cameraIndex + 1) % _cameras.length;

    await _stopLiveFeed();
    await _startLiveFeed();
    setState(() => _changingCameraLens = false);
  }

  void _processCameraImage(CameraImage image) {
    currentCameraImage = _inputImageFromCameraImage(image);
    final inputImage = _inputImageFromCameraImage(image);
    if (inputImage == null) return;
    widget.onImage(inputImage);
  }

  void _handleStartRecordBtn() {
    _isCountDownTimerStart = true;
    _countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final bloc = BlocProvider.of<PushUpCounter>(context);

    const reduceSecondsBy = 1;
    setState(() {
      final seconds = myDuration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        _countdownTimer!.cancel();
        _isCountDownTimerStart = false;
        bloc.counter = 0;
        _isRecordTimerStart = true;
        _handleRecordDuration();
      } else {
        myDuration = Duration(seconds: seconds);
      }
    });
  }

  void _handleRecordDuration() {
    _recordTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setRecordTime());
  }

  void setRecordTime() {
    const secondsBy = 1;
    setState(() {
      final seconds = _recordDuration.inSeconds + secondsBy;
      _recordDuration = Duration(seconds: seconds);
    });
  }

  void _handleStopRecordBtn() async {
    _recordTimer?.cancel();
    _isRecordTimerStart = false;
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
