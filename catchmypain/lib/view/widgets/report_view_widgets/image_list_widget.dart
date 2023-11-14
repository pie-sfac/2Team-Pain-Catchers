// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catchmypain/model/mediaRecord_model.dart';
import 'package:flutter/material.dart';

class ImageListWidget extends StatelessWidget {
  const ImageListWidget({
    Key? key,
    required this.mediaRecordModel,
  }) : super(key: key);
  final List<MediaRecordModel> mediaRecordModel;
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
              // Text is now an individual widget, not wrapped in Expanded
              Text(
                '신주희 회원님 영상 및 이미지',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 15,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(
                height: 30,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 100,
          width: MediaQuery.of(context).size.width,
          child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              return Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  mediaRecordModel[index].thumbnailUrl,
                  width: 100,
                  height: 100,
                  fit: BoxFit.cover,
                ),
              );
            },
            itemCount: mediaRecordModel.length,
          ),
        ),
      ],
    );
  }
}
