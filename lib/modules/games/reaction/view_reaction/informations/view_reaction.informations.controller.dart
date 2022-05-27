import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/informations/view_reaction.informations.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/informations/view_reaction.informations.view.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.view.dart';
import 'package:tuple/tuple.dart';

class ViewReactionInformationsPageController
    extends State<ViewReactionInformationsPage> {
  final VoidCallback goToNextPage;
  ViewReactionInformationsPageController(this.goToNextPage);

  @override
  Widget build(BuildContext context) => ViewReactionInformationsPageView(this);
}
