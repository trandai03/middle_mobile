import "package:flutter/material.dart";

class FormAddRoom extends StatelessWidget {
  final Function addRoom;
  var typeRoomList = [
    "Normal",
    "VIP",
    "Luxury",
  ];

  final roomNumberController = TextEditingController();
  final floorController = TextEditingController();

  String typeRoom = "Normal";
  FormAddRoom(this.addRoom);
  submitData() {
    final enterroomNumberController = roomNumberController.text;
    final enterFloorController = floorController.text;
    final enterTypeRoomController = typeRoom;
    addRoom(enterroomNumberController, true, enterTypeRoomController,
        enterFloorController);
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
                child: Text('Them phong'),
                onPressed: () {
                  submitData();
                  Navigator.pop(context);
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
