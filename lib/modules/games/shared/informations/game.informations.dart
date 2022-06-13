import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.controller.dart';

class GameInformationsPage extends StatefulWidget {
  final VoidCallback goToNextPage;
  final String gameName;
  const GameInformationsPage({Key? key, required this.goToNextPage, required this.gameName})
      : super(key: key);

  @override
  GameInformationsPageController createState() =>
      GameInformationsPageController(goToNextPage, gameName);
}
