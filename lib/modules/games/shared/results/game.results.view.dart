import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.controller.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:widget_view/widget_view.dart';

class GameResultsPageView
    extends StatefulWidgetView<GameResultsPage, GameResultsPageController> {
  const GameResultsPageView(GameResultsPageController controller, {Key? key})
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
                      children: [],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 10,
                child: Material(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Theme.of(context).scaffoldBackgroundColor,
                  child: Column(
                    children: [
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 30),
                          child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Text(ApplicationLocalizations.of(context)!.translate("your_score"),
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 40)),
                                SizedBox(
                                  height: 50,
                                ),
                                Text(
                                    "${controller.result.score.round().toString()}${controller.result.category=='reaction'?'ms':''}",
                                    style: TextStyle(
                                        color: Colors.white, fontSize: 60)),
                                SizedBox(
                                  height: 150,
                                ),
                                GlassButton(
                                  ApplicationLocalizations.of(context)!.translate("play_again"),
                                  () => controller.restartFunction(),
                                ),
                                SizedBox(
                                  height: 20,
                                ),
                                GlassButton(
                                  ApplicationLocalizations.of(context)!.translate("back"),
                                  () => Navigator.of(context).pop(),
                                ),
                              ]),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
