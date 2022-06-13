import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.view.dart';

class StatisticsPageController extends State<StatisticsPage> {
  StatisticsPageController();

  final Map<String, Set<String>> games = {
    "reaction": {"view", "sound", "aim_lab", "vibration"},
    "memory": {"card_match"},
    "word": {"char_shuffle"},
    "concentration": {},
    "mathematics": {}
  };

  @override
  Widget build(BuildContext context) => StatisticsPageView(this);
}
