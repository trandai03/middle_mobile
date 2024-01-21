import 'package:flutter/material.dart';
import 'package:project/modules/room.dart';
import './home_page.dart';
import './quanlyphong.dart';
import 'package:provider/provider.dart';

class ListRoomEmpty extends StatelessWidget {
  final List<Room> danhSachRoom;
  ListRoomEmpty(this.danhSachRoom);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<RoomProvider>(
        builder: (context, roomProvider, child) {
          if (roomProvider.currentRoom.isNotEmpty) {
            return Column(
              children: roomProvider.currentRoom
                  .where((room) => room.empty == true && room.maPhong != '')
                  .map((room) {
                final String trangThai = "Trong";
                return TextButton(
                  onPressed: () {
                    Provider.of<RoomProvider>(context, listen: false)
                        .rent_room(room.maPhong, room.type, room.floor);
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          title: Text('Complete'),
                          content: Text('Đã chọn thành công!'),
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
                              ' Type : ' + room.type,
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
    );
  }
}

class QuanLyRoomEmpty extends StatefulWidget {
  @override
  State<QuanLyRoomEmpty> createState() => _QuanLyRoomState();
}

class _QuanLyRoomState extends State<QuanLyRoomEmpty> with ChangeNotifier {
  final List<Room> danhSachRoom = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Empty Room",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: ListRoomEmpty(danhSachRoom),
      ),
    );
  }
}
