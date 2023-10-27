import 'package:flutter_bloc/flutter_bloc.dart';

enum PushUpState {
  neutral,
  init,
  pushUp,
  pushDown,
  complete,
}

class PushUpCounter extends Cubit<PushUpState> {
  PushUpCounter() : super(PushUpState.pushUp);
  int counter = 0;

  void setPushUpState(PushUpState current) {
    emit(current);
  }

  void increment() {
    counter++;
    emit(state);
  }

  void reset() {
    counter = 0;
    emit(state);
  }
}
