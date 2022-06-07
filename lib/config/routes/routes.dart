import 'package:flutter/widgets.dart';
import 'package:projekt_pum/core/login/login.dart';
import 'package:projekt_pum/core/settings/settings.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/main/sound_reaction.main.dart';
import 'package:projekt_pum/modules/games/memory/card_match/card_match.game.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.dart';
import 'package:projekt_pum/modules/games/word/char_shuffle/main/char_shuffle.main.dart';
import 'package:projekt_pum/modules/main/main.dart';

Map<String, WidgetBuilder> customRoutes = {
  "/home": (context) => Main(),
  "/login": (context) => LoginPage(),
  "/settings": (context) => SettingsPage(),
  "/games/reaction/view": ((context) => ViewReactionMainPage()),
  "/games/reaction/sound": ((context) => SoundReactionMainPage()),
  "/games/word/char_shuffle": ((context) => CharShuffleMainPage()),
  "/games/memory/card_match": ((context) => CardMatchGamePage())
};
