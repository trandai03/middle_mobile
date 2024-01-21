import 'package:flutter/material.dart';

import './customer.dart';

class Room {
  final DateTime? date;
  final TimeOfDay? start;
  KhachHang? khachHang;
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
        empty: false,
        type: "Normal",
        floor: "2",
        khachHang: KhachHang(hoVaTen: "Duong", phone: "098", id: "123")),
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

  void deleteRoom(Room room) {
    dsRoom.remove(room);
    notifyListeners();
  }

  void editRoom(Room old) {
    old;
    notifyListeners();
  }

  void addRoom_full(
      String maPhong, bool empty, String type, String floor, KhachHang kh) {
    Room newRoom = Room(
      maPhong: maPhong,
      empty: empty,
      type: type,
      floor: floor,
      khachHang: kh,
    );
    dsRoom.add(newRoom);
    notifyListeners();
  }

  void rent_room(String maPhong, String type, String floor) {
    dsRoom
        .where((room) =>
            room.maPhong == maPhong && room.type == type && room.floor == floor)
        .map((room) {
      room.empty = false;
      room.khachHang = dsRoom.last.khachHang;
    }).toList();
    dsRoom.remove(dsRoom.last);
    notifyListeners();
  }

  void check_Room(Room room) {
    room.empty = true;
    notifyListeners();
  }
}
