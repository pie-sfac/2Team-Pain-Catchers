import 'package:flutter/material.dart';

class TextSizeControl {
  late double _fontSize;
  late Size _textSpanSize;
  late double _iconSize;

  //텍스트 영역 크기
  //텍스트 영역의 크기와 icon의 크기를 동일하게 하기 위해
  Size textSize(String text, TextStyle style) {
    final painter = TextPainter(
      text: TextSpan(text: text, style: style),
      textDirection: TextDirection.ltr,
    )..layout(minWidth: 0, maxWidth: double.infinity);
    return painter.size;
  }

  iconSize(String text, String value) {
    value != '' ? _fontSize = double.parse(value) : _fontSize = 15;

    _textSpanSize = textSize(text, TextStyle(fontSize: _fontSize));
    _iconSize = _textSpanSize.height;
    return _iconSize;
  }
}
