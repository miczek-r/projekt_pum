import 'dart:ui';

import 'package:animations/animations.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/main/home/home.controller.dart';
import 'package:projekt_pum/modules/main/home/home.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_container/glass_container.dart';
import 'package:widget_view/widget_view.dart';

class HomePageView extends StatefulWidgetView<HomePage, HomePageController> {
  const HomePageView(HomePageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: 140,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Row(
                    children: [
                      InkWell(
                        child: CircleAvatar(
                          backgroundColor: Colors.white,
                          radius: 40,
                          child: FaIcon(FontAwesomeIcons.userAstronaut, size: 40,)
                        ),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Text(
                                  controller.currentUser?.displayName ??
                                      "",
                                  style: TextStyle(
                                    color: Colors.white,
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              Text(controller.currentUser?.phoneNumber ??
                                      "",
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.bold)),
                            ],
                          )
                        ],
                      ),
                      Expanded(
                        child: Row(),
                      ),
                      IconButton(
                          onPressed: () =>
                              Navigator.of(context).pushNamed("/settings").then((value) => controller.updateUser()),
                          icon: FaIcon(
                            FontAwesomeIcons.cog,
                            color: Colors.white,
                          )),
                    ],
                  ),
                )),
            Column(
              children: [
                SizedBox(
                  height: 140,
                ),
                Expanded(
                    child: GlassContainer(
                        child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    AspectRatio(
                      aspectRatio: 1,
                      child: RadarChart(
                          RadarChartData(
                            dataSets: controller.showingDataSets(),
                            borderData: FlBorderData(show: false),
                            radarBorderData:
                                const BorderSide(color: Colors.transparent),
                            titleTextStyle: TextStyle(
                                color: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .color,
                                fontSize: 15),
                            getTitle: (index) =>
                                ApplicationLocalizations.of(context)!
                                    .translate(controller.getTitle(index)),
                            tickCount: 1,
                            ticksTextStyle:
                                const TextStyle(color: Colors.transparent),
                            tickBorderData:
                                const BorderSide(color: Colors.transparent),
                            gridBorderData: BorderSide(
                                color: Theme.of(context).primaryColor,
                                width: 2),
                          ),
                          swapAnimationDuration: Duration(milliseconds: 400)),
                    ),
                  ],
                ))),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
