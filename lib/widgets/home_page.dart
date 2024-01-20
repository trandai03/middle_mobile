import 'package:flutter/material.dart';
import './checkRoom.dart';
import './formnhap_khachhang.dart';
import './quanlyphong.dart';
import './setting.dart';

class MyHomePage extends StatelessWidget {
  var service = ["List Room", "Rent Room", "Check Room", "Settings"];
  void serviceClick(int index, context) {
    switch (index) {
      case 0:
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ));
      case 0:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuanLyRoom()));
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => NhapKhachhang()));
      case 2:
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => QuanLyCheckRoom()));
      case 3:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => MySettings()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/background.png"),
                fit: BoxFit.cover,
                opacity: 0.5,
              ),
            ),
            child: ListView(children: [
              Container(
                height: 150,
                width: double.infinity,
                decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(
                        'assets/images/logo.png',
                      ),
                      scale: 0.9),
                ),
              ),
              Container(
                padding: const EdgeInsets.symmetric(horizontal: 30),
                child: GridView.builder(
                  itemCount: service.length,
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    childAspectRatio: 1,
                  ),
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        serviceClick(index, context);
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        margin: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Colors.white30,
                            boxShadow: [
                              BoxShadow(
                                offset: const Offset(0, 1),
                                color: Colors.blue.withOpacity(0.2),
                                spreadRadius: 2,
                                blurRadius: 5,
                              )
                            ]),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Image.asset(
                                "assets/images/hotel.png",
                                width: 70,
                                height: 70,
                              ),
                            ),
                            const SizedBox(height: 10),
                            Text(
                              service[index],
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.black.withOpacity(0.7),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
            ])));
  }
}
