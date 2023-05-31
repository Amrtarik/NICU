import 'package:flutter/material.dart';

class FeedBackItem extends StatelessWidget {
  FeedBackItem(
      {super.key,
      required this.feedbackMessage,
      required this.nameClient,
      required this.feedbackTime,
      required this.starsNumber});
  final String feedbackMessage;
  final String nameClient;
  final String feedbackTime;
  final int starsNumber;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      constraints: BoxConstraints(minHeight: 50),
      child: Column(children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(
              Icons.star,
              color: Color(0xFFFFC000),
              size: 20,
            ),
            SizedBox(
              width: 10,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  "$starsNumber",
                  style: TextStyle(
                      fontSize: 17,
                      fontWeight: FontWeight.bold,
                      color: Color(0xFF1E3D7B)),
                ),
                SizedBox(
                  height: 10,
                ),
                Text("$feedbackMessage"),
                SizedBox(
                  height: 10,
                ),
                Text("$nameClient,  $feedbackTime"),
              ],
            )
          ],
        ),
        Container(
          width: width * 5 / 6 - 40,
          child: Divider(
            color: Color(0xFF1E3D7B),
            height: 20,
            thickness: 2,
          ),
        )
      ]),
    );
  }
}
