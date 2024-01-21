import "package:flutter/material.dart";
import "package:project/modules/room.dart";
import "package:provider/provider.dart";

class FormAddRoom extends StatefulWidget {
  FormAddRoom({super.key});
  @override
  State<FormAddRoom> createState() => _FormAddRoomState();
}

class _FormAddRoomState extends State<FormAddRoom> {
  var typeRoomList = [
    "Normal",
    "VIP",
    "Luxury",
  ];

  final roomNumberController = TextEditingController();
  final floorController = TextEditingController();
  String typeRoom = "Normal";

  submitData() {
    final enterroomNumberController = roomNumberController.text;
    final enterFloorController = floorController.text;
    final enterTypeRoomController = typeRoom;
    Provider.of<RoomProvider>(context, listen: false).addRoom(
        enterroomNumberController,
        true,
        enterTypeRoomController,
        enterFloorController);
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<RoomProvider>(builder: (context, roomProvider, child) {
      return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () => Navigator.pop(context),
          ),
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
                  child: Text('Them phong'),
                  onPressed: () {
                    submitData();
                    // showDialog(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return AlertDialog(
                    //       title: Text('Complete'),
                    //       content: Text('Thêm phòng thành công!'),
                    //       actions: <Widget>[
                    //         TextButton(
                    //           onPressed: () {
                    //             Navigator.push(context,
                    //                 MaterialPageRoute(builder: (context) {
                    //               return QuanLyRoom();
                    //             }));
                    //           },
                    //           child: Text('OK'),
                    //         ),
                    //       ],
                    //     );
                    //   },
                    // );
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
