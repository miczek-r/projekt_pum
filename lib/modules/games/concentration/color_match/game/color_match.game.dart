import 'package:flutter/material.dart';
import 'color_match.game.controller.dart';

class ColorMatchGamePage extends StatefulWidget {

  final Function goToNextPage;
  const ColorMatchGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  ColorMatchGamePageController createState() =>
      ColorMatchGamePageController(goToNextPage);
}
