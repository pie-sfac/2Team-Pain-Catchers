import 'package:flutter_riverpod/flutter_riverpod.dart';

//라벨 유무 설정
final checkboxProvider = StateProvider<bool>((ref) => true);
//선 아래 색 유무
final filledProvider = StateProvider<bool>((ref) => true);
//직선
final lineProvider = StateProvider<bool>((ref) => true);
