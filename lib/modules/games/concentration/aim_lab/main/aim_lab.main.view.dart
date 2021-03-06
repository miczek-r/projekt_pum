import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/main/aim_lab.main.controller.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/main/aim_lab.main.dart';
import 'package:widget_view/widget_view.dart';

class AimLabMainPageView
    extends StatefulWidgetView<AimLabMainPage, AimLabMainPageController> {
  const AimLabMainPageView(AimLabMainPageController controller, {Key? key})
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
