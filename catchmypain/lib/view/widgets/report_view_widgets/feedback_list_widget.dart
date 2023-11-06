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
              boxShadow: [
                BoxShadow(
                  color: const Color.fromRGBO(128, 128, 128, 1)
                      .withOpacity(0.5), // Shadow color
                  spreadRadius: 1,
                  blurRadius: 5,
                  offset: const Offset(0, 2), // Changes position of shadow
                ),
              ],
            ),
            child: Column(
              children: [
                Text(
                  '회원님 어깨가 빨리 개선되기 위해 제가 오늘 하신 운동이랑 저희가 제안드리는 운동 처방 같이 드렸습니다. 꼭 회원님 하루에 10회씩 2세트씩 해주세요.회원님 어깨가 빨리 개선되기 위해 제가 오늘 하신 운동이랑 저희가 제안드리는 운동 처방 같이 드렸습니다. 꼭 회원님 하루에 10회씩 2세트씩 해주세요.회원님 어깨가 빨리 개선되기 위해 제가 오늘 하신 운동이랑 저희가 제안드리는 운동 처방 같이 드렸습니다. 꼭 회원님 하루에 10회씩 2세트씩 해주세요.',
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 14,
                  ),
                  maxLines: isExpanded ? null : 2,
                  overflow:
                      isExpanded ? TextOverflow.visible : TextOverflow.ellipsis,
                ),
                const Divider(
                  color: Colors.black,
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
