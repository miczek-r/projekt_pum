import 'package:flutter/material.dart';

import 'char_shuffle.game.controller.dart';

class CharShuffleGamePage extends StatefulWidget {

  final Function goToNextPage;
  const CharShuffleGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  CharShuffleGamePageController createState() =>
      CharShuffleGamePageController(goToNextPage);
}
