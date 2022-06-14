import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'color_match.game.dart';
import 'color_match.game.view.dart';

class GameColor{
  final String colorName;
  final Color color;

  GameColor(this.colorName, this.color);
}

class ColorMatchGamePageController extends State<ColorMatchGamePage> {
  final Function goToNextPage;
  ColorMatchGamePageController(this.goToNextPage);
  int score = 0;
  int result = 0;
  TextEditingController textFieldController = TextEditingController();
  Timer? countdownTimer;
  Duration duration = const Duration(minutes: 1);
  String text = "";
  Color textColor = Colors.blue;
  bool isMatching = false;

  List<GameColor> posibleColors = [
    new GameColor("red", Colors.red),
    new GameColor("grey", Colors.blueGrey),
    new GameColor("white", Colors.white),
    new GameColor("black", Colors.black),
    new GameColor("yellow", Colors.yellow)
  ];

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
    generateColoredText();
    startTimer();
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(const Duration(seconds: 1), (_) => setCountDown());
  }

  generateColoredText(){
    Random rng = Random();
    if(rng.nextBool()){
      isMatching = true;
      var colorIndex = rng.nextInt(posibleColors.length);
      textColor = posibleColors[colorIndex].color;
      text = posibleColors[colorIndex].colorName;
    }else{
      isMatching = false;
var colorIndex = rng.nextInt(posibleColors.length);
      textColor = posibleColors[colorIndex].color;
      var textIndex = colorIndex;
      while(textIndex == colorIndex){
        textIndex = rng.nextInt(posibleColors.length);
      }
      text = posibleColors[textIndex].colorName;
    }setState(() {
      
    });
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

  checkIfRight(bool isMatching){
    if(this.isMatching == isMatching){
      score++;
    }else{
      if(score>0){
        score--;
      }
    }
    generateColoredText();
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) => ColorMatchGamePageView(this);
}
