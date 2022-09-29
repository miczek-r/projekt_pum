import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/main/statistics/statistics-details/statistics-details.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.controller.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.dart';
import 'package:projekt_pum/modules/main/training/training.view.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_container/glass_container.dart';
import 'package:tuple/tuple.dart';
import 'package:widget_view/widget_view.dart';

class StatisticsPageView
    extends StatefulWidgetView<StatisticsPage, StatisticsPageController> {
  const StatisticsPageView(StatisticsPageController controller, {Key? key})
      : super(controller, key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            SizedBox(
                height: 140,
                child: Center(
                    child: Text(
                  ApplicationLocalizations.of(context)!.translate("statistics").toUpperCase(),
                  style: TextStyle(
                      color: Colors.white, fontSize: 40, letterSpacing: 1.2),
                ))),
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
                          child: Padding(
                            padding: const EdgeInsets.all(25.0),
                            child: Column(
                                children: controller.games.entries
                                    .map((entry) => StatisticsRow(entry))
                                    .toList()),
                          ),
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


class StatisticsRow extends StatelessWidget {
  final MapEntry<String, Set<Tuple2<String,IconData>>> category;

  const StatisticsRow(this.category, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            Text(ApplicationLocalizations.of(context)!.translate(category.key)),
          ],
        ),
        SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          scrollDirection: Axis.horizontal,
          child: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              ...category.value
                  .map(
                    (gameTuple) => Row(
                      children: [
                        Column(
                          children: [
                            Material(
                              clipBehavior: Clip.none,
                              borderRadius: BorderRadius.circular(50),
                              elevation: 10,
                              child: InkWell(
                                onTap: () => Navigator.of(context).push(
                                    MaterialPageRoute(
                                        builder: (builder) =>
                                            StatisticsDetailsPage(
                                                gameName: new Tuple2(
                                                    category.key, gameTuple.item1)))),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                  child:FaIcon(gameTuple.item2)
                                ),
                              ),
                            ),
                            Text(ApplicationLocalizations.of(context)!
                                .translate("${category.key}_${gameTuple.item1}"))
                          ],
                        ),
                        SizedBox(
                          width: 15,
                        ),
                      ],
                    ),
                  )
                  .toList(),
            ],
          ),
        ),
        SizedBox(
          height: 20,
        )
      ],
    );
  }
}
