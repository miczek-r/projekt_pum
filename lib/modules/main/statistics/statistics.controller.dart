import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.view.dart';
import 'package:tuple/tuple.dart';

class StatisticsPageController extends State<StatisticsPage> {
  StatisticsPageController();

  final Map<String, Set<Tuple2<String, IconData>>> games = {
    "reaction": {
      const Tuple2("view", FontAwesomeIcons.arrowsToEye),
      const Tuple2("sound", FontAwesomeIcons.drum),
      const Tuple2("vibration", FontAwesomeIcons.towerCell)
    },
    "memory": {
      const Tuple2("card_match", FontAwesomeIcons.codeCompare),
      const Tuple2("numbers", FontAwesomeIcons.seven)
    },
    "word": {const Tuple2("char_shuffle", FontAwesomeIcons.millSign)},
    "concentration": {
      const Tuple2("color_match", FontAwesomeIcons.pallet),
      const Tuple2("aim_lab", FontAwesomeIcons.arrowsToCircle)
    },
    "math": {
      const Tuple2("equations", FontAwesomeIcons.plusMinus),
      const Tuple2("which_is_more", FontAwesomeIcons.arrowTrendUp)
    }
  };

  @override
  Widget build(BuildContext context) => StatisticsPageView(this);
}
