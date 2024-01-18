import "package:flutter/material.dart";

import '../modules/room.dart';

class FormAddRoom extends StatelessWidget {
  var typeRoomList = [
    "Normal",
    "VIP",
    "Luxury",
  ];

  final roomNumberController = TextEditingController();
  final floorController = TextEditingController();

  var typeRoom = "Normal";
  addRoom(String maPhong, bool empty, String type, String floor) {
    final newRoom = Room(
      maPhong: maPhong,
      empty: empty,
      type: type,
      floor: floor,
    );
  }

  submitData() {
    final enterroomNumberController = roomNumberController.text;
    final enterFloorController = floorController.text;
    final enterTypeRoomController = typeRoom;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Room",
          style: TextStyle(
            fontSize: 20,
          ),
        ),
      ),
      body: Card(
        elevation: 5,
        child: Container(
          padding: EdgeInsets.all(10),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              DropdownButton<String>(
                value: typeRoom,
                items:
                    typeRoomList.map<DropdownMenuItem<String>>((String value1) {
                  return DropdownMenuItem<String>(
                    value: value1,
                    child: Text(value1),
                  );
                }).toList(),
                onChanged: (String? value1) {
                  typeRoom = value1!;
                },
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Room Number'),
                controller: roomNumberController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'Floor'),
                controller: floorController,
              ),
              TextButton(
                child: Text('Them sinh vien'),
                onPressed: () {
                  addRoom(roomNumberController.toString(), true, typeRoom,
                      floorController.toString());
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
