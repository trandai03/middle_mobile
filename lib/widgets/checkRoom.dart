import 'package:flutter/material.dart';
import 'package:project/modules/room.dart';
import './home_page.dart';
import './quanlyphong.dart';

class CheckRoom extends StatelessWidget{
  final List<Room> danhSachRoom;

  CheckRoom(this.danhSachRoom);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Check",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
          color: Colors.white,
        ),
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: danhSachRoom.map((room) {
              final String trangThai;
              if(room.empty==true){
                trangThai = " Empty";
              }else{
                trangThai = "Full";
              }
              return TextButton(
                onPressed: (){
                  _showCompleteDialog(context);
                },
                child: Card(
                  child: Row(
                    children: <Widget>[
                      Container(
                        margin: EdgeInsets.symmetric(
                          vertical: 10,
                          horizontal: 15,
                        ),
                        decoration: BoxDecoration(
                            border: Border.all(
                              color: Colors.purple,
                              width: 2,
                            )
                        ),
                        padding: EdgeInsets.all(10),
                        child: Text(
                            room.maPhong.toString(),
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                              color: Colors.purple,
                            )
                        ),
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            ' Type :' + room.type ,
                            style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold
                            ),
                          ),
                          Text(
                            "Trang thai : " + trangThai,
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          )
                        ],
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}

Future<void> _showCompleteDialog(BuildContext context) async {
  return showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Complete'),
        content: Text('Da tra thanh cong!'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) {
                // do something
                return MyHomePage();
              }));
            },
            child: Text('OK'),
          ),
        ],
      );
    },
  );
}

class QuanLyCheckRoom extends StatefulWidget{
  @override
  State<QuanLyCheckRoom> createState() => _QuanLyCheckRoomState();
}

class _QuanLyCheckRoomState extends State<QuanLyCheckRoom> {
  final List<Room> danhSachRoom = [
    Room(
      maPhong: "403",
      empty: false,
      type: "VIP",
      floor: "4",
    ),

    Room(
      maPhong: "201",
      empty: false,
      type: "Nomarl",
      floor: "2",
    ),

    Room(
      maPhong: "404",
      empty: false,
      type: "VIP",
      floor: "4",
    )
  ];

  @override
  Widget build(BuildContext context){
    return CheckRoom(danhSachRoom);
  }
}