import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.view.dart';

class GameInformationsPageController
    extends State<GameInformationsPage> {
      final String gameName;
  final VoidCallback goToNextPage;
  GameInformationsPageController(this.goToNextPage, this.gameName);

  @override
  Widget build(BuildContext context) => GameInformationsPageView(this);
}
