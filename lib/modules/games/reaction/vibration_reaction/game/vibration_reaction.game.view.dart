import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/vibration_reaction/game/vibration_reaction.game.controller.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widget_view/widget_view.dart';

import 'vibration_reaction.game.dart';

class VibrationReactionGamePageView extends StatefulWidgetView<
    VibrationReactionGamePage, VibrationReactionGamePageController> {
  const VibrationReactionGamePageView(
      VibrationReactionGamePageController controller,
      {Key? key})
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
                        AnimatedSmoothIndicator(
                          activeIndex: controller.currentAttempt,
                          count: 5,
                          effect: WormEffect(
                              activeDotColor: Theme.of(context)
                                  .textTheme
                                  .bodyMedium!
                                  .color!),
                        )
                      ],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: controller.backgroundColor,
                  child: InkWell(
                    onTapDown: (details) => controller.gameControll(),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        FaIcon(controller.gameIcon,
                            color: Colors.white, size: 40),
                        SizedBox(height: 20),
                        Text(
                          (controller.gameText.contains("ms"))
                              ? controller.gameText
                              : ApplicationLocalizations.of(context)!
                                  .translate(controller.gameText),
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
