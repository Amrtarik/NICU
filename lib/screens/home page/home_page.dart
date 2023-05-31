import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:desktop_project/component/special_button.dart';
import 'package:desktop_project/screens/home%20page/child_item.dart';
import 'package:desktop_project/screens/home%20page/num_of_nicu.dart';
import 'package:flutter/material.dart';

import 'package:flutter/material.dart';

import 'child_item.dart';
import 'num_of_nicus.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  bool display = false;
  List<ChildItem> _childItem = [];

  @override
  void initState() {
    super.initState();
    _getChildData();
  }

  Future<void> _getChildData() async {
    final snapshot =
        await FirebaseFirestore.instance.collection('children').get();
    final children = snapshot.docs.map((doc) {
      final data = doc.data();
      return ChildItem(
        name: data['name'],
        age: data['age'],
        gender: data['gender'],
        documentId: doc.id,
        leftOnTap: () async {
          await FirebaseService.updateChildStatus(doc.id, 'left');
          setState(() {
            _childItem.removeWhere((child) => child.documentId == doc.id);
          });
          Navigator.pop(context, false);
        },
      );
    }).toList();
    setState(() {
      _childItem = children;
    });
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Column(
      children: [
        Container(
          margin: EdgeInsets.all(20),
          padding: EdgeInsets.all(10),
          width: width * 5 / 6 - 16,
          constraints: BoxConstraints(minHeight: 20),
          decoration: BoxDecoration(
              border: Border.all(width: 6, color: Color(0xff1C3879)),
              borderRadius: BorderRadius.circular(20)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Center(
                  child: Text(
                "Number of NICUs",
                style: TextStyle(
                    color: Color(0xff1C3879),
                    fontSize: 30,
                    fontWeight: FontWeight.bold),
              )),
              Row(
                children: [
                  Expanded(
                      child: SpecialButton(
                    borderColor: Color(0xff98ADCC),
                    bodyColor: Colors.white,
                    text: "Used : 15",
                    onTap: () {
                      display = true;
                      setState(() {});
                    },
                    height: height / 9,
                    margin: EdgeInsets.all(10),
                    padding: EdgeInsets.all(15),
                    borderRadius: 15,
                    textSize: 25,
                  )),
                  Expanded(
                      flex: 1,
                      child: NumOfNICUs(
                        text: "Not used",
                        numOfNICUs: 5,
                        color: Color(0xff5F7EAA),
                      )),
                  Expanded(
                      flex: 1,
                      child: NumOfNICUs(
                          text: "Total",
                          numOfNICUs: 20,
                          color: Color(0xff5F7EAA))),
                ],
              )
            ],
          ),
        ),
        display == true
            ? Expanded(
                child: Container(
                padding: EdgeInsets.all(10),
                width: width * 5 / 6 - 16,
                margin: EdgeInsets.all(20),
                decoration: BoxDecoration(
                    border: Border.all(width: 6, color: Color(0xff1C3879)),
                    borderRadius: BorderRadius.circular(20)),
                child: Container(
                    width: width * 5 / 6 - 16,
                    height: height - 16,
                    padding: EdgeInsets.fromLTRB(width / 22, 10, width / 22, 0),
                    child: Column(
                      children: [
                        Center(
                            child: Text(
                          "The children In NICUs",
                          style: TextStyle(
                              color: Color(0xff1C3879),
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                        )),
                        Expanded(
                          child: ListView.builder(
                              itemCount: _childItem.length,
                              itemBuilder: (BuildContext context, int index) {
                                return _childItem[index];
                              }),
                        ),
                      ],
                    )),
              ))
            : SizedBox()
      ],
    );
  }
}

class FirebaseService {
  static Future<void> updateChildStatus(String documentId, String status) async {
    await FirebaseFirestore.instance
        .collection('children')
        .doc(documentId)
        .update({'status': status});
  }
}