import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../modules/user_interface.dart';

class MySettings extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Consumer<UserInterface>(
      builder: (context, ui, child) {
        return Scaffold(
            appBar: AppBar(
              title: Text("Settings"),
              backgroundColor: ui.appBarColor,
            ),
            body: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Text(
                      "Font size: ${ui.fontSize.toInt()}",
                      style: TextStyle(
                        fontSize: 20,
                      ),
                    ),
                    Slider(
                      min: 1,
                      max: 28,
                      value: ui.fontSize,
                      onChanged: (newValue) {
                        ui.fontSize = newValue;
                      },
                    ),
                  ],
                ),

                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Text(
                        "AppBar Color:",
                        style: TextStyle(
                          fontSize: 20,
                        ),
                      ),
                      DropdownButton<String>(
                        value: ui.strAppBarColor,
                        items: UserInterface.listColorAppBar
                            .map<DropdownMenuItem<String>>((String value) {
                          return DropdownMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList(),
                        onChanged: (String? value) {
                          ui.appBarColor = value!;
                        },
                      )
                    ]),

                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Text(
                //         " Homepage Background Color:",
                //         style: TextStyle(
                //           fontSize: 20,
                //         ),
                //       ),
                //
                //       DropdownButton<String>(
                //         value: ui.strHomePageBackgroundColor,
                //         items: UserInterface.listColorBackgroundHomepage.map<DropdownMenuItem<String>>(
                //                 (String value) {
                //               return DropdownMenuItem<String>(
                //                 value: value,
                //                 child: Text(value),
                //               );
                //             }
                //         ).toList(),
                //         onChanged: (String? value) {
                //           ui.homePageBackgroundColor = value!;
                //         },
                //       )
                //     ]
                // ),
                //
                // Row(
                //     mainAxisAlignment: MainAxisAlignment.spaceAround,
                //     children: [
                //       Text(
                //         " Support Background Color:",
                //         style: TextStyle(
                //           fontSize: 20,
                //         ),
                //       ),
                //
                //       DropdownButton<String>(
                //         value: ui.strSupportBackgroundColor,
                //         items: UserInterface.listColorBackgroundSupport.map<DropdownMenuItem<String>>(
                //                 (String value) {
                //               return DropdownMenuItem<String>(
                //                 value: value,
                //                 child: Text(value),
                //               );
                //             }
                //         ).toList(),
                //         onChanged: (String? value) {
                //           ui.supportBackgroundColor = value!;
                //         },
                //       )
                //     ]
                // ),
              ],
            ));
      },
    );
  }
}
