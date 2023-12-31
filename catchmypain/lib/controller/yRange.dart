import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/model/painHistory_model.dart';
import 'package:catchmypain/util/utils.dart' as utils;

class YRange {
  double _minLevel = 0;
  double _maxLevel = 0;
  List<double> _levels = []; //y축 범위
  List<double> _reversed_Levels = [];
  final int _dividerNum = 5;

  //데이터 중 최소값, 최대값 찾음
  findMinMaxLevels(List<PainHistoryModel> history) {
    if (history.isEmpty) {
      return null;
    }

    _minLevel = history[0].level.toDouble();
    _maxLevel = history[0].level.toDouble();

    for (var entry in history) {
      int level = entry.level;
      if (level < _minLevel) {
        _minLevel = level.toDouble();
      }
      if (level > _maxLevel) {
        _maxLevel = level.toDouble();
      }
    }
    var ranMin = _minLevel - 1;
    var ranMax = _maxLevel + 1;
    _levels =
        generateValuesInRange(ranMin, ranMax, (ranMax - ranMin) / _dividerNum);
    _reversed_Levels = _levels.reversed.toList();
    return _reversed_Levels;
  }

  findMinMaxExer(List<dynamic> exerciseDataList, int dataNum) {
    if (exerciseDataList.isEmpty) {
      return null;
    }

    _minLevel = double.parse(utils
        .angle(exerciseDataList[0].ltShoulder, exerciseDataList[0].ltElbow,
            exerciseDataList[0].ltWrist)
        .toStringAsFixed(1));
    _maxLevel = double.parse(utils
        .angle(exerciseDataList[0].ltShoulder, exerciseDataList[0].ltElbow,
            exerciseDataList[0].ltWrist)
        .toStringAsFixed(1));

    for (var entry in exerciseDataList.take(dataNum)) {
      double angle = double.parse(utils
          .angle(entry.ltShoulder, entry.ltElbow, entry.ltWrist)
          .toStringAsFixed(1));
      if (angle < _minLevel) {
        _minLevel = angle.toDouble();
      }
      if (angle > _maxLevel) {
        _maxLevel = angle.toDouble();
      }
    }
    var ranMin = _minLevel - 1;
    var ranMax = _maxLevel + 1;
    _levels =
        generateValuesInRange(ranMin, ranMax, (ranMax - ranMin) / _dividerNum);
    _reversed_Levels = _levels.reversed.toList();
    return _reversed_Levels;
  }

  findMinMaxCnt(List<dynamic> stdExerciseDataList, int dataNum) {
    if (stdExerciseDataList.isEmpty) {
      return null;
    }

    _minLevel = stdExerciseDataList[0].count.toDouble();
    _maxLevel = stdExerciseDataList[0].count.toDouble();
    for (var entry in stdExerciseDataList.take(dataNum)) {
      int count = entry.count;
      if (count < _minLevel) {
        _minLevel = count.toDouble();
      }
      if (count > _maxLevel) {
        _maxLevel = count.toDouble();
      }
    }

    var ranMin = _minLevel;
    var ranMax = _maxLevel + 1;
    _levels =
        generateValuesInRange(ranMin, ranMax, (ranMax - ranMin) / _dividerNum);
    _reversed_Levels = _levels.reversed.toList();
    return _reversed_Levels;
  }

  //데이터 중에서 최소값과 최대값 사이의 범위로 리스트 만들기
  //y축 범위
  generateValuesInRange(double minValue, double maxValue, double interval) {
    for (double value = minValue; value <= maxValue; value += interval) {
      _levels.add(double.parse(value.toStringAsFixed(2)));
    }
    return _levels;
  }
}
