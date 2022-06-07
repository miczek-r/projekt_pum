import 'dart:async';
import 'dart:math';
import 'dart:typed_data';

import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.view.dart';

import 'char_shuffle.game.dart';
import 'char_shuffle.game.view.dart';

enum GameState { Stop, Waiting, Counting }

class CharShuffleGamePageController extends State<CharShuffleGamePage> {
  final Function goToNextPage;
  CharShuffleGamePageController(this.goToNextPage);
  String shuffledWord = "";
  List<String> allWords = [];

  @override
  void initState() {
    super.initState();
    loadData().then(
      (value) => {generateAndShuffleWord()},
    );
  }

  Future loadData() async {
    String wordsInOneString =
        await rootBundle.loadString("assets/data/english_words.txt");
    allWords = wordsInOneString.split("\n");
  }

  generateAndShuffleWord() {
    Random rng = Random();
    int randomWordIndex = rng.nextInt(allWords.length);
    List wordChars = allWords[randomWordIndex].split("");
    wordChars.shuffle();
    setState(() {
      shuffledWord = wordChars.join();
    });
  }

  @override
  Widget build(BuildContext context) => CharShuffleGamePageView(this);
}
