// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

class CenterRecommendCardWidget extends StatelessWidget {
  const CenterRecommendCardWidget({
    Key? key,
    required this.imgPath,
    required this.recommendTxt,
  }) : super(key: key);
  final String imgPath;
  final String recommendTxt;
  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(8),
            border: Border.all(color: Colors.grey)),
        height: MediaQuery.of(context).size.height * 0.6,
        width: MediaQuery.of(context).size.width * 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      border: Border.all(color: Colors.transparent)),
                  width: MediaQuery.of(context).size.width * 0.1,
                  height: MediaQuery.of(context).size.height * 0.1,
                  child: Image.asset(imgPath, fit: BoxFit.fill)),
              const SizedBox(
                width: 20,
              ),
              SizedBox(
                width: 200,
                child: Text(
                  recommendTxt,
                  overflow: TextOverflow.ellipsis,
                ),
              )
            ],
          ),
        ));
  }
}
