import 'package:flutter/material.dart';
import 'which_is_more.game.controller.dart';

class WhichIsMoreGamePage extends StatefulWidget {

  final Function goToNextPage;
  const WhichIsMoreGamePage({Key? key, required this.goToNextPage})
      : super(key: key);

  @override
  WhichIsMoreGamePageController createState() =>
      WhichIsMoreGamePageController(goToNextPage);
}
