import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class MyHomePage extends StatelessWidget{

  @override
  Widget build(BuildContext context){
    return Scaffold(


      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/background.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: ListView(
          children: [
            Container(
              height: 100.0,
              width: 300.0,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage(
                      'assets/images/logo.png'),

                ),

              ),
            ),
            Container(
              margin: EdgeInsets.all(10),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Stack(
                        children: [
                          Positioned.fill(
                            child:Container(
                              height: 100,
                              width: 100,
                              decoration: BoxDecoration(
                                color: Colors.purple,
                                shape: BoxShape.circle,
                              ),
                            )
                          ),
                          InkWell(
                            onTap: () {
                              // Xử lý khi nút được nhấn
                              print('Button pressed');
                            },
                            child: Container(
                              padding: EdgeInsets.all(10),
                              alignment: Alignment.center,
                              child: Column(
                                children: [
                                  Icon(FontAwesomeIcons.hotel,
                                    size: 50,

                                  ), // Sử dụng Icon thay vì FontAwesomeIcons.hotel
                                  Text("Add Room"),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),


        ElevatedButton(
                        onPressed: (){},
                        child:
                        Column(
                          children: [
                            Container(
                                padding: EdgeInsets.all(10),
                                alignment: Alignment.center,
                                child: Icon(FontAwesomeIcons.hotel)
                            ),
                            Text("Add Room")
                          ],
                        ),
                      ),
                    ],
                  ),

                ],
              ),
            ),
          ],
        ),
      )


    );
  }



}

