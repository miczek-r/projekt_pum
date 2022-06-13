import 'package:flutter/widgets.dart';
import 'package:projekt_pum/core/login/login.dart';
import 'package:projekt_pum/core/settings/settings.dart';
import 'package:projekt_pum/modules/games/concentration/color_match/main/color_match.main.dart';
import 'package:projekt_pum/modules/games/math/equations/main/equations.main.dart';
import 'package:projekt_pum/modules/games/math/which_is_more/main/which_is_more.main.dart';
import 'package:projekt_pum/modules/games/memory/card_match/main/card_match.main.dart';
import 'package:projekt_pum/modules/games/memory/numbers/main/numbers.main.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/main/aim_lab.main.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/main/sound_reaction.main.dart';
import 'package:projekt_pum/modules/games/reaction/vibration_reaction/main/vibration_reaction.main.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.dart';
import 'package:projekt_pum/modules/games/word/char_shuffle/main/char_shuffle.main.dart';
import 'package:projekt_pum/modules/main/main.dart';

Map<String, WidgetBuilder> customRoutes = {
  "/home": (context) => Main(),
  "/login": (context) => LoginPage(),
  "/settings": (context) => SettingsPage(),
  "/games/reaction/view": ((context) => ViewReactionMainPage()),
  "/games/reaction/sound": ((context) => SoundReactionMainPage()),
  "/games/reaction/vibration": ((context) => VibrationReactionMainPage()),
  "/games/word/char_shuffle": ((context) => CharShuffleMainPage()),
  "/games/memory/card_match": ((context) => CardMatchMainPage()),
  "/games/memory/numbers":(context) => NumbersMainPage(),
  "/games/math/equations": (((context) => EquationsMainPage())),
  "/games/math/which_is_more":(context) => WhichIsMoreMainPage(),
  "/games/concentration/aim_lab": ((context) => AimLabMainPage()),
  "/games/concentration/color_match": ((context) => ColorMatchMainPage())
};
