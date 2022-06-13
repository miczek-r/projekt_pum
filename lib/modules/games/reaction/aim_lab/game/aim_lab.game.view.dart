import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/aim_lab/game/aim_lab.game.controller.dart';
import 'package:projekt_pum/modules/games/reaction/aim_lab/game/aim_lab.game.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widget_view/widget_view.dart';

class AimLabGamePageView
    extends StatefulWidgetView<AimLabGamePage, AimLabGamePageController> {
  const AimLabGamePageView(AimLabGamePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height - 90;
    double screenWidth = MediaQuery.of(context).size.width;
    if (controller.isFirst) {
      Timer.periodic(Duration(seconds: 1), (timer) async {
        controller.setState(() {
          controller.timer = timer.tick;
          if (controller.timer == controller.PlayTime) {
            print('finished');
          }
        });
      });
      controller.generator = ListGenerator(1, 60, Colors.blueAccent,
          screenHeight, screenWidth, controller.callBackSetState);
      controller.balls = controller.generator!.getBallList();
      controller.isFirst = false;
    }
    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Text(
                    'You hit: ${controller.hits} times, You miss: ${controller.misses} times, Time left: ${30 - controller.timer}'),
              ],
            ),
            Expanded(
              child: GestureDetector(
                  onTapDown: (e) {
                    controller.setState(() {
                      controller.misses++;
                      print('wrong on tap down!');
                    });
                  },
                  child: Stack(
                    fit: StackFit.expand,
                    children: controller.balls,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
