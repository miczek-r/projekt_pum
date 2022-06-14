import 'package:flutter/material.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_button/glass_button.dart';
import 'package:projekt_pum/utils/ui/glass_textfield/glass_textfield.dart';
import 'package:widget_view/widget_view.dart';

import 'which_is_more.game.controller.dart';
import 'which_is_more.game.dart';

class WhichIsMoreGamePageView extends StatefulWidgetView<WhichIsMoreGamePage,
    WhichIsMoreGamePageController> {
  const WhichIsMoreGamePageView(WhichIsMoreGamePageController controller,
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
                      children: [
                        Text(
                            "${controller.duration.inMinutes}:${controller.duration.inSeconds.remainder(60)} - ${controller.score.round()}",
                            style: TextStyle(fontSize: 25))
                      ],
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
                  child: Padding(
                    padding: EdgeInsets.all(20),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(height: 20),
                        Text(
                          "${controller.equationLeft} ?? ${controller.equationRight}",
                          style: TextStyle(color: Colors.white, fontSize: 30),
                          textAlign: TextAlign.center,
                        ),
                         Row(children: [Expanded(
                          child: GlassButton(ApplicationLocalizations.of(context)!.translate("left")
                            , ()=> controller.checkIfRight(0)),
                        ),
                        SizedBox(width: 20),Expanded(
                          child: GlassButton(ApplicationLocalizations.of(context)!.translate("equal")
                            , ()=> controller.checkIfRight(1)),
                        ),
                        SizedBox(width: 20),Expanded(
                          child: GlassButton(ApplicationLocalizations.of(context)!.translate("right")
                            , ()=> controller.checkIfRight(2)),
                        ),
                         ]),
                        SizedBox(height: 20),
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
