import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/games/reaction/aim_lab/game/aim_lab.game.controller.dart';

class AimLabGamePage extends StatefulWidget {
  final Function goToNextPage;
  const AimLabGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  AimLabGamePageController createState() =>
      AimLabGamePageController(goToNextPage);
}
