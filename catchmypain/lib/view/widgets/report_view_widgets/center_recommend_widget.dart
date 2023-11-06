import 'package:flutter/material.dart';

class CenterRecommendWdiget extends StatelessWidget {
  const CenterRecommendWdiget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Icon(Icons.circle, color: Colors.blue, size: 10),
              SizedBox(width: 10),
              Expanded(
                child: Text(
                  '센터 추천 링크',
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
        Container(
          padding: const EdgeInsets.all(20),
          alignment: Alignment.centerLeft,
          decoration: BoxDecoration(
            color: const Color.fromRGBO(251, 251, 251, 1),
            borderRadius: BorderRadius.circular(10),
            boxShadow: [
              BoxShadow(
                color: const Color.fromRGBO(128, 128, 128, 1)
                    .withOpacity(0.5), // Shadow color
                spreadRadius: 1,
                blurRadius: 5,
                offset: const Offset(0, 2), // Changes position of shadow
              ),
            ],
          ),
        ),
      ],
    );
  }
}
