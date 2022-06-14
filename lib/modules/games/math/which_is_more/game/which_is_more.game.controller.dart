import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

import 'which_is_more.game.dart';
import 'which_is_more.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class WhichIsMoreGamePageController extends State<WhichIsMoreGamePage> {
  final Function goToNextPage;
  WhichIsMoreGamePageController(this.goToNextPage);
  int score = 0;
  int result = 0;
  TextEditingController textFieldController = TextEditingController();
  Timer? countdownTimer;
  Duration duration = const Duration(minutes: 1);
  String equationLeft = "";
  String equationRight = "";

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
    generateEquations();
    startTimer();
  }

  void generateEquations() {
    result = 0;
    equationLeft="";
    equationLeft = generateEquation();
    equationRight = generateEquation();
  }

  String generateEquation() {
    String equation = "";
    Random rng = Random();
    int operation = rng.nextInt(3);
    switch (operation) {
      case 0:
        int x = rng.nextInt(20);
        int y = rng.nextInt(20);
        result += (x + y)*((equationLeft=="")?1:-1);
        equation = "$x + $y";
        break;
      case 1:
        int y = rng.nextInt(10);
        int x = rng.nextInt(10) + y;
        result += (x - y)*((equationLeft=="")?1:-1);
        equation = "$x - $y";
        break;
      case 2:
        int x = rng.nextInt(10);
        int y = rng.nextInt(10);
        result += (x * y)*((equationLeft=="")?1:-1);
        equation = "$x * $y";
        break;
      case 3:
        int y = rng.nextInt(10);
        int x = rng.nextInt(10) * y;
        result += ((x / y).round())*((equationLeft=="")?1:-1);
        equation = "$x / $y";
        break;
    }
    return equation;
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
checkIfRight(int whichGreater){
    if(whichGreater == 0 && result>0){
      score++;
    }else if(whichGreater == 1 && result==0){
      score++;
    }else if(whichGreater == 2 && result<0){
      score++;
    }else{
      if(score>0){
        score--;
      }
    }
    generateEquations();
    setState(() {
      
    });
  }
  @override
  Widget build(BuildContext context) => WhichIsMoreGamePageView(this);
}
