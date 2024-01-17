import 'package:flutter/material.dart';
import 'package:project/modules/room.dart';


class DanhSachRoom extends StatelessWidget{


  final List<Room> danhSachRoom;

  DanhSachRoom(this.danhSachRoom);


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "List Room",
          style: TextStyle(
            fontSize: 20,
          ),

        ),
        backgroundColor: Colors.red,
      ),
      body: Container(
        child: SingleChildScrollView(
          child: Column(
            children: danhSachRoom.map((room) {
              final String trangThai;
              if(room.empty==true){
                trangThai = " Trong";
              }else{
                trangThai = " Khong trong";
              }
              return Card(
                child: Row(
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.symmetric(
                        vertical: 10,
                        horizontal: 15,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(
                            color: Colors.purple,
                            width: 2,
                          )
                      ),
                      padding: EdgeInsets.all(10),
                      child: Text(
                          room.maPhong.toString(),
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                            color: Colors.purple,
                          )
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          ' Type :' + room.type ,
                          style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold
                          ),
                        ),
                        Text(
                          "Trang thai : " + trangThai,
                          style: TextStyle(
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        ),
      ),
    );
  }
}