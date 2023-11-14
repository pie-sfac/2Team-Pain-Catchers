// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:catchmypain/model/archiveLink_model.dart';
import 'package:catchmypain/view/widgets/report_view_widgets/center_recommend_card_widget.dart';
import 'package:flutter/material.dart';

class CenterRecommendWidget extends StatelessWidget {
  const CenterRecommendWidget({
    Key? key,
    required this.archiveLinkList,
  }) : super(key: key);
  final List<ArchiveLinkModel> archiveLinkList;
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
                    '센터 추천 링크',
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
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height * 0.35,
            padding: const EdgeInsets.all(20),
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
            child: GridView.builder(
              itemBuilder: (context, index) {
                return CenterRecommendCardWidget(
                  imgPath: 'asset/images/center_recommend_1.png',
                  recommendTxt: archiveLinkList[index].title,
                );
              },
              itemCount: archiveLinkList.length,
              scrollDirection: Axis.horizontal,
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  maxCrossAxisExtent: 200,
                  childAspectRatio: 1 / 4,
                  crossAxisSpacing: 20,
                  mainAxisSpacing: 20),
            ),
          ),
        ],
      ),
    );
  }
}
