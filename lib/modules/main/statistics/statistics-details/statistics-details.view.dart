import 'dart:ui';

import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.controller.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.dart';
import 'package:projekt_pum/modules/main/training/training.view.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_container/glass_container.dart';
import 'package:widget_view/widget_view.dart';

import 'statistics-details.controller.dart';
import 'statistics-details.dart';

class StatisticsDetailsPageView extends StatefulWidgetView<
    StatisticsDetailsPage, StatisticsDetailsPageController> {
  const StatisticsDetailsPageView(StatisticsDetailsPageController controller,
      {Key? key})
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
                  padding: const EdgeInsets.symmetric(horizontal:15.0),
                  child: Center(
                      child: Flexible(
                        child: FittedBox(
                          child: Text(
                                          ApplicationLocalizations.of(context)!.translate("${controller.gameName.item1}_${controller.gameName.item2}").toUpperCase(),
                                          style: TextStyle(
                            color: Colors.white, fontSize: 40, letterSpacing: 1.2),
                                        ),
                        ),
                      )),
                )),
            CustomScrollView(
              physics: BouncingScrollPhysics(),
              slivers: [
                SliverFillRemaining(
                  hasScrollBody: false,
                  child: Column(
                    children: [
                      SizedBox(
                        height: 140,
                      ),
                      Expanded(
                        child: GlassContainer(
                          child: (controller.results.length>0)?Padding(
            padding: EdgeInsets.all(20),
            child: Column(
              children: [
                SizedBox(height:20),
                if(controller.highScore!=null)
                Text(ApplicationLocalizations.of(context)!.translate("high_score")+"\n${controller.highScore!.score}", style: TextStyle(fontSize: 30, ), textAlign: TextAlign.center,),
                SizedBox(height: 100,),
                AspectRatio(
                  aspectRatio: 2,
                  child: LineChart(
                    controller.mainData(),
                    swapAnimationDuration: Duration(milliseconds: 150), // Optional
                    swapAnimationCurve: Curves.linear, // Optional
                  ),
                ),
              ],
            ),
          ):Padding(
            padding: const EdgeInsets.all(50.0),
            child: Center(child: Text(ApplicationLocalizations.of(context)!.translate("no_results"),textAlign:TextAlign.center, style: TextStyle(fontSize: 30),),),
          )
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
            SizedBox(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}
