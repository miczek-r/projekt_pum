import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/informations/game.informations.controller.dart';

class GameInformationsPage extends StatefulWidget {
  final VoidCallback goToNextPage;
  const GameInformationsPage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  GameInformationsPageController createState() =>
      GameInformationsPageController(goToNextPage);
}
