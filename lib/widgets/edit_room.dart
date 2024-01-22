import "package:flutter/material.dart";
import "package:project/modules/room.dart";
import "package:provider/provider.dart";

class FormEditRoom extends StatefulWidget {
  // final String? maPhong;
  // final bool? empty;
  // final String? type;
  // final String? floor;
  Room? room;
  FormEditRoom(
      // {this.maPhong, this.floor, this.empty, this.type}{
      {this.room});
  @override
  State<FormEditRoom> createState() => _FormEditRoomState();
}

class _FormEditRoomState extends State<FormEditRoom> {
  var typeRoomList = [
    "Normal",
    "VIP",
    "Luxury",
  ];

  TextEditingController roomNumberController = TextEditingController();
  final floorController = TextEditingController();
  String? typeRoom;
  @override
  void initState() {
    typeRoom = widget.room!.type;
    roomNumberController.text = widget.room!.maPhong!;
    floorController.text = widget.room!.floor!;
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RoomProvider>(builder: (context, roomProvider, child) {
      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Edit Room",
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
                  items: typeRoomList
                      .map<DropdownMenuItem<String>>((String value1) {
                    return DropdownMenuItem<String>(
                      value: value1,
                      child: Text(value1),
                    );
                  }).toList(),
                  onChanged: (String? value1) {
                    setState(() {
                      typeRoom = value1!;
                    });
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
                  child: Text('Update'),
                  onPressed: () {
                    // Navigator.pop(context, {
                    //   "type": typeRoom,
                    //   "maPhong": roomNumberController.text,
                    //   "floor": floorController.text
                    // });
                    //ok roi anh ak
                    Room newRoom = Room(
                      maPhong: roomNumberController.text,
                      empty: widget.room!.empty,
                      type: typeRoom!,
                      floor: floorController.text,
                      khachHang: widget.room!.khachHang,
                    );
                    roomProvider.editRoom(widget.room!, newRoom);
                    // roomProvider.currentRoom.
                    Navigator.pop(context);
                  },
                )
              ],
            ),
          ),
        ),
      );
    });
  }
}
