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

  void deleteRoom(Room room) {
    dsRoom.remove(room);
    notifyListeners();
  }

  void editRoom(
    Room old,
  ) {
    old;

    notifyListeners();
  }

  // check_Room(){}//file checkroom
  // addRoom_full(){}//file form nhap
  // rent_room(){}
  // liet ke tat ca cac file co tung ham do roi lm de do roi tim cach pull ve roi push len
  // chac khai copy một file # roi pull về cai kia roi paste lại
  // chu gio push len cai la lm lại tu dau
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
    Room newRoom = Room(
      maPhong: maPhong,
      empty: true,
      type: type,
      floor: floor,
    );
    dsRoom
        .where((room) =>
            room.maPhong == newRoom.maPhong &&
            room.type == newRoom.type &&
            room.floor == newRoom.floor)
        .map((room) {
      room.empty = false;
    }).toList();
    dsRoom.remove(dsRoom.last);
    notifyListeners();
  }

  void check_Room(Room room) {
    room.empty = true;
    notifyListeners();
  }
}
