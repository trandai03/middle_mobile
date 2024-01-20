import 'package:flutter/material.dart';

import './customer.dart';

class Room {
  final DateTime? date;
  final TimeOfDay? start;
  final KhachHang? khachHang;
   String maPhong;
   bool empty;
   String type;
            String floor;

  Room({
    required this.floor,
    required this.type,
    required this.empty,
    required this.maPhong,
    this.date,
    this.start,
    this.khachHang,
  });
}

class RoomProvider with ChangeNotifier {
  final List<Room> dsRoom = [
    Room(
      maPhong: "403",
      empty: true,
      type: "VIP",
      floor: "4",
    ),
    Room(
      maPhong: "201",
      empty: true,
      type: "Normal",
      floor: "2",
    ),
    Room(
      maPhong: "404",
      empty: true,
      type: "VIP",
      floor: "4",
    )
  ];

  List<Room> get currentRoom => dsRoom;

  void addRoom(String maPhong, bool empty, String type, String floor) {
    Room newRoom = Room(
      maPhong: maPhong,
      empty: empty,
      type: type,
      floor: floor,
    );
    dsRoom.add(newRoom);
    notifyListeners();
  }

  void deleteStudent(Room room) {
    dsRoom.remove(room);
    notifyListeners();
  }

  void editRoom(Room old, Room news) {
    // ko phải newRoom
    // Room newRoom = Room(
    //   maPhong: maPhong,
    //   empty: empty,
    //   type: type,
    //   floor: floor,
    // );
    old = news;

    notifyListeners();
  }
}
