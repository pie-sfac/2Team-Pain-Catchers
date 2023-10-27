import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class ImageDisplayPage extends StatelessWidget {
  final Uint8List imageInUnit8List;

  const ImageDisplayPage(this.imageInUnit8List, {super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Display Image")),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 1. MemoryImage를 사용하여 Uint8List로부터 이미지 표시
            Image(
              image: MemoryImage(imageInUnit8List),
              width: 200, // 원하는 가로 크기
              height: 200, // 원하는 세로 크기
              fit: BoxFit.cover,
            ),
            const SizedBox(height: 20),
            // 2. Image.file을 사용하여 파일로부터 이미지 표시
            FutureBuilder<File>(
              future: _getImageFile(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.done &&
                    snapshot.hasData) {
                  return Image.file(
                    snapshot.data!,
                    width: 200,
                    height: 200,
                    fit: BoxFit.cover,
                  );
                } else if (snapshot.hasError) {
                  return Text("Error: ${snapshot.error}");
                }
                return const CircularProgressIndicator();
              },
            ),
          ],
        ),
      ),
    );
  }

  Future<File> _getImageFile() async {
    final tempDir = await getTemporaryDirectory();
    return File('${tempDir.path}/image.png');
  }
}
