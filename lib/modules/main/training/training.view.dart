import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/training/training.controller.dart';
import 'package:projekt_pum/modules/main/training/training.dart';
import 'package:projekt_pum/utils/ui/glass_container/glass_container.dart';
import 'package:widget_view/widget_view.dart';

class TrainingPageView
    extends StatefulWidgetView<TrainingPage, TrainingPageController> {
  const TrainingPageView(TrainingPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: 140,
                child: Center(
                    child: Text(
                  'Training'.toUpperCase(),
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
                  GlassContainer(
                    child: Padding(
                      padding: const EdgeInsets.all(25.0),
                      child: Column(children: [
                        for (int i = 0; i < 5; i++) TrainingRow(),
                      ]),
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
                    child: InkWell(
                      onTap: () => Navigator.of(context)
                          .pushNamed("/games/reaction/view"),
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        radius: 50,
                      ),
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
