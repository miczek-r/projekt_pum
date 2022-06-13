import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.controller.dart';

class SoundReactionGamePage extends StatefulWidget {

  final Function goToNextPage;
  const SoundReactionGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  SoundReactionGamePageController createState() =>
      SoundReactionGamePageController(goToNextPage);
}
