import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.controller.dart';

class ViewReactionGamePage extends StatefulWidget {

  final Function goToNextPage;
  const ViewReactionGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  ViewReactionGamePageController createState() =>
      ViewReactionGamePageController(goToNextPage);
}
