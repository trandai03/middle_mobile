import 'package:flutter/material.dart';

import './quanlyphong.dart';

class MyHomePage extends StatelessWidget {
  var service = [
    "Add Room",
    "List Room",
    "Edit Room",
    "Delete Room",
    "Rent Room",
    "Check Room",
  ];
  void serviceClick(int index, context) {
    switch (index) {
      case 0:
      // Navigator.push(
      //     context, MaterialPageRoute(builder: (context) => ));
      case 1:
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => QuanLyRoom()));
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
