// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:desktop_project/component/special_button.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import 'special_button.dart';

class ChildItem extends StatelessWidget {
  final String name;
  final int age;
  final String gender;
  final String documentId;
  final Function() leftOnTap;

  ChildItem({
    Key? key,
    required this.name,
    required this.age,
    required this.gender,
    required this.documentId,
    required this.leftOnTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(10),
      width: width * 5 / 6 - 16,
      margin: EdgeInsets.all(20),
      constraints: BoxConstraints(minHeight: 20),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 12,
                child: Column(children: [
                  dataItem("Name", "$name"),
                  dataItem("Age", "$age days"),
                  dataItem("Gender", "$gender"),
                ]),
              ),
              Expanded(
                child: SpecialButton(
                  borderColor: Color(0xff1C3879),
                  bodyColor: Colors.white,
                  text: "Left",
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          backgroundColor: Colors.blueGrey,
                          content: Text(
                              'Are you sure the child has left the NICU?',
                              style: TextStyle(color: Colors.white)),
                          actions: <Widget>[
                            TextButton(
                              onPressed: () async {
                                await FirebaseService.updateChildStatus(documentId, 'left');
                                leftOnTap();
                              },
                              child: Text('Yes',
                                  style: TextStyle(color: Colors.white)),
                            ),
                            MaterialButton(
                              onPressed: () {
                                Navigator.pop(context, false);
                              },
                              child: Text('No',
                                  style: TextStyle(color: Colors.white)),
                            ),
                          ],
                        );
                      },
                    );
                  },
                ),
              ),
            ],
          ),
          Container(
            width: width * 5 / 6 - 40,
            child: Divider(
              color: Color(0xFF1E3D7B),
              height: 10,
              thickness: 2,
            ),
          )
        ],
      ),
    );
  }

  Widget dataItem(String key, String value) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 3),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "$key: ",
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              overflow: TextOverflow.visible,
            ),
          ),
          Expanded(
            child: Container(
                constraints: BoxConstraints(minHeight: 10),
                child: Text(
                  "${value}",
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                  overflow: TextOverflow.visible,
                )),
          )
        ],
      ),
    );
  }
}

class FirebaseService {
  static Future<void> initialize() async {
    await Firebase.initializeApp();
  }

  static Future<void> updateChildStatus(String documentId, String status) async {
    final data = {
      'status': status,
    };
    await FirebaseFirestore.instance
        .collection('children')
        .doc(documentId)
        .update(data);
  }
}