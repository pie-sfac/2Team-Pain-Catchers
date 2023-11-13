// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class ExerciseCard extends StatelessWidget {
  const ExerciseCard({
    Key? key,
    required this.exercise,
  }) : super(key: key);

  final String exercise;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 200,
        height: 200,
        padding: const EdgeInsets.symmetric(horizontal: 10.0),
        decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.all(Radius.circular(20)),
            boxShadow: [
              BoxShadow(
                color: Color(0xFFE7E7E7),
                spreadRadius: 5,
                blurRadius: 7,
                offset: Offset(0, 3), // changes position of shadow
              ),
            ]),
        child: IconButton(
          color: Colors.white,
          icon: Image.asset('asset/images/$exercise.png', fit: BoxFit.cover),
          onPressed: () => context.push('/camera/$exercise'),
        ));
  }
}
