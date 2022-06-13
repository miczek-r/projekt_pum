import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';

import '../game/which_is_more.game.dart';
import 'which_is_more.main.dart';
import 'which_is_more.main.view.dart';

class WhichIsMoreMainPageController extends State<WhichIsMoreMainPage> {
  WhichIsMoreMainPageController();

  int selectedIndex = 0;
  bool isReversing = false;
  late List<Widget> widgetOptions;
  int result = 0;

  @override
  void initState() {
    super.initState();
    widgetOptions = <Widget>[
      GameInformationsPage(goToNextPage: () => nextPage(),gameName: "math_which_is_more"),
      WhichIsMoreGamePage(
          goToNextPage: (int result) => nextPage(result: result))
    ];
  }

  void nextPage({result = 0}) {
    setState(() {
      result = result * 1.0;
      if (selectedIndex == 1) {
        widgetOptions.length = 2;
        widgetOptions.add(GameResultsPage(
            result: new GameResult("math", "which_is_more", result),
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
  Widget build(BuildContext context) => WhichIsMoreMainPageView(this);
}
