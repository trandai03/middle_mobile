import 'package:flutter/material.dart';

import './customer.dart';

class Room {
  final DateTime? date;
  final TimeOfDay? start;
  final KhachHang? khachHang;
  final String maPhong;
  final bool empty;
  final String type;
  final String floor;

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
