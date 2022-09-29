import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/game/aim_lab.game.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/game/aim_lab.game.view.dart';

class AimLabGamePageController extends State<AimLabGamePage> {
  final Function goToNextPage;
  AimLabGamePageController(this.goToNextPage);

  double targetTop = 0.0;
  double targetLeft = 0.0;

  int resultSum = 0;
  int currentAttempt = 0;

  Color backgroundColor = Colors.blue;
  late DateTime startTime;
  Timer? waitingTimer;

  bool isFirst = true;
  int score = 0;
  Timer? countdownTimer;
  Duration duration = const Duration(minutes: 1);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
    startGame();
    });
  }

  @override
  void dispose() {
    if (countdownTimer != null) {
      countdownTimer!.cancel();
    }
    super.dispose();
  }

  void startGame() {
    startTimer();
    changeTargetPosition();
    setState(() {
      
    });
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

  targetHit(){
    changeTargetPosition();
    score++;
    setState(() {
      
    });
  }

  changeTargetPosition() {
    Random rng = Random();
    targetLeft = rng.nextDouble()*(MediaQuery.of(context).size.width-40);
    targetTop = rng.nextDouble()*(MediaQuery.of(context).size.height-170);
  }

  @override
  Widget build(BuildContext context) => AimLabGamePageView(this);
}
