import 'package:desktop_project/screens/feedback%20page/feedback_item.dart';
import 'package:flutter/material.dart';

class FeedBack extends StatefulWidget {
  const FeedBack({super.key});

  @override
  State<FeedBack> createState() => _FeedBackState();
}

class _FeedBackState extends State<FeedBack> {
  List<FeedBackItem> _feedbackItem = [
    FeedBackItem(
        feedbackMessage: "very good",
        nameClient: "Mohamed",
        feedbackTime: "12 march 2023",
        starsNumber: 5),
    FeedBackItem(
        feedbackMessage: "good",
        nameClient: "Mostafa",
        feedbackTime: "13 march 2023",
        starsNumber: 4),
    FeedBackItem(
        feedbackMessage: "This is very bad",
        nameClient: "Ahmed",
        feedbackTime: "13 march 2023",
        starsNumber: 1),
    FeedBackItem(
        feedbackMessage: "good",
        nameClient: "Mohamed",
        feedbackTime: "14 march 2023",
        starsNumber: 3),
    FeedBackItem(
        feedbackMessage: "very good",
        nameClient: "Mohamed",
        feedbackTime: "12 march 2023",
        starsNumber: 5),
    FeedBackItem(
        feedbackMessage: "very good",
        nameClient: "Mohamed",
        feedbackTime: "12 march 2023",
        starsNumber: 5),
    FeedBackItem(
        feedbackMessage: "very good",
        nameClient: "Mohamed",
        feedbackTime: "12 march 2023",
        starsNumber: 5),
    FeedBackItem(
        feedbackMessage: "very good",
        nameClient: "Mohamed",
        feedbackTime: "12 march 2023",
        starsNumber: 5),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        width: width * 5 / 6 - 16,
        height: height - 16,
        padding: EdgeInsets.fromLTRB(width / 22, 10, width / 22, 0),
        child: ListView.builder(
            itemCount: _feedbackItem.length,
            itemBuilder: (BuildContext context, int index) {
              return _feedbackItem[index];
            }));
  }
}
