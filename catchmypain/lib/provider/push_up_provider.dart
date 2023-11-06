import 'package:flutter_riverpod/flutter_riverpod.dart';

enum PushUpState {
  neutral,
  init,
  ArmsUp,
  ArmsDown,
  complete,
}

final pushUpCounterProvider =
    StateNotifierProvider<PushUpCounter, PushUpState>((ref) {
  return PushUpCounter();
});

class PushUpCounter extends StateNotifier<PushUpState> {
  PushUpCounter() : super(PushUpState.init);
  int counter = 0;

  void setPushUpState(PushUpState current) {
    state = current;
  }

  void increment() {
    counter++;
    state = state;
  }

  void reset() {
    counter = 0;
    state = state;
  }
}
