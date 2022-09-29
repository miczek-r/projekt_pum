import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:widget_view/widget_view.dart';

import 'card_match.game.controller.dart';
import 'card_match.game.dart';

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
              SizedBox(
                height: 20,
              ),
              Text("${ApplicationLocalizations.of(context)!.translate("attempts")}: $attempts", style: TextStyle(color: Colors.black)),
              SizedBox(
                height: 20,
              ),
              GridView(
                  shrinkWrap: true,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      mainAxisSpacing: 0.0, maxCrossAxisExtent: 100),
                  children: List.generate(visiblePairs.length, (index) {
                    return Tile(
                      imageAssetPath: visiblePairs[index].getImageAssetPatch()!,
                      parent: controller,
                      tileIndex: index,
                      onPress: ()=> controller.checkScore()
                    );
                  }))
            ],
          )),
        ));
  }
}
