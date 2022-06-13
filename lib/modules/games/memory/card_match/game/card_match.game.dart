import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.controller.dart';

import 'card_match.game.controller.dart';

class CardMatchGamePage extends StatefulWidget {

  final Function goToNextPage;
  const CardMatchGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  CardMatchGamePageController createState() =>
      CardMatchGamePageController(goToNextPage);
}
