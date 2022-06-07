import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.controller.dart';

class GameResultsPage extends StatefulWidget {
  final int result;
  final VoidCallback restartFunction;

  const GameResultsPage({Key? key, required this.result, required this.restartFunction}) : super(key: key);
  @override
  GameResultsPageController createState() =>
      GameResultsPageController(result, restartFunction);
}
