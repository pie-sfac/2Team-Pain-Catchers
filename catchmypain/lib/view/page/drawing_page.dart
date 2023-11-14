// ignore_for_file: prefer_const_constructors

import 'dart:convert';
import 'package:catchmypain/model/sketch.dart';
import 'dart:io';
import 'package:catchmypain/api/getlocaldata.dart';
import 'package:catchmypain/provider/drawing_provider.dart';
import 'package:catchmypain/view/widgets/drawing_canvas.dart';
import 'package:catchmypain/view/widgets/drawing_menu.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:go_router/go_router.dart';

class DrawingPage extends ConsumerWidget {
  const DrawingPage({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final bool isPaletteOpen = ref.watch(paletteProvider);
    final bool isSketchOn = ref.watch(showProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: Text('Drawing'),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(children: [
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Icon(
                  Icons.person_4_rounded,
                  color: Colors.black,
                ),
              ),
              const Padding(
                padding: EdgeInsets.all(4.0),
                child: Text(
                  '최상현',
                  style: TextStyle(color: Colors.black),
                ),
              ),
              Container(
                decoration: BoxDecoration(
                    color: Colors.grey.shade300,
                    borderRadius: BorderRadius.circular(5)),
                child: const Padding(
                  padding: EdgeInsets.all(4.0),
                  child: Text(
                    '플랜 이용중',
                    style: TextStyle(color: Colors.blue),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            ]),
          ),
          const Center(
            child: Text(
              '|',
              style: TextStyle(color: Colors.black),
              textAlign: TextAlign.center,
            ),
          ),
          IconButton(
              onPressed: () => {},
              icon: const Icon(
                Icons.notifications,
                color: Colors.black,
              )),
        ],
        leading: Image.asset('asset/images/wix_logo.png'),
        leadingWidth: 80,
      ),
      body: Column(
        children: [
          AppBar(
              foregroundColor: Colors.black,
              backgroundColor: Colors.white,
              leading: InkWell(
                  child: Icon(Icons.navigate_before),
                  onTap: () {
                    context.pop();
                  }),
              title: Text("신주희 회원님"),
              actions: [
                isSketchOn ? Icon(Icons.edit) : Icon(Icons.edit_off),
                Switch(
                  activeColor: Color.fromRGBO(45, 98, 234, 1),
                  inactiveTrackColor: Color.fromRGBO(191, 209, 255, 1),
                  value: isSketchOn,
                  onChanged: (value) {
                    ref.read(showProvider.notifier).state = value;
                  },
                ),
                SizedBox(
                  width: 8,
                )
              ]),
          Expanded(
            child: Stack(
              children: [
                FutureBuilder(
                  future: GetLocalData.getPoseImgFilePath(),
                  builder:
                      (BuildContext context, AsyncSnapshot<String> snapshot) {
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
                                return Image.file(
                                  file,
                                  width: MediaQuery.of(context).size.width,
                                  height: MediaQuery.of(context).size.height,
                                );
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
                Visibility(
                  maintainState: true,
                  visible: isSketchOn,
                  child: SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: DrawingCanvas(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                    ),
                  ),
                ),
                Positioned(
                  top: 12,
                  left: 12,
                  child: Column(
                    children: [
                      Visibility(
                        visible: !isPaletteOpen,
                        child: FloatingActionButton(
                            heroTag: Object(),
                            backgroundColor: Color.fromRGBO(45, 98, 234, 1),
                            onPressed: () =>
                                ref.read(paletteProvider.notifier).state = true,
                            child: Icon(Icons.palette)),
                      ),
                      Visibility(
                        visible: isPaletteOpen,
                        child: GestureDetector(
                            onHorizontalDragEnd: (_) => ref
                                .read(paletteProvider.notifier)
                                .state = false,
                            child: DrawingMenu()),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 12,
                  bottom: 32,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      FloatingActionButton(
                          heroTag: Object(),
                          backgroundColor: Color.fromRGBO(45, 98, 234, 1),
                          onPressed: () {
                            if (ref.read(sketchesProvider).isNotEmpty) {
                              ref.read(sketchesProvider.notifier).state = [];
                              ref.read(stackProvider.notifier).state = [];
                            }
                          },
                          child: Icon(Icons.refresh)),
                      SizedBox(
                        height: 8,
                      ),
                      FloatingActionButton(
                          heroTag: Object(),
                          backgroundColor: Color.fromRGBO(45, 98, 234, 1),
                          child: Icon(Icons.save),
                          onPressed: () {
                            ref.read(saveProvider.notifier).state =
                                ref.read(sketchesProvider.notifier).state;
                            ref.read(jsonProvider.notifier).state = sketchesToJson(ref.read(saveProvider)); //json encode
                            
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                  behavior: SnackBarBehavior.floating,
                                  margin: EdgeInsets.only(bottom: 12),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(4)),
                                  content: Text('수정한 내용을 저장했습니다.')),
                              // Adjust the border radius here
                            );
                            context.pop();
                          }),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
