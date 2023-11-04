import 'dart:io';
import 'package:flutter/material.dart';
import 'package:path/path.dart' as path;

class ExerciseVideoListTile extends StatelessWidget {
  const ExerciseVideoListTile({
    Key? key,
    required this.thumbnailPath,
  }) : super(key: key);
  final String thumbnailPath;
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: const BorderRadius.all(Radius.circular(20)),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.5),
              spreadRadius: 5,
              blurRadius: 7,
              offset: const Offset(0, 3),
            ),
          ]),
      child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.height * 0.225,
              width: MediaQuery.of(context).size.width * 0.175,
              child: Image.file(
                File(thumbnailPath),
                fit: BoxFit.cover,
                errorBuilder: (BuildContext context, Object exception,
                    StackTrace? stackTrace) {
                  return const Icon(Icons.error); // 이미지 로드 실패 시 아이콘 표시
                },
              ),
            ),
            Text(path.basename(thumbnailPath.split('_')[0])),
          ]),
    );
  }
}
