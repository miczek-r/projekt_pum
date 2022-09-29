import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'equations.game.dart';
import 'equations.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class EquationsGamePageController extends State<EquationsGamePage> {
  final Function goToNextPage;
  EquationsGamePageController(this.goToNextPage);
  int score = 0;
  int result = 0;
  TextEditingController textFieldController = TextEditingController();
  Timer? countdownTimer;
  Duration duration = const Duration(minutes: 1);
  String equation = "";

  @override
  void initState() {
    super.initState();
    startGame();
  }
  
  @override
  void dispose() {
    if(countdownTimer!=null) {
      countdownTimer!.cancel();
    }
    super.dispose();
  }

  void startGame() {
    generateEquation();
    startTimer();
  }

  void generateEquation() {
    Random rng = Random();
    int operation = rng.nextInt(3);
    switch (operation) {
      case 0:
        int x = rng.nextInt(20);
        int y = rng.nextInt(20);
        result = x + y;
        equation = "$x + $y";
        break;
      case 1:
        int y = rng.nextInt(10);
        int x = rng.nextInt(10) + y;
        result = x - y;
        equation = "$x - $y";
        break;
      case 2:
        int x = rng.nextInt(10);
        int y = rng.nextInt(10);
        result = x * y;
        equation = "$x * $y";
        break;
      case 3:
        int y = rng.nextInt(10);
        int x = rng.nextInt(10) * y;
        result = (x / y).round();
        equation = "$x / $y";
        break;
    }
    setState(() {});
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        goToNextPage(score);
      } else {
        duration = Duration(seconds: seconds);
      }
    });
  }

  clearTextField() {
    textFieldController.clear();
    setState(() {});
  }

  checkIfProper(String answer) {
    if (int.tryParse(answer) == result) {
      generateEquation();
      setState(() => {score += 1, clearTextField()});
    }
  }

  @override
  Widget build(BuildContext context) => EquationsGamePageView(this);
}
