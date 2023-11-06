import 'package:flutter/material.dart';

class PainChangeWidget extends StatelessWidget {
  const PainChangeWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
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
                  '통증 변화',
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
