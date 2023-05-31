import 'package:flutter/material.dart';

class ClientData extends StatefulWidget {
  ClientData({
    super.key,
    required this.imagePath,
    required this.name,
    required this.email,
    required this.age,
    required this.gender,
    required this.chatButtonOnTap,
  });
  String imagePath;
  String name;
  String email;
  int age;
  String gender;
  Function chatButtonOnTap;

  @override
  State<ClientData> createState() => _ClientDataState();
}

class _ClientDataState extends State<ClientData> {
  Color _color1 = Color(0xff4170D8);
  Color _color2 = Colors.white;

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Container(
      padding: EdgeInsets.all(20),
      margin: EdgeInsets.all(5),
      width: width / 3,
      constraints: BoxConstraints(minHeight: 100),
      decoration: BoxDecoration(
          border: Border.all(width: 6, color: Color(0xff1C3879)),
          borderRadius: BorderRadius.circular(20)),
      child: Column(children: [
        Center(
          child: Container(
            margin: EdgeInsets.symmetric(vertical: 3, horizontal: 5),
            height: 45,
            width: 45,
            child: CircleAvatar(
              backgroundImage: AssetImage("${widget.imagePath}"),
            ),
          ),
        ),
        dataItem('Name', '${widget.name}'),
        dataItem('Email', '${widget.email}'),
        dataItem('Age', '${widget.age} Days'),
        dataItem('Gender', '${widget.gender}'),
        Row(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            InkWell(
              onTap: widget.chatButtonOnTap(),
              child: MouseRegion(
                cursor: MaterialStateMouseCursor.clickable,
                onEnter: (event) {
                  setState(() {
                    _color1 = Colors.white;
                    _color2 = Color(0xff4170D8);
                  });
                },
                onExit: (event) {
                  setState(() {
                    _color1 = Color(0xff4170D8);
                    _color2 = Colors.white;
                  });
                },
                child: Container(
                  height: 40,
                  width: 100,
                  decoration: BoxDecoration(
                      color: _color2,
                      border: Border.all(color: Color(0xff4170D8), width: 2),
                      borderRadius: BorderRadius.circular(5)),
                  child: Center(
                    child: Text(
                      "Message",
                      style: TextStyle(
                          color: _color1, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
            )
          ],
        )
      ]),
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
