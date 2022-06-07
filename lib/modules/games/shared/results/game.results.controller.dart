import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.view.dart';


class GameResultsPageController extends State<GameResultsPage> {
  final int result;
  final VoidCallback restartFunction;
  GameResultsPageController(this.result, this.restartFunction);

 
  @override
  Widget build(BuildContext context) => GameResultsPageView(this);
}
