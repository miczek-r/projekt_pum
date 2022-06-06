import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/games/memory/card_match/card_match.game.controller.dart';
import 'package:projekt_pum/modules/games/memory/card_match/card_match.game.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.controller.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/game/view_reaction.game.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:widget_view/widget_view.dart';

class CardMatchGamePageView
    extends StatefulWidgetView<CardMatchGamePage, CardMatchGamePageController> {
  CardMatchGamePageView(CardMatchGamePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: Padding(
          padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
          child: SafeArea(
              child: Column(
            children: <Widget>[
              Text("$points", style: TextStyle(fontSize: 24)),
              Text("Points"),
              SizedBox(
                height: 20,
              ),
              Text("Attempts: $attempts"),
              SizedBox(
                height: 20,
              ),
              (attempts != 0 && points != 800)
                  ? GridView(
                      shrinkWrap: true,
                      gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          mainAxisSpacing: 0.0, maxCrossAxisExtent: 100),
                      children: List.generate(visiblePairs.length, (index) {
                        return Tile(
                          imageAssetPath:
                              visiblePairs[index].getImageAssetPatch()!,
                          parent: controller,
                          tileIndex: index,
                        );
                      }))
                  : Expanded(
                      flex: 2,
                      child: Column(
                        children: [
                          Material(
                            borderRadius:
                                BorderRadius.vertical(top: Radius.circular(50)),
                            child: InkWell(
                              onTap: () {
                                controller.setState(() {
                                  points = 0;
                                  controller.reStart();
                                });
                              },
                              child: Container(
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.blue,
                                  borderRadius: BorderRadius.circular(24),
                                ),
                                child: Text(
                                  "Replay",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 17,
                                      fontWeight: FontWeight.w500),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
            ],
          )),
        ));
  }
}
