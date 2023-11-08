// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:catchmypain/view/widgets/show_drawing_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DrawingMainPage extends ConsumerWidget {
  const DrawingMainPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            InkWell(
              onTap: () => context.push('/drawing'),
              child: Card(
                child: Row(children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 12.0),
                    child: Icon(Icons.account_circle),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text("신주희 회원님께서 사진을 보내셨습니다"),
                  ),
                  Spacer(),
                  Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Image.asset(
                      'asset/images/paint_pose.png',
                      width: 70,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Text(
                      'new!',
                      style: TextStyle(color: Color.fromRGBO(45, 98, 234, 1)),
                    ),
                  ),
                ]),
              ),
            ),
            Card(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("도희정 회원님께서 사진을 보내셨습니다"),
                )
              ]),
            ),
            Card(
              child: Row(children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(Icons.account_circle),
                ),
                Padding(
                  padding: const EdgeInsets.all(12),
                  child: Text("이은진 회원님께서 사진을 보내셨습니다"),
                )
              ]),
            ),
            ShowDrawing(),
          ],
        ),
      ),
    );
  }
}
