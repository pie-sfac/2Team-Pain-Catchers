import 'package:flutter_riverpod/flutter_riverpod.dart';

class Index extends StateNotifier<int> {
  Index() : super(0);

  set value(int index) => state = index;
}

final indexProvider = StateNotifierProvider((ref) => Index());
final cameraIndexProvider = StateNotifierProvider((ref) => Index());
