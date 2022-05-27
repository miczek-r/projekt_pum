import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.controller.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/results/view_reaction.results.controller.dart';

class ViewReactionResultsPage extends StatefulWidget {
  final int result;
  final VoidCallback restartFunction;

  const ViewReactionResultsPage({Key? key, required this.result, required this.restartFunction}) : super(key: key);
  @override
  ViewReactionResultsPageController createState() =>
      ViewReactionResultsPageController(result, restartFunction);
}
