import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';

import '../game/char_shuffle.game.dart';
import 'char_shuffle.main.dart';
import 'char_shuffle.main.view.dart';

class CharShuffleMainPageController extends State<CharShuffleMainPage> {
  CharShuffleMainPageController();

  int selectedIndex = 0;
  bool isReversing = false;
  late List<Widget> widgetOptions;
  int result = 0;

  @override
  void initState() {
    super.initState();
    widgetOptions = <Widget>[
      GameInformationsPage(goToNextPage: () => nextPage()),
      CharShuffleGamePage(
          goToNextPage: (int result) => nextPage(result: result))
    ];
  }

  void nextPage({result = 0}) {
    setState(() {
      result = (result / 5).round();
      if (selectedIndex == 1) {
        widgetOptions.length = 2;
        widgetOptions.add(
            GameResultsPage(result: result, restartFunction: () => restart()));
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
  Widget build(BuildContext context) => CharShuffleMainPageView(this);
}
