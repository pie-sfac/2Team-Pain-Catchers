// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CountDownTimer extends StatelessWidget {
  const CountDownTimer({
    Key? key,
    required this.myDuration,
  }) : super(key: key);

  final Duration myDuration;
  @override
  Widget build(BuildContext context) {
    String strDigits(int n) => n.toString().padLeft(2, '0');
    String seconds = strDigits(myDuration.inSeconds.remainder(60));

    return Positioned(
      bottom: MediaQuery.of(context).size.height * 0.5,
      right: 0,
      left: 0,
      child: Text(
        textAlign: TextAlign.center,
        seconds,
        style: const TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold,
          fontSize: 90,
        ),
      ),
    );
  }
}
