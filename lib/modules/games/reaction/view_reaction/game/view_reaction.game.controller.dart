import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class ViewReactionGamePageController extends State<ViewReactionGamePage> {
  final Function goToNextPage;
  ViewReactionGamePageController(this.goToNextPage);

  int resultSum = 0;
  int currentAttempt = 0;

  String gameText = "Tap to start";
  IconData gameIcon = FontAwesomeIcons.clock;
  GameState _gameState = GameState.Stop;
  Color backgroundColor = Colors.blue;
  int resultTime = 0;
  late DateTime startTime;
  Timer? waitingTimer;

  void gameControll() {
    (_gameState == GameState.Stop) ? startGame() : stopTimer();
  }

  void startGame() {
    setState(() {
      resultTime = 0;
      _gameState = GameState.Waiting;
      backgroundColor = Colors.red;
      gameIcon = FontAwesomeIcons.ellipsis;
      gameText = "Wait for green";
    });

    Random rng = Random();
    var waitingTime = rng.nextInt(2000) + 1000;
    waitingTimer = Timer(
        Duration(milliseconds: waitingTime),
        () => {
              startTime = DateTime.now(),
              setState(
                () => {
                  backgroundColor = Colors.green,
                  gameIcon = FontAwesomeIcons.exclamation,
                  _gameState = GameState.Counting,
                  gameText = "Press",
                },
              ),
            });
  }

  void stopTimer() {
    setState(() {
      if (_gameState == GameState.Counting) {
        resultTime = DateTime.now().difference(startTime).inMilliseconds;
        currentAttempt++;
        resultSum += resultTime;
      }
      gameText = (_gameState == GameState.Waiting)
          ? "Too soon\nTap to continue"
          : "${resultTime.toString()}ms";
      backgroundColor = Colors.blue;
      gameIcon = FontAwesomeIcons.clock;
      _gameState = GameState.Stop;
    });
    waitingTimer?.cancel();
    if (currentAttempt == 5) {
      goToNextPage(resultSum);
    }
  }

  @override
  Widget build(BuildContext context) => ViewReactionGamePageView(this);
}
