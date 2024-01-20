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
    // re phet van con loi ma anh
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
                    submitData();
                    // dang le ban dau dax dufng  provider roi thi dung cai truyen index qua maf lo thi thui
                    Navigator.pop(context, {
                      "type": typeRoom,
                      "maPhong": roomNumberController.text,
                      "floor": floorController.text
                    });
                    // nhap key value di
                    //   ua sao reload cung la restart the em k bt
                    //   thui dung vscode di
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
