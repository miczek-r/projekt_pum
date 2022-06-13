import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.view.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';

import 'char_shuffle.game.dart';
import 'char_shuffle.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class CharShuffleGamePageController extends State<CharShuffleGamePage> {
  final Function goToNextPage;
  CharShuffleGamePageController(this.goToNextPage);
  String wordPreShuffle = "";
  String shuffledWord = "";
  List<String> allWords = [];
  int score = 0;
  TextEditingController textFieldController = TextEditingController();
  Timer? countdownTimer;
  Duration duration = Duration(minutes: 1);

  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
    loadData().then(
      (value) => {generateAndShuffleWord()},
    );
    });
  }

  Future loadData() async {
    String wordsInOneString =
        await rootBundle.loadString("assets/data/${ApplicationLocalizations.of(context)!.locale.languageCode}_words.txt");
    allWords = wordsInOneString.split("\n");
    startTimer();
  }

  generateAndShuffleWord() {
    Random rng = Random();
    int randomWordIndex = rng.nextInt(allWords.length);
    wordPreShuffle = allWords[randomWordIndex].trim().toLowerCase();
    List wordChars = wordPreShuffle.split("");
    wordChars.shuffle();
    setState(() {
      shuffledWord = wordChars.join();
    });
  }

  void startTimer() {
    countdownTimer =
        Timer.periodic(Duration(seconds: 1), (_) => setCountDown());
  }

  void setCountDown() {
    final reduceSecondsBy = 1;
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

  changeWord() {
    generateAndShuffleWord();
    clearTextField();
  }

  clearTextField() {
    textFieldController.clear();
    setState(() {});
  }

  checkIfProper(String answer) {
    if (answer.toLowerCase() == wordPreShuffle) {
      generateAndShuffleWord();
      setState(() => {score += 1, clearTextField()});
    }
  }

  @override
  Widget build(BuildContext context) => CharShuffleGamePageView(this);
}
