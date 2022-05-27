import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/home/home.dart';
import 'package:projekt_pum/modules/main/main.dart';
import 'package:projekt_pum/modules/main/main.view.dart';
import 'package:projekt_pum/modules/main/statistics/statistics.dart';
import 'package:projekt_pum/modules/main/training/training.dart';

class MainController extends State<Main> {
  MainController();

  int selectedIndex = 1;
  bool isReversing = false;
  final List<Widget> widgetOptions = <Widget>[
    TrainingPage(),
    HomePage(),
    StatisticsPage(),
  ];

  @override
  Widget build(BuildContext context) => MainView(this);
}
