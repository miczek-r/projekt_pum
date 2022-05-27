import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/core/login/login.view.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/informations/view_reaction.informations.controller.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/informations/view_reaction.informations.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.controller.dart';
import 'package:projekt_pum/modules/games/reaction/view_reaction/main/view_reaction.main.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:widget_view/widget_view.dart';

class ViewReactionInformationsPageView extends StatefulWidgetView<
    ViewReactionInformationsPage, ViewReactionInformationsPageController> {
  const ViewReactionInformationsPageView(
      ViewReactionInformationsPageController controller,
      {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Column(
            children: [
              SizedBox(
                height: 50,
              ),
              Expanded(
                child: Material(
                  borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
                  color: Colors.blue,
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Expanded(
                          flex: 1,
                          child: Center(
                            child: Text(
                              "reakcja na obraz".toUpperCase(),
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.bold),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 6,
                          child: Center(
                            child: Text(
                              "W tej grze musisz nacisnonć na ekran jak pojawi sie zielone światło",
                              style:
                                  TextStyle(color: Colors.white, fontSize: 25),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              GlassButton(
                                  "gramy", () => controller.goToNextPage()),
                              GlassButton(
                                "Powrót",
                                () => Navigator.of(context).pop(),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
