import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'numbers.game.dart';
import 'numbers.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class NumbersGamePageController extends State<NumbersGamePage> {
  final Function goToNextPage;
  NumbersGamePageController(this.goToNextPage);
  int score = 0;
  String numberToRemember = "";
  TextEditingController textFieldController = TextEditingController();
  Timer? countdownTimer;
  Duration duration = const Duration(seconds: 3);
  bool isDisplayingTextField = false;

  @override
  void initState() {
    super.initState();
    startGame();
  }

  void startGame() {
    setState(() {
    isDisplayingTextField = false;
      
    });
    generateNumberToRemember();
    startTimer();
  }

  void generateNumberToRemember(){
    Random rng = Random();
    numberToRemember = "";
    for(int i =0; i<=score;i++){
      numberToRemember += rng.nextInt(9).toString();
    }
  }

  void startTimer() {
    duration = const Duration(seconds: 3);
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    const reduceSecondsBy = 1;
    setState(() {
      final seconds = duration.inSeconds - reduceSecondsBy;
      if (seconds < 0) {
        countdownTimer!.cancel();
        isDisplayingTextField = true;
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
    if (answer == numberToRemember) {
      setState(() => {score += 1, clearTextField()});
      startGame();
    }
    else if(answer.length == numberToRemember.length){
      goToNextPage(score);
    }
  }

  @override
  Widget build(BuildContext context) => NumbersGamePageView(this);
}
