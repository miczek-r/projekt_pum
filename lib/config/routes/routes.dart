import 'package:flutter/widgets.dart';
import 'package:projekt_pum/core/login/login.dart';
import 'package:projekt_pum/core/settings/settings.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.dart';
import 'package:projekt_pum/modules/main/main.dart';

Map<String, WidgetBuilder> customRoutes = {
  "/r": (context) => Main(),
  "/": (context) => LoginPage(),
  "/settings": (context) => SettingsPage(),
  "/games/reaction/view": ((context) => ViewReactionMainPage())
};
