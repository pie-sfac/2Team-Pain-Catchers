import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ConditionChangeCardWidget extends StatelessWidget {
  const ConditionChangeCardWidget(
      {super.key,
      required this.imgPath,
      required this.condition,
      required this.cndDate});
  final String imgPath;
  final String condition;
  final String cndDate;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Image.asset(imgPath),
        ),
        Text(
          condition,
          style: const TextStyle(color: Colors.blue),
        ),
        Text(cndDate),
      ],
    );
  }
}
