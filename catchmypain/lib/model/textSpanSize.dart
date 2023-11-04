import 'package:flutter/material.dart';

class TextSizeState {
  final double fontSize;
  final Size textSpanSize;
  final double iconSize;

  TextSizeState({
    required this.fontSize,
    required this.textSpanSize,
    required this.iconSize,
  });

  // Create a copy of the state with updated values
  TextSizeState copyWith({
    double? fontSize,
    Size? textSpanSize,
    double? iconSize,
  }) {
    return TextSizeState(
      fontSize: fontSize ?? this.fontSize,
      textSpanSize: textSpanSize ?? this.textSpanSize,
      iconSize: iconSize ?? this.iconSize,
    );
  }
}
