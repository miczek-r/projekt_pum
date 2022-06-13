import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/statistics/statistics-details/statistics-details.controller.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.controller.dart';
import 'package:tuple/tuple.dart';

class StatisticsDetailsPage extends StatefulWidget {
  final Tuple2<String, String> gameName;

  const StatisticsDetailsPage({super.key, required this.gameName});

  @override
  StatisticsDetailsPageController createState() =>
      StatisticsDetailsPageController(gameName);
}
