import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class SharedReportCardWidget extends StatelessWidget {
  const SharedReportCardWidget(
      {super.key, required this.copyTxt, required this.iconColor});
  final String copyTxt;
  final Color iconColor;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 1),
              color: Colors.transparent,
              shape: BoxShape.circle,
            ),
            child: IconButton(
              iconSize: 28,
              color: iconColor,
              icon: const Icon(Icons.link),
              onPressed: () {},
            ),
          ),
        ),
        Text(copyTxt),
      ],
    );
  }
}
