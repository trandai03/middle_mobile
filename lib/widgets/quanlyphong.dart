import 'package:flutter/material.dart';
import 'package:project/widgets/formadd_room.dart';

import '../modules/room.dart';
import 'list_Room.dart';

class QuanLyRoom extends StatefulWidget {
  QuanLyRoom({super.key});
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
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/back1.png"),
            fit: BoxFit.cover,
            opacity: 0.5,
          ),
        ),
        child: Container(
          child: DanhSachRoom(danhSachRoom),
          height: double.maxFinite,
        ),
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
