import 'package:flutter/material.dart';

class ImageListWidget extends StatelessWidget {
  const ImageListWidget({super.key});

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
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset('asset/images/Thumbnails.png', width: 110),
            const SizedBox(width: 10),
            Image.asset('asset/images/Thumbnails.png', width: 110),
            const SizedBox(
                width:
                    10), // Provide some horizontal spacing between the images
            Image.asset('asset/images/Thumbnails.png', width: 110),
          ],
        )
      ],
    );
  }
}
