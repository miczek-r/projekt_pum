import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.controller.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.dart';
import 'package:widget_view/widget_view.dart';

class StatisticsPageView
    extends StatefulWidgetView<StatisticsPage, StatisticsPageController> {
  const StatisticsPageView(StatisticsPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: 140,
                child: Center(
                    child: Text(
                  'Statistics'.toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, letterSpacing: 1.2),
                ))),
            SingleChildScrollView(
              physics: BouncingScrollPhysics(),
              child: Column(
                children: [
                  SizedBox(
                    height: 140,
                  ),
                  ClipRRect(
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaX: 4, sigmaY: 4),
                      child: Container(
                        decoration: BoxDecoration(
                            gradient: RadialGradient(
                              colors: [Color(0xDDffffff), Color(0x88f0fcfd)],
                              center: Alignment(-1, 1),
                              radius: 3.8,
                            ),
                            borderRadius: BorderRadius.vertical(
                                top: Radius.circular(50))),
                        child: Padding(
                          padding: const EdgeInsets.all(25.0),
                          child: Column(children: [
                            for (int i = 0; i < 5; i++) TrainingRow(),
                          ]),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class TrainingRow extends StatelessWidget {
  const TrainingRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text("test"),
          ],
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Material(
                    clipBehavior: Clip.none,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                  Text('Game 1')
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Material(
                    clipBehavior: Clip.none,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                  Text('Game 1')
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Material(
                    clipBehavior: Clip.none,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                  Text('Game 1')
                ],
              ),
              SizedBox(
                width: 15,
              ),
              Column(
                children: [
                  Material(
                    clipBehavior: Clip.none,
                    borderRadius: BorderRadius.circular(50),
                    elevation: 10,
                    child: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 50,
                    ),
                  ),
                  Text('Game 1')
                ],
              ),
              SizedBox(
                width: 15,
              ),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
