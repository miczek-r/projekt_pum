import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.controller.dart';
import 'package:projekt_pum/modules/games/reaction/sound_reaction/game/sound_reaction.game.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widget_view/widget_view.dart';

import 'char_shuffle.game.controller.dart';
import 'char_shuffle.game.dart';

class CharShuffleGamePageView extends StatefulWidgetView<CharShuffleGamePage,
    CharShuffleGamePageController> {
  const CharShuffleGamePageView(CharShuffleGamePageController controller,
      {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Theme.of(context).canvasColor,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [Text("2:00", style: TextStyle(fontSize: 25))],
                    )
                  ],
                ),
              ),
              Expanded(
                flex: 2,
                child: Material(
                  clipBehavior: Clip.antiAlias,
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Theme.of(context).primaryColor,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        controller.shuffledWord,
                        style: TextStyle(color: Colors.white, fontSize: 30),
                        textAlign: TextAlign.center,
                      ),
                      Row()
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
