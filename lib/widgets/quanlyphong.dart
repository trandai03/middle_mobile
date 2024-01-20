import 'package:flutter/material.dart';
import 'package:project/widgets/formadd_room.dart';

import '../modules/room.dart';
import 'list_Room.dart';

class QuanLyRoom extends StatefulWidget {
  @override
  State<QuanLyRoom> createState() => _QuanLyRoomState();
}

class _QuanLyRoomState extends State<QuanLyRoom> with ChangeNotifier {
  final List<Room> danhSachRoom = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Room",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
      body: Container(
        child: DanhSachRoom(danhSachRoom),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (ctx) => FormAddRoom(),
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
