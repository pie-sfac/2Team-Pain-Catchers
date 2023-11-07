import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/model/painHistory_model.dart';

class YRange {
  double _minLevel = 0;
  double _maxLevel = 0;
  List<double> _levels = []; //y축 범위
  List<double> _reversed_Levels = [];
  int _dividerNum = 5;

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
    print(_minLevel);
    print(_maxLevel);
    var ranMin = _minLevel - 1;
    var ranMax = _maxLevel + 1;
    _levels =
        generateValuesInRange(ranMin, ranMax, (ranMax - ranMin) / _dividerNum);
    _reversed_Levels = _levels.reversed.toList();
    return _reversed_Levels;
  }

  findMinMaxExer(List<ExerciseData> history) {
    if (history.isEmpty) {
      return null;
    }

    _minLevel = history[0].angles.leftWES.toDouble();
    _maxLevel = history[0].angles.leftWES.toDouble();

    for (var entry in history.take(6)) {
      double level = entry.angles.leftWES;
      if (level < _minLevel) {
        _minLevel = level.toDouble();
      }
      if (level > _maxLevel) {
        _maxLevel = level.toDouble();
      }
    }
    print(_minLevel);
    print(_maxLevel);
    var ranMin = _minLevel - 1;
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
    print(_levels);
    return _levels;
  }
}
