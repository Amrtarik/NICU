import 'package:desktop_project/screens/client%20page/client_data.dart';
import 'package:flutter/material.dart';

class Clients extends StatefulWidget {
  const Clients({super.key});

  @override
  State<Clients> createState() => _ClientsState();
}

class _ClientsState extends State<Clients> {
  List<ClientData> _clientData = [
    ClientData(
        imagePath: "asset/images/doctor-14044.png",
        name: "Mohamed Omar",
        email: "mmookk20122@gmail",
        age: 20,
        gender: "male",
        chatButtonOnTap: () {}),
    ClientData(
        imagePath: "asset/images/doctor-14044.png",
        name: "Mohamed Omar",
        email: "mmoo22@gmail",
        age: 22,
        gender: "male",
        chatButtonOnTap: () {}),
    ClientData(
        imagePath: "asset/images/doctor-14044.png",
        name: "Ammar Omar",
        email: "ammar2012@gmail",
        age: 11,
        gender: "male",
        chatButtonOnTap: () {}),
    ClientData(
        imagePath: "asset/images/doctor-14044.png",
        name: "Abdo Omar",
        email: "mmookk20122@gmail",
        age: 3,
        gender: "male",
        chatButtonOnTap: () {}),
    ClientData(
        imagePath: "asset/images/doctor-14044.png",
        name: "Ahmed Omar",
        email: "mmookk22@gmail",
        age: 18,
        gender: "male",
        chatButtonOnTap: () {}),
  ];
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
        width: width * 5 / 6 - 16,
        height: height - 16,
        padding: EdgeInsets.fromLTRB(width / 22, 20, width / 22, 0),
        child: ListView.builder(
            itemCount: (_clientData.length / 2).ceil(),
            itemBuilder: (BuildContext context, int index) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  _clientData[index * 2],
                  if ((index * 2 + 1) < _clientData.length)
                    _clientData[index * 2 + 1],
                ],
              );
            }));
  }
}
