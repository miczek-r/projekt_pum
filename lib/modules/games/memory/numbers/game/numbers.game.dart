import 'package:flutter/material.dart';
import 'numbers.game.controller.dart';

class NumbersGamePage extends StatefulWidget {

  final Function goToNextPage;
  const NumbersGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  NumbersGamePageController createState() =>
      NumbersGamePageController(goToNextPage);
}
