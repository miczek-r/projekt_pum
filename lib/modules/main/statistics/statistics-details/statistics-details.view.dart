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
      child: Column(
        children: [
          Text(controller.gameName.item1),
          Text(controller.gameName.item2),
          Padding(
            padding: EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: 2,
              child: LineChart(
                controller.mainData(),
                swapAnimationDuration: Duration(milliseconds: 150), // Optional
                swapAnimationCurve: Curves.linear, // Optional
              ),
            ),
          )
        ],
      ),
    ));
  }
}
