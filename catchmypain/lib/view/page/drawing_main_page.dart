// ignore_for_file: prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'dart:io';

import 'package:catchmypain/api/getlocaldata.dart';
import 'package:flutter/material.dart';
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
                    child: FutureBuilder(
                      future: GetLocalData.getPoseImgFilePath(),
                      builder: (BuildContext context,
                          AsyncSnapshot<String> snapshot) {
                        if (snapshot.connectionState == ConnectionState.done) {
                          if (snapshot.hasData) {
                            final file = File(snapshot.data!);
                            return FutureBuilder<bool>(
                              future: file.exists(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<bool> fileSnapshot) {
                                if (fileSnapshot.connectionState ==
                                    ConnectionState.done) {
                                  if (fileSnapshot.hasData &&
                                      fileSnapshot.data == true) {
                                    // 파일이 존재할 경우 이미지를 표시합니다.
                                    return Image.file(file, width: 70);
                                  } else {
                                    // 파일이 존재하지 않을 경우 메시지를 표시합니다.
                                    return const Text('파일을 찾을 수 없습니다.');
                                  }
                                }
                                // 파일 존재 여부 확인 중
                                return const CircularProgressIndicator();
                              },
                            );
                          } else if (snapshot.hasError) {
                            return Text('Error: ${snapshot.error}');
                          }
                        }
                        // 경로 가져오는 중
                        return const CircularProgressIndicator();
                      },
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 12.0),
                    child: Container(
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        color: Colors.red,
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'N',
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 10,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
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
          ],
        ),
      ),
    );
  }
}
