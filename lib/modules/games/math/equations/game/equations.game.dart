import 'package:flutter/material.dart';
import 'equations.game.controller.dart';

class EquationsGamePage extends StatefulWidget {

  final Function goToNextPage;
  const EquationsGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  EquationsGamePageController createState() =>
      EquationsGamePageController(goToNextPage);
}
