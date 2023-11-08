import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ExerciseAbilityCardWidget extends StatelessWidget {
  const ExerciseAbilityCardWidget(
      {super.key, required this.imgPath, required this.abilityType});

  final String imgPath;
  final String abilityType;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(10)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 2,
              blurRadius: 2,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              abilityType,
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
          ),
          SizedBox(
              height: MediaQuery.of(context).size.height * 0.225,
              width: MediaQuery.of(context).size.width * 0.3,
              child: Image.asset(imgPath)),
        ],
      ),
    );
  }
}
