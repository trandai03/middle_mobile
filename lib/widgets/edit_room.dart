import "package:flutter/material.dart";
import "package:project/modules/room.dart";
import "package:provider/provider.dart";

class FormEditRoom extends StatefulWidget {
  final String? maPhong;
  final bool? empty;
  final String? type;
  final String? floor;
  FormEditRoom({this.maPhong, this.floor, this.empty, this.type});
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
    typeRoom = widget.type;
    roomNumberController.text = widget.maPhong!;
    floorController.text = widget.floor!;
    super.initState();
  }

  submitData() {
    final enterroomNumberController = roomNumberController.text;
    final enterFloorController = floorController.text;
    final enterTypeRoomController = typeRoom;
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
                

                    Navigator.pop(context, {
                      "type": typeRoom,
                      "maPhong": roomNumberController.text,
                      "floor": floorController.text
                    });
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
