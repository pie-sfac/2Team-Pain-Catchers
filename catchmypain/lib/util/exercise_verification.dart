import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/provider/push_up_provider.dart';
import 'package:catchmypain/util/utils.dart' as utils;
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:google_ml_kit/google_ml_kit.dart';

class ExerciseVerification {
  WidgetRef ref;
  ExerciseVerification(this.ref);
  void ArmsUp(
    PoseLandmark rtShoulder,
    PoseLandmark rtElbow,
    PoseLandmark rtWrist,
    PoseLandmark ltShoulder,
    PoseLandmark ltElbow,
    PoseLandmark ltWrist,
  ) {
    final rtaAngle = utils.angle(
        CoordinateLandmark.fromPoseLandMark(rtShoulder),
        CoordinateLandmark.fromPoseLandMark(rtElbow),
        CoordinateLandmark.fromPoseLandMark(rtWrist));
    final ltaAngle = utils.angle(
        CoordinateLandmark.fromPoseLandMark(ltShoulder),
        CoordinateLandmark.fromPoseLandMark(ltElbow),
        CoordinateLandmark.fromPoseLandMark(ltWrist));
    final rta = utils.isPushUp(rtaAngle, ref.watch(pushUpCounterProvider));
    final lta = utils.isPushUp(ltaAngle, ref.watch(pushUpCounterProvider));
    // If both arms satisfy push-up conditions
    if (rta != null && lta != null) {
      if (rta == PushUpState.init && lta == PushUpState.init) {
        ref
            .read(pushUpCounterProvider.notifier)
            .setPushUpState(rta); // Assuming rta and lta have the same state
      } else if (rta == PushUpState.ArmsDown && lta == PushUpState.ArmsDown) {
        ref.read(pushUpCounterProvider.notifier).setPushUpState(rta);
      } else if (rta == PushUpState.complete && lta == PushUpState.complete) {
        //_saveImage(currentCameraImage!.bytes);
        ref.read(pushUpCounterProvider.notifier).increment();
        ref
            .read(pushUpCounterProvider.notifier)
            .setPushUpState(PushUpState.ArmsUp); // Reset to neutral state
      }
    }
  }
}
