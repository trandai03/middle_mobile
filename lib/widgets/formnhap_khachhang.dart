import 'package:flutter/material.dart';
import './list_room_empty.dart';
import 'package:project/widgets/home_page.dart';

class NhapKhachhang extends StatelessWidget {
  final Function addCustomer;

  final hoVaTenController = TextEditingController();
  final idCController = TextEditingController();
  final phoneController = TextEditingController();

  NhapKhachhang(this.addCustomer);

  submitData_customer(BuildContext context) {
    final enterHoVaTenController = hoVaTenController.text;
    final enterIdController = idCController.text;
    final enterPhoneController = phoneController.text;

    if ((enterHoVaTenController.length > 3) &&
        (int.tryParse(enterIdController) != null) &&
        (enterPhoneController.length > 0)) {
      addCustomer(
        enterHoVaTenController,
        enterIdController,
        enterPhoneController,
      );
    } else {
      return;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Rent", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.green,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) {
              // do something
              return MyHomePage();
            }));
          },
        ),
      ),
      body: Container(
        // decoration: BoxDecoration(
        //   image: DecorationImage(
        //     image: AssetImage('assets/your_image.jpg'),
        //     fit: BoxFit.cover,
        //   ),
        // ),
        child: Card(
          elevation: 5,
          child: Container(
            padding: EdgeInsets.all(10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                TextField(
                  decoration: InputDecoration(labelText: 'Name Customer:'),
                  controller: hoVaTenController,
                  onSubmitted: (_) => submitData_customer(context),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(labelText: 'Phone Number:'),
                  controller: phoneController,
                  onSubmitted: (_) => submitData_customer(context),
                ),
                SizedBox(height: 10,),
                TextField(
                  decoration: InputDecoration(labelText: 'ID Card:'),
                  controller: idCController,
                  onSubmitted: (_) => submitData_customer(context),
                ),
                SizedBox(height: 20,),
                Container(

                  child: TextButton(
                    style: TextButton.styleFrom(
                      backgroundColor: Colors.green,
                      foregroundColor: Colors.white,
                    ),
                    child: Text('NEXT'),
                    onPressed: (){
                      print("Button pressed");
                      Navigator.push(
                          context, MaterialPageRoute(builder: (context) {
                        // do something
                        return QuanLyRoomEmpty();
                      }));
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


