import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'card_match.game.dart';
import 'card_match.game.view.dart';

enum GameState { Stop, Waiting, Counting }

int points = 0;
int attempts = 30;
bool selected = false;
String selectedImageAssetPath = "";
int selectedTileIndex = 0;

class CardMatchGamePageController extends State<CardMatchGamePage> {
  final Function goToNextPage;
  CardMatchGamePageController(this.goToNextPage);

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    reStart();
  }

  void reStart() {
    pairs = getPairs();
    pairs.shuffle();
    points = 0;
    attempts = 30;
    visiblePairs = pairs;
    Future.delayed(const Duration(seconds: 4), () {
// Here you can write your code
      setState(() {
        print("2 seconds done");
        // Here you can write your code for open new view
        visiblePairs = getQuestions();
        selected = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) => CardMatchGamePageView(this);
}

class Tile extends StatefulWidget {
  String imageAssetPath;

  int tileIndex;
  CardMatchGamePageController parent;
  Tile(
      {required this.imageAssetPath,
      required this.parent,
      required this.tileIndex});

  @override
  State<Tile> createState() => _TileState();
}

class _TileState extends State<Tile> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          if (!selected) {
            setState(() {
              pairs[widget.tileIndex].setIsSelected(true);
            });
            if (selectedImageAssetPath != "") {
              /// testing if the selected tiles are same
              if (selectedImageAssetPath ==
                  pairs[widget.tileIndex].getImageAssetPatch()) {
                print("add point");
                points = points + 100;
                attempts = attempts - 2;

                print(selectedImageAssetPath +
                    " thishis" +
                    widget.imageAssetPath);

                TileModel tileModel = new TileModel();
                print(widget.tileIndex);
                selected = true;
                Future.delayed(const Duration(seconds: 1), () {
                  tileModel.setImageAssetPath("");
                  pairs[widget.tileIndex] = tileModel;
                  print(selectedTileIndex);
                  pairs[selectedTileIndex] = tileModel;
                  this.widget.parent.setState(() {});
                  setState(() {
                    selected = false;
                  });
                  selectedImageAssetPath = "";
                });
              } else {
                attempts = attempts - 2;

                print(selectedImageAssetPath +
                    " thishis " +
                    pairs[widget.tileIndex].getImageAssetPatch()!);
                print("wrong choice");
                print(widget.tileIndex);
                print(selectedTileIndex);
                selected = true;
                Future.delayed(const Duration(seconds: 1), () {
                  this.widget.parent.setState(() {
                    pairs[widget.tileIndex].setIsSelected(false);
                    pairs[selectedTileIndex].setIsSelected(false);
                  });
                  setState(() {
                    selected = false;
                  });
                });

                selectedImageAssetPath = "";
              }
            } else {
              setState(() {
                selectedImageAssetPath =
                    pairs[widget.tileIndex].getImageAssetPatch()!;
                selectedTileIndex = widget.tileIndex;
              });

              print(selectedImageAssetPath);
              print(selectedTileIndex);
            }
          }
        },
        child: Container(
          margin: EdgeInsets.all(5),
          child: pairs[widget.tileIndex].getImageAssetPatch() != ""
              ? Image.asset(pairs[widget.tileIndex].getIsSelected()!
                  ? pairs[widget.tileIndex].getImageAssetPatch()!
                  : widget.imageAssetPath)
              : Container(
                  color: Colors.white,
                  child: Image.asset("assets/images/correct.png"),
                ),
        ));
  }
}

class TileModel {
  String? imageAssetPath;
  bool? isSelected;

  TileModel({this.imageAssetPath, this.isSelected});

  void setImageAssetPath(String getImageAssetPatch) {
    imageAssetPath = getImageAssetPatch;
  }

  void setIsSelected(bool getIsSelected) {
    isSelected = getIsSelected;
  }

  String? getImageAssetPatch() {
    return imageAssetPath;
  }

  bool? getIsSelected() {
    return isSelected;
  }
}

List<TileModel> visiblePairs = <TileModel>[];
List<TileModel> pairs = <TileModel>[];

List<TileModel> getPairs() {
  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = new TileModel();
  //1
  tileModel.setImageAssetPath("assets/images/bear.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //2
  tileModel.setImageAssetPath("assets/images/bull.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //3
  tileModel.setImageAssetPath("assets/images/crocodile.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //4
  tileModel.setImageAssetPath("assets/images/eagle.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //5
  tileModel.setImageAssetPath("assets/images/goat.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //6
  tileModel.setImageAssetPath("assets/images/kangaroo.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //7
  tileModel.setImageAssetPath("assets/images/owl.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //8
  tileModel.setImageAssetPath("assets/images/penguin.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}

List<TileModel> getQuestions() {
  List<TileModel> pairs = <TileModel>[];
  TileModel tileModel = new TileModel();
  //1
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //2
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //3
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //4
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //5
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //6
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //7
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();
  //8
  tileModel.setImageAssetPath("assets/images/question.png");
  tileModel.setIsSelected(false);
  pairs.add(tileModel);
  pairs.add(tileModel);

  tileModel = new TileModel();

  return pairs;
}
