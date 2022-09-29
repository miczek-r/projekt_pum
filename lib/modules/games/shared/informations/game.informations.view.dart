import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.controller.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:widget_view/widget_view.dart';

class GameInformationsPageView extends StatefulWidgetView<
    GameInformationsPage, GameInformationsPageController> {
  const GameInformationsPageView(
      GameInformationsPageController controller,
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
          ),
          Expanded(
            child: Material(
              borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
              color: Theme.of(context).scaffoldBackgroundColor,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: Center(
                        child: Text(
                          ApplicationLocalizations.of(context)!.translate(controller.gameName).toUpperCase(),
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontWeight: FontWeight.bold),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Center(
                        child: Text(
                          ApplicationLocalizations.of(context)!.translate("${controller.gameName}_description"),
                          style: TextStyle(color: Colors.white, fontSize: 25),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GlassButton(ApplicationLocalizations.of(context)!.translate("play"), () => controller.goToNextPage()),
                          GlassButton(
                            ApplicationLocalizations.of(context)!.translate("back"),
                            () => Navigator.of(context).pop(),
                          ),
                        ],
                      ),
                    ),
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
