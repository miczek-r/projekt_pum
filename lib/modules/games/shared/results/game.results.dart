import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.controller.dart';

class GameResultsPage extends StatefulWidget {
  final GameResult result;
  final VoidCallback restartFunction;

  const GameResultsPage(
      {Key? key, required this.result, required this.restartFunction})
      : super(key: key);
  @override
  GameResultsPageController createState() =>
      GameResultsPageController(result, restartFunction);
}

class GameResult {
  final String category;
  final String gameName;
  final double score;

  GameResult(this.category, this.gameName, this.score);
}
