// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class FeedBackListWidget extends StatefulWidget {
  const FeedBackListWidget({
    Key? key,
    required this.feedBack,
  }) : super(key: key);

  final String feedBack;
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
                  widget.feedBack,
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
