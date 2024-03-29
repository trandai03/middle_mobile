import 'package:flutter/material.dart';
import 'package:project/modules/room.dart';
import 'package:provider/provider.dart';

import '../modules/user_interface.dart';
import './home_page.dart';

class CheckRoom extends StatelessWidget {
  final List<Room> danhSachRoom;
  CheckRoom(this.danhSachRoom);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: double.maxFinite,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/back1.png"),
          fit: BoxFit.cover,
          opacity: 0.5,
        ),
      ),
      child: SingleChildScrollView(
        child: Consumer<RoomProvider>(
          builder: (context, roomProvider, child) {
            if (roomProvider.currentRoom.isNotEmpty) {
              return Column(
                children: roomProvider.currentRoom
                    .where((room) => room.empty == false)
                    .map((room) {
                  final String trangThai = "Full";
                  return TextButton(
                    onPressed: () {
                      Provider.of<RoomProvider>(context, listen: false)
                          .check_Room(room);
                      showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            title: Text('Complete'),
                            content: Text('Đã trả thành công!'),
                            actions: <Widget>[
                              TextButton(
                                onPressed: () {
                                  Navigator.push(context,
                                      MaterialPageRoute(builder: (context) {
                                    return MyHomePage();
                                  }));
                                },
                                child: Text('OK'),
                              ),
                            ],
                          );
                        },
                      );
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
                              ),
                            ),
                            padding: EdgeInsets.all(10),
                            child: Text(
                              room.maPhong.toString(),
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                                color: Colors.purple,
                              ),
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Type : ' + room.type,
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                "Trang thai : " + trangThai,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            width: 30,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Text(
                                "Name : " + room.khachHang!.hoVaTen,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "Phone : " + room.khachHang!.phone,
                                style: TextStyle(
                                  color: Colors.grey,
                                ),
                              ),
                              Text(
                                "ID : " + room.khachHang!.id,
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
              );
            } else {
              return Center(
                child: const Text(
                  'Chưa thêm phòng nào',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}

class QuanLyCheckRoom extends StatefulWidget {
  QuanLyCheckRoom({super.key});
  @override
  State<QuanLyCheckRoom> createState() => _QuanLyCheckRoomState();
}

class _QuanLyCheckRoomState extends State<QuanLyCheckRoom> {
  final List<Room> danhSachRoom = [];
  @override
  // void dispose() {
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(builder: (context, ui, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Check Room",
            style: TextStyle(
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          centerTitle: true,
          backgroundColor: ui.appBarColor,
        ),
        body: Container(
          child: CheckRoom(danhSachRoom),
        ),
      );
    });
  }
}
