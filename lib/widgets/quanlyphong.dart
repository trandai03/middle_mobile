import 'package:flutter/material.dart';

import '../modules/room.dart';
import './formadd_room.dart';

class QuanLyRoom extends StatefulWidget {
  @override
  State<QuanLyRoom> createState() => _QuanLyRoomState();
}

class _QuanLyRoomState extends State<QuanLyRoom> {
  final List<Room> danhSachRoom = [
    Room(
      maPhong: "403",
      empty: true,
      type: "VIP",
      floor: "4",
    ),
    Room(
      maPhong: "201",
      empty: true,
      type: "Nomarl",
      floor: "2",
    ),
    Room(
      maPhong: "404",
      empty: true,
      type: "VIP",
      floor: "4",
    )
  ];
  void addRoom(String maPhong, bool empty, String type, String floor) {
    Room newRoom = Room(
      maPhong: maPhong,
      empty: empty,
      type: type,
      floor: floor,
    );
    setState(() {
      danhSachRoom.add(newRoom);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Room",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: danhSachRoom.map((room) {
              final String trangThai;
              if (room.empty == true) {
                trangThai = " Trong";
              } else {
                trangThai = " Khong trong";
              }
              return Card(
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
                      )),
                      padding: EdgeInsets.all(10),
                      child: Text(room.maPhong.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          )),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Type :' + room.type,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
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
              );
            }).toList(),
          ),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FormAddRoom(addRoom),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
