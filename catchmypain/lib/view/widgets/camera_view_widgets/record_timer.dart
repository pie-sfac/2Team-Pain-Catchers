// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class RecordTimer extends StatelessWidget {
  const RecordTimer({
    Key? key,
    required this.isRecordTimerStart,
    required this.recordDuration,
  }) : super(key: key);

  final bool isRecordTimerStart;
  final Duration recordDuration;
  @override
  Widget build(BuildContext context) {
    return isRecordTimerStart
        ? Positioned(
            left: MediaQuery.sizeOf(context).width * 0.8,
            top: 50,
            right: 0,
            child: Column(
              children: [
                Container(
                  width: 125,
                  decoration: BoxDecoration(
                    color: Colors.black54,
                    border: Border.all(
                        color: Colors.white.withOpacity(0.4), width: 4.0),
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                  ),
                  child: Text(
                    textAlign: TextAlign.center,
                    "${recordDuration.inMinutes}:${recordDuration.inSeconds % 60}",
                    style: const TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontSize: 45,
                    ),
                  ),
                ),
              ],
            ),
          )
        : const SizedBox();
  }
}
