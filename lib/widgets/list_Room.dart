import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/room.dart';
import 'edit_room.dart';

class DanhSachRoom extends StatelessWidget {
  final List<Room> danhSachRoom;
  DanhSachRoom(this.danhSachRoom);
  void _deleteRoom(BuildContext context, Room room) {
    Provider.of<RoomProvider>(context, listen: false).deleteStudent(room);
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Consumer<RoomProvider>(
        builder: (context, roomProvider, child) {
          if (roomProvider.dsRoom.isNotEmpty) {
            return Column(
              children: roomProvider.dsRoom.map<Widget>((room) {
                print(room);
                final String trangThai;
                if (room.empty == true) {
                  trangThai = " Trong";
                } else {
                  trangThai = " Full";
                }
                return Card(
                  child: Column(
                    children: [
                      Row(
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
                                ' Type :' + room.type,
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
                          // SizedBox(
                          //   width: 70,
                          //   child: Row(
                          //     children: [
                          //       InkWell(
                          //         onTap: () {},child:
                          //         //       IconButton(
                          //         //         icon: Icon(Icons.delete_forever),
                          //         //         onPressed: () {
                          //         //           _deleteRoom(context, room);
                          //         //         },
                          //         //       )
                          //         //     ])
                          //       )
                          //     ],
                          //   ),
                          // )
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
                                      print(value);
                                      //  casi room no bij gi roi ntn cx duoc anh ak
                                      room.maPhong = value["maPhong"];
// empty nó là thuoc tinh gi bool ko ý là có tác dụng lm trong viec gi a phòng trống hay không á anh
// kiểu bây giờ empty true thì em hiển thị bth false thì có thêm khách hàng nữa ,bay gio data khach hang o
                                      room.type = value["type"];
                                      room.floor = value["floor"];
                                      // );
                                      // room.maPhong=
                                      roomProvider.editRoom(room);
                                    });
                                  },
                                ),
                                IconButton(
                                  icon: Icon(Icons.delete_forever),
                                  onPressed: () {
                                    _deleteRoom(context, room);
                                  },
                                ),
                              ]),
                        ],
                      ),
                      //if (room.empty != true) {}
                    ],
                  ),
                );
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
