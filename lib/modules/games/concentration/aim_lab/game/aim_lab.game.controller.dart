import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/game/aim_lab.game.dart';
import 'package:projekt_pum/modules/games/concentration/aim_lab/game/aim_lab.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class AimLabGamePageController extends State<AimLabGamePage> {
  final Function goToNextPage;
  AimLabGamePageController(this.goToNextPage);

  int resultSum = 0;
  int currentAttempt = 0;

  String gameText = "Tap to start";
  IconData gameIcon = FontAwesomeIcons.clock;
  GameState _gameState = GameState.Stop;
  Color backgroundColor = Colors.blue;
  int resultTime = 0;
  late DateTime startTime;
  Timer? waitingTimer;

  List<Widget> balls = [];
  ListGenerator? generator;
  bool isFirst = true;
  int hits = 0;
  int misses = 0;
  int timer = 0;
  int PlayTime = 30;

  @override
  void initState() {
    super.initState();
  }

  void gameControll() {
    (_gameState == GameState.Stop) ? startGame() : stopTimer();
  }

  void startGame() {
    setState(() {
      resultTime = 0;
      _gameState = GameState.Waiting;
      gameIcon = FontAwesomeIcons.ellipsis;
      gameText = "Tap when you hear sound";
    });
    Random rng = Random();
    var waitingTime = rng.nextInt(2000) + 1000;
    waitingTimer = Timer(
        Duration(milliseconds: waitingTime),
        () => {
              startTime = DateTime.now(),
              setState(
                () => {
                  _gameState = GameState.Counting,
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
      gameIcon = FontAwesomeIcons.clock;
      _gameState = GameState.Stop;
    });
    waitingTimer?.cancel();
    if (currentAttempt == 5) {
      goToNextPage(resultSum);
    }
  }

  void callBackSetState() {
    setState(() {
      hits++;
      balls = generator!.getBallList();
    });
  }

  @override
  Widget build(BuildContext context) => AimLabGamePageView(this);
}

class ListGenerator {
  int count;
  double screenWidth;
  double screenHeight;
  double ballSize;
  Color ballColor;
  late final List<double> tops;
  late final List<double> lefts;
  Function setState;

  ListGenerator(this.count, this.ballSize, this.ballColor, this.screenHeight,
      this.screenWidth, this.setState) {
    tops = [];
    lefts = [];
    for (int i = 0; i < count; i++) {
      tops.add(Random().nextInt((screenHeight - ballSize).toInt()).toDouble());
      lefts.add(Random().nextInt((screenWidth - ballSize).toInt()).toDouble());
    }
  }

  List<Widget> getBallList() {
    List<Widget> balls = [];
    for (int i = 0; i < count; i++) {
      balls.add(
        Positioned(
            key: ObjectKey(i),
            left: lefts.elementAt(i),
            top: tops.elementAt(i),
            child: ClipOval(
              child: Material(
                color: ballColor, // Button color
                child: InkWell(
                  // Splash color
                  onTapDown: (TapDownDetails e) {
                    tops[i] = Random()
                        .nextInt((screenHeight - ballSize).toInt())
                        .toDouble();
                    lefts[i] = Random()
                        .nextInt((screenWidth - ballSize).toInt())
                        .toDouble();
                    setState();
                  },
                  onTap: () {},
                  child: SizedBox(width: ballSize, height: ballSize),
                ),
              ),
            )),
      );
    }
    return balls;
  }
}
