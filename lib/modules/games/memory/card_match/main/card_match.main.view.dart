import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/main/sound_reaction.main.controller.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/main/sound_reaction.main.dart';
import 'package:widget_view/widget_view.dart';

import 'card_match.main.controller.dart';
import 'card_match.main.dart';

class CardMatchMainPageView extends StatefulWidgetView<
    CardMatchMainPage, CardMatchMainPageController> {
  const CardMatchMainPageView(CardMatchMainPageController controller,
      {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageTransitionSwitcher(
          duration: const Duration(milliseconds: 500),
          transitionBuilder: (Widget child, Animation<double> animation,
              Animation<double> secondaryAnimation) {
            return SharedAxisTransition(
                child: child,
                animation: animation,
                secondaryAnimation: secondaryAnimation,
                transitionType: SharedAxisTransitionType.horizontal);
          },
          child: controller.widgetOptions.elementAt(controller.selectedIndex)),
    );
  }
}
