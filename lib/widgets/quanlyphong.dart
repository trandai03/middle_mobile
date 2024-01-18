import 'package:flutter/material.dart';

import '../modules/room.dart';
import './list_Room.dart';

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

  @override
  Widget build(BuildContext context) {
    return DanhSachRoom(danhSachRoom);
  }
}
