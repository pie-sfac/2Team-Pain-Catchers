import 'package:hive_flutter/hive_flutter.dart';
import 'package:riverpod/riverpod.dart';

final hiveBoxProvider = FutureProvider.autoDispose<Box>((ref) async {
  var box = await Hive.openBox('myBox');
  ref.onDispose(() {
    box.close();
  });
  return box;
});
