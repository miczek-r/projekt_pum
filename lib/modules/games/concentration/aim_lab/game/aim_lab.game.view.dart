import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/game/aim_lab.game.controller.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/game/aim_lab.game.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widget_view/widget_view.dart';

class AimLabGamePageView
    extends StatefulWidgetView<AimLabGamePage, AimLabGamePageController> {
  const AimLabGamePageView(AimLabGamePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Theme.of(context).canvasColor,
      body: SafeArea(
        child: Column(
          children: [
            SizedBox(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                            "${controller.duration.inMinutes}:${controller.duration.inSeconds.remainder(60)} - ${controller.score.round()}",
                            style: TextStyle(fontSize: 25))
                      ],
                    )
                  ],
                ),
              ),
            Expanded(
              child:  Stack(
                children: 
                            [Positioned(
                            left: controller.targetLeft,
                            top: controller.targetTop,
                            child: ClipOval(
                child: Material(
                  color: Colors.green,
                  child: InkWell(
                    onTapDown: (TapDownDetails e) {
                      controller.targetHit();
                    },
                    child: SizedBox(width: 40, height: 40),
                  ),
                ),
                            )),
                          ],
              )
                  
            ),
          ],
        ),
      ),
    );
  }
}
