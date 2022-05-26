import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.view.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/results/view_reaction.results.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/results/view_reaction.results.view.dart';
import 'package:tuple/tuple.dart';

class ViewReactionResultsPageController extends State<ViewReactionResultsPage> {
  final int result;
  final VoidCallback restartFunction;
  ViewReactionResultsPageController(this.result, this.restartFunction);

 
  @override
  Widget build(BuildContext context) => ViewReactionResultsPageView(this);
}
