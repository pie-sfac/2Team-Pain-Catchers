import 'package:flutter_riverpod/flutter_riverpod.dart';

class CheckboxState {
  final bool labelCheck;

  CheckboxState({this.labelCheck = true});
}

class CheckboxNotifier extends StateNotifier<CheckboxState> {
  CheckboxNotifier() : super(CheckboxState());

  void setLabelCheck(bool newValue) {
    state = CheckboxState(labelCheck: newValue);
  }
}

final checkboxProvider =
    StateNotifierProvider<CheckboxNotifier, CheckboxState>((ref) {
  return CheckboxNotifier();
});
