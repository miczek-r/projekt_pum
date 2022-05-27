import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.controller.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widget_view/widget_view.dart';

class ViewReactionGamePageView extends StatefulWidgetView<ViewReactionGamePage,
    ViewReactionGamePageController> {
  const ViewReactionGamePageView(ViewReactionGamePageController controller,
      {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
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
                        AnimatedSmoothIndicator(
                          activeIndex: controller.currentAttempt,
                          count: 5,
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Material(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: controller.backgroundColor,
                  child: InkWell(
                    onTap: () => controller.gameControll(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(controller.gameIcon,
                            color: Colors.white, size: 40),
                        SizedBox(height: 20),
                        Text(
                          controller.gameText,
                          style: TextStyle(color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                        Row()
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
