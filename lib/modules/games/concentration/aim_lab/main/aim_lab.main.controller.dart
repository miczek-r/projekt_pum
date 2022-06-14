import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/game/aim_lab.game.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/main/aim_lab.main.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/main/aim_lab.main.view.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';

class AimLabMainPageController extends State<AimLabMainPage> {
  AimLabMainPageController();

  int selectedIndex = 0;
  bool isReversing = false;
  late List<Widget> widgetOptions;
  int result = 0;

  @override
  void initState() {
    super.initState();
    widgetOptions = <Widget>[
      GameInformationsPage(
          goToNextPage: () => nextPage(), gameName: "concentration_aim_lab"),
      AimLabGamePage(goToNextPage: (int result) => nextPage(result: result))
    ];
  }
void nextPage({result = 0}) {
    setState(() {
      result = result * 1.0;
      if (selectedIndex == 1) {
        widgetOptions.length = 2;
        widgetOptions.add(GameResultsPage(
            result: new GameResult("concentration", "aim_lab", result),
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
  Widget build(BuildContext context) => AimLabMainPageView(this);
}
