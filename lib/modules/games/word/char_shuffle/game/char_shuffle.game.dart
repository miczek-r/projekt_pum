import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.controller.dart';

import 'char_shuffle.game.controller.dart';

class CharShuffleGamePage extends StatefulWidget {

  final Function goToNextPage;
  const CharShuffleGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  CharShuffleGamePageController createState() =>
      CharShuffleGamePageController(goToNextPage);
}
