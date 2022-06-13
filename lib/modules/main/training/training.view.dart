import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/training/training.controller.dart';
import 'package:projekt_pum/modules/main/training/training.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';
import 'package:projekt_pum/utils/ui/glass_container/glass_container.dart';
import 'package:widget_view/widget_view.dart';

class TrainingPageView
    extends StatefulWidgetView<TrainingPage, TrainingPageController> {
  const TrainingPageView(TrainingPageController controller, {Key? key})
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
                  'Training'.toUpperCase(),
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
                                    .map((entry) => TrainingRow(entry))
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

class TrainingRow extends StatelessWidget {
  final MapEntry<String, Set<String>> category;

  const TrainingRow(this.category, {Key? key}) : super(key: key);

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
                    (gameName) => Row(
                      children: [
                        Column(
                          children: [
                            Material(
                              clipBehavior: Clip.none,
                              borderRadius: BorderRadius.circular(50),
                              elevation: 10,
                              child: InkWell(
                                onTap: () => Navigator.of(context).pushNamed(
                                    "/games/${category.key}/$gameName"),
                                child: CircleAvatar(
                                  backgroundColor: Colors.white,
                                  radius: 50,
                                ),
                              ),
                            ),
                            Text(ApplicationLocalizations.of(context)!
                                .translate("${category.key}_$gameName"))
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
