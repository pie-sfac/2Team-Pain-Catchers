import 'package:flutter/material.dart';

class AdvertisementWidget extends StatelessWidget {
  const AdvertisementWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.35,
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color.fromRGBO(255, 255, 255, 1),
        borderRadius: BorderRadius.circular(4),
      ),
      child: Center(
        child: Container(
          width: double.infinity,
          padding: const EdgeInsets.all(15),
          decoration: BoxDecoration(
            color: const Color.fromRGBO(8, 51, 160, 1),
            borderRadius: BorderRadius.circular(4),
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "친구에게 내 레포트 공유하고",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Text(
                "PT 1회권 무료로 받자!",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 25,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const Align(
                alignment: Alignment.centerRight,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.end, // 오른쪽 정렬
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Image(
                          image: AssetImage('asset/images/workout.png'),
                          color: Color.fromRGBO(235, 241, 255, 1),
                          width:
                              24, // Set the width of the image to match an icon size
                          height:
                              24, // Set the height of the image to match an icon size
                        ),
                        SizedBox(width: 4),
                        Text(
                          "PT 1회권은 공유받은 친구가",
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 10,
                          ),
                        ),
                      ],
                    ),
                    Text(
                      "우리 센터에 등록 시 제공됩니다.",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                    Text(
                      "센터 측에 소개 내용을 알려주세요!",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 12),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  foregroundColor: Colors.white,
                  backgroundColor: const Color.fromRGBO(102, 145, 255, 1),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  elevation: 5,
                ),
                onPressed: () {},
                child: const Text("▶지금 바로 공유하기"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
