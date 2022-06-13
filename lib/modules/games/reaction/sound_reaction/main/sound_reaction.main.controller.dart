import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/main/sound_reaction.main.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/main/sound_reaction.main.view.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';

class SoundReactionMainPageController extends State<SoundReactionMainPage> {
  SoundReactionMainPageController();

  int selectedIndex = 0;
  bool isReversing = false;
  late List<Widget> widgetOptions;
  int result = 0;

  @override
  void initState() {
    super.initState();
    widgetOptions = <Widget>[
      GameInformationsPage(goToNextPage: () => nextPage()),
      SoundReactionGamePage(
          goToNextPage: (int result) => nextPage(result: result))
    ];
  }

  void nextPage({result = 0}) {
    setState(() {
      result = (result / 5);
      if (selectedIndex == 1) {
        widgetOptions.length = 2;
        widgetOptions.add(GameResultsPage(
            result: new GameResult("reaction", "sound", result),
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
  Widget build(BuildContext context) => SoundReactionMainPageView(this);
}
