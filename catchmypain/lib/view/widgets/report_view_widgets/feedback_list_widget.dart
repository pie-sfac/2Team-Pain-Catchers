import 'package:flutter/material.dart';

class FeedBackListWidget extends StatefulWidget {
  const FeedBackListWidget({super.key});

  @override
  State<FeedBackListWidget> createState() => _FeedBackListWidgetState();
}

class _FeedBackListWidgetState extends State<FeedBackListWidget> {
  bool isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
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
                    '김파이 선생님 피드백',
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
            padding: const EdgeInsets.all(16),
            alignment: Alignment.centerLeft,
            decoration: BoxDecoration(
              color: const Color.fromRGBO(251, 251, 251, 1),
              borderRadius: BorderRadius.circular(10),
              boxShadow: const [
                BoxShadow(
                  color: Color(0xFFE7E7E7), // Shadow color
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: Offset(0, 2), // Changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '오늘 고생하셨습니다!\n힙힌지 연습과 코어 활성화 운동 연습\n벤치프레스 빈봉 연습 해주세요!\n힙힌지 - 고관절이 경첩처럼 닫히는 느낌으로 연습해주세요. 허리가 말리지 않도록 집중해주세요!\n\n코어 - 배꼽이 스마일(넓어진다는 느낌. 추상적 표현이긴 합니다 ..ㅎㅎ 그리고 배꼽이 바닥을 꾹 눌러준다는 느낌)과 갈비뼈를 아래로 닫아주는 느낌(윗몸일으키기 살짝 하면 갈비가 닫혀요! 그 상태 유지하며 고개만 조심히 내리기)\n\n벤치프레스 - 날개뼈 패킹 풀리지 않도록 유지하며 팔꿈치 벌어지지 않도록 하기 (어깨에 무리가 갑니다) \n\n개인운동 자주 나오실 수 있으실 때 나오시고 언제든 다 물어봐주세요!! 고생하셨습니다',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  maxLines: isExpanded ? null : 2,
                  overflow:
                      isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                ),
                const Divider(
                  color: Color(0xFFCFCFCF),
                ),
                IconButton(
                  onPressed: () {
                    isExpanded = !isExpanded;
                    setState(() {});
                  },
                  icon: Icon(isExpanded
                      ? Icons.arrow_drop_up_rounded
                      : Icons.arrow_drop_down_rounded),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
