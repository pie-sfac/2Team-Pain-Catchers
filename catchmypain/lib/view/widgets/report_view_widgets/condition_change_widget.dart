import 'package:flutter/material.dart';

class ConditionChangeWidget extends StatelessWidget {
  const ConditionChangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.circle, color: Colors.blue, size: 10),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '컨디션 변화',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
