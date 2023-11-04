import 'dart:convert';

import 'package:catchmypain/model/exercisedata.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hive_flutter/hive_flutter.dart';

final hiveBoxProvider = FutureProvider<Box>((ref) async {
  var box = await Hive.openBox('myBox');
  return box;
});

final exerciseDataProvider = FutureProvider<List<ExerciseData>>((ref) async {
  final box = await ref.read(hiveBoxProvider.future);

  List<ExerciseData> exerciseDataList = [];
  List<dynamic> hiveData = box.get('pushupData') ?? [];

  for (var item in hiveData) {
    var exeDataList = jsonDecode(item as String);
    if (exeDataList != null) {
      for (var exeData in exeDataList) {
        var data = ExerciseData.fromJson(exeData);
        exerciseDataList.add(data);
      }
    }
  }

  return exerciseDataList;
});

final stdExerciseDataProvider = FutureProvider<List<ExerciseData>>((ref) async {
  final box = await ref.read(hiveBoxProvider.future);

  List<ExerciseData> stdExerciseDataList = [];
  List<dynamic> hiveData = box.get('pushupData') ?? [];

  for (var item in hiveData) {
    var exeDataList = jsonDecode(item as String);
    if (exeDataList != null && exeDataList is List && exeDataList.isNotEmpty) {
      var lastExeData = exeDataList.last;
      var data = ExerciseData.fromJson(lastExeData);
      stdExerciseDataList.add(data);
    }
  }

  return stdExerciseDataList;
});

final isTappedListProvider = StateProvider<List<bool>>((ref) {
  final exerciseData = ref.watch(exerciseDataProvider);
  return exerciseData.maybeWhen(
    data: (exerciseDataList) =>
        List.generate(exerciseDataList.length, (index) => false),
    orElse: () => [],
  );
});
