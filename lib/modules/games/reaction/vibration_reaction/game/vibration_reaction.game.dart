import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/vibration_reaction/game/vibration_reaction.game.controller.dart';

class VibrationReactionGamePage extends StatefulWidget {
  final Function goToNextPage;
  const VibrationReactionGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  VibrationReactionGamePageController createState() =>
      VibrationReactionGamePageController(goToNextPage);
}
