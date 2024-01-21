import 'package:flutter/material.dart';
import 'package:project/modules/customer.dart';
import 'package:project/modules/room.dart';
import 'package:project/widgets/home_page.dart';
import 'package:provider/provider.dart';

import './list_room_empty.dart';

class NhapKhachhang extends StatefulWidget {
  //NhapKhachhang({super.key});
  @override
  State<NhapKhachhang> createState() => _NhapKhachhangState();
}

class _NhapKhachhangState extends State<NhapKhachhang> {
  final hoVaTenController = TextEditingController();
  final phoneController = TextEditingController();
  final idCController = TextEditingController();

  submitData_customer(BuildContext context) {
    final enterHoVaTenController = hoVaTenController.text;
    final enterPhoneController = phoneController.text;
    final enterIdController = idCController.text;

    if ((enterHoVaTenController.length >= 2) &&
        (int.tryParse(enterIdController) != null) &&
        (enterPhoneController.length > 0)) {
      KhachHang kh = KhachHang(
          hoVaTen: enterHoVaTenController,
          phone: enterPhoneController,
          id: enterIdController);
      Provider.of<RoomProvider>(context, listen: false).addRoom_full(
        '',
        true,
        '',
        '',
        kh,
      );
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return QuanLyRoomEmpty();
      }));
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Rent",
          style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
        ),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context) {
              return MyHomePage();
            }));
          },
        ),
      ),
      body: Container(
        child: Card(
          elevation: 5,
          child: Container(
            // decoration: BoxDecoration(
            //   image: DecorationImage(
            //     image: AssetImage("assets/images/back1.png"),
            //     fit: BoxFit.cover,
            //     opacity: 0.5,
            //   ),
            // ),
            //padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name Customer:'),
                  controller: hoVaTenController,
                  // onSubmitted: (_) => submitData_customer(context),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'Phone Number:'),
                  controller: phoneController,
                  // onSubmitted: (_) => submitData_customer(context),
                ),
                SizedBox(
                  height: 10,
                ),
                TextField(
                  decoration: InputDecoration(labelText: 'ID Card:'),
                  controller: idCController,
                  // onSubmitted: (_) => submitData_customer(context),
                ),
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('NEXT'),
                    onPressed: () {
                      submitData_customer(context);
                    },
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
