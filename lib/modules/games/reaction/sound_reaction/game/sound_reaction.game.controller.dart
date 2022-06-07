import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class SoundReactionGamePageController extends State<SoundReactionGamePage> {
  final Function goToNextPage;
  SoundReactionGamePageController(this.goToNextPage);

  int resultSum = 0;
  int currentAttempt = 0;

  String gameText = "Tap to start";
  IconData gameIcon = FontAwesomeIcons.clock;
  GameState _gameState = GameState.Stop;
  Color backgroundColor = Colors.blue;
  int resultTime = 0;
  late DateTime startTime;
  Timer? waitingTimer;

  AudioPlayer audioPlayer = AudioPlayer(mode: PlayerMode.LOW_LATENCY);
  late AudioCache audioCache;
  String path = "sounds/honk.wav";

  @override
  void initState() {
    audioCache = AudioCache(fixedPlayer: audioPlayer);
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
              playLocal(),
              setState(
                () => {
                  _gameState = GameState.Counting,
                },
              ),
            });
  }

  playLocal() async {
    await audioCache.play(path);
  }

  void stopTimer() {
    audioPlayer.stop();
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

  @override
  Widget build(BuildContext context) => SoundReactionGamePageView(this);
}
