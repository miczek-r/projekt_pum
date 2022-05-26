import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/informations/view_reaction.informations.controller.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.controller.dart';

class ViewReactionInformationsPage extends StatefulWidget {
  final VoidCallback goToNextPage;
  const ViewReactionInformationsPage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  ViewReactionInformationsPageController createState() =>
      ViewReactionInformationsPageController(goToNextPage);
}
