import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';

import '../game/color_match.game.dart';
import 'color_match.main.dart';
import 'color_match.main.view.dart';

class ColorMatchMainPageController extends State<ColorMatchMainPage> {
  ColorMatchMainPageController();

  int selectedIndex = 0;
  bool isReversing = false;
  late List<Widget> widgetOptions;
  int result = 0;

  @override
  void initState() {
    super.initState();
    widgetOptions = <Widget>[
      GameInformationsPage(goToNextPage: () => nextPage(),gameName: "concentration_color_match"),
      ColorMatchGamePage(
          goToNextPage: (int result) => nextPage(result: result))
    ];
  }

  void nextPage({result = 0}) {
    setState(() {
      result = result * 1.0;
      if (selectedIndex == 1) {
        widgetOptions.length = 2;
        widgetOptions.add(GameResultsPage(
            result: new GameResult("concentration", "color_match", result),
            restartFunction: () => restart()));
      }
      selectedIndex++;
    });
  }

  void restart() {
    setState(() {
      selectedIndex = 0;
    });
  }

  @override
  Widget build(BuildContext context) => ColorMatchMainPageView(this);
}
