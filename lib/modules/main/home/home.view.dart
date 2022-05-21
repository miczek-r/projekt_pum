import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/main/home/home.controller.dart';
import 'package:projekt_pum/modules/main/home/home.dart';
import 'package:widget_view/widget_view.dart';

class HomePageView extends StatefulWidgetView<HomePage, HomePageController> {
  const HomePageView(HomePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 40,
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('FirstName',
                              style: TextStyle(
                                color: Colors.white,
                              )),
                          SizedBox(
                            height: 10,
                          ),
                          Text('LastName',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold))
                        ],
                      )
                    ],
                  ),
                )),
            Column(
              children: [
                SizedBox(
                  height: 140,
                ),
                Expanded(
                  child: Container(
                    decoration: BoxDecoration(
                        gradient: RadialGradient(
                          colors: [Color(0xDDffffff), Color(0x88f0fcfd)],
                          center: Alignment(-1, 1),
                          radius: 3.8,
                        ),
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(50))),
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [Text('Test')]),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
