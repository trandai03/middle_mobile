import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './edit_room.dart';
import '../modules/room.dart';

class DanhSachRoom extends StatelessWidget {
  final List<Room> danhSachRoom;
  DanhSachRoom(this.danhSachRoom);
  void _deleteRoom(BuildContext context, Room room) {
    Provider.of<RoomProvider>(context, listen: false).deleteRoom(room);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<RoomProvider>(
        builder: (context, roomProvider, child) {
          if (roomProvider.currentRoom.isNotEmpty) {
            return Column(
              children: roomProvider.currentRoom.map((room) {
                final String trangThai;
                if (room.empty == true) {
                  trangThai = " Trong ";
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
                            ),
                          ],
                        ),
                        Row(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            mainAxisAlignment: MainAxisAlignment.end,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: Icon(Icons.edit),
                                onPressed: () {
                                  // re fresh
                                  Navigator.push(
                                          context,
                                          MaterialPageRoute(
                                              builder: (cxt) => FormEditRoom(
                                                  maPhong: room.maPhong,
                                                  type: room.type,
                                                  empty: room.empty,
                                                  floor: room.floor)))
                                      .then((value) {
                                    room.maPhong = value["maPhong"];
                                    room.type = value["type"];
                                    room.floor = value["floor"];
                                    roomProvider.editRoom(room);
                                  });
                                },
                              ),
                              IconButton(
                                icon: Icon(Icons.delete_forever),
                                onPressed: () {
                                  _deleteRoom(context, room);
                                },
                              )
                            ]),
                      ],
                    ),
                  );
                } else {
                  trangThai = " Full ";
                  return Card(
                      child: Row(children: <Widget>[
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
                      mainAxisAlignment: MainAxisAlignment.end,
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
                      width: 15,
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          "Ho va ten : \n" + room.khachHang!.hoVaTen,
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
                    Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        mainAxisAlignment: MainAxisAlignment.end,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          IconButton(
                            icon: Icon(Icons.edit),
                            onPressed: () {
                              // re fresh
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (cxt) => FormEditRoom(
                                          maPhong: room.maPhong,
                                          type: room.type,
                                          empty: room.empty,
                                          floor: room.floor))).then((value) {
                                room.maPhong = value["maPhong"];
                                room.type = value["type"];
                                room.floor = value["floor"];
                                roomProvider.editRoom(room);
                              });
                            },
                          ),
                          IconButton(
                            icon: Icon(Icons.delete_forever),
                            onPressed: () {
                              _deleteRoom(context, room);
                            },
                          )
                        ]),
                  ]));
                }
              }).toList(),
            );
          } else {
            return const Text(
              'Chưa thêm phòng nào',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            );
          }
        },
      ),
    );
  }
}
