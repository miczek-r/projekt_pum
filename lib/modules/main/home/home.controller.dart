import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/config/models/category.dart';
import 'package:projekt_pum/config/models/game.dart';
import 'package:projekt_pum/config/models/user.dart';
import 'package:projekt_pum/modules/main/home/home.dart';
import 'package:projekt_pum/modules/main/home/home.view.dart';
import 'package:projekt_pum/utils/repositories/data_repository.dart';
import 'package:projekt_pum/utils/services/application_localization.service.dart';

import 'package:tuple/tuple.dart';

class HomePageController extends State<HomePage> {
  HomePageController();

  @override
  void initState() {
    super.initState();
    getData();
  }

  int selectedDataSetIndex = -1;

  User? currentUser = FirebaseAuth.instance.currentUser;
  final DataRepository repository = DataRepository();

  final categories = {
    0: "reaction",
    1: "concentration",
    2: "mathematics",
    3: "word",
    4: "memory"
  };

  Map<String, double> results = {
    "reaction": 1,
    "concentration": 1,
    "mathematics": 1,
    "word": 1,
    "memory": 1
  };

  String getTitle(int index) {
    return categories[index]!;
  }

  List<RadarDataSet> showingDataSets() {
    return rawDataSets().asMap().entries.map((entry) {
      var isNotVisible = entry.value.title == 'Hidden';
      var rawDataSet = entry.value;

      return RadarDataSet(
        fillColor: isNotVisible
            ? rawDataSet.color
            : rawDataSet.color.withOpacity(0.25),
        borderColor: isNotVisible
            ? rawDataSet.color
            : rawDataSet.color.withOpacity(0.75),
        entryRadius: 3,
        dataEntries:
            rawDataSet.values.map((e) => RadarEntry(value: e)).toList(),
        borderWidth: 2,
      );
    }).toList();
  }

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Fashion',
        color: Color(0xff241f48),
        values: results.entries.map((key) => key.value).toList(),
      ),
      RawDataSet(
        title: 'Hidden',
        color: Colors.transparent,
        values: [1100.0, 0, 0, 0, 0],
      ),
    ];
  }

  getData() async {
    var dataSnapshot = await repository.getData(currentUser!.uid);
    if (dataSnapshot == null) return;
    UserResult result = UserResult.fromSnapshot(dataSnapshot);
    if (result != null) {
      result.categories.forEach((category) {
        double sum = 1.0;
        category.games.forEach((element) {
          if (element.results.length > 0) {
            element.results.sort((a, b) => b.date.compareTo(a.date));
            sum += element.results.first.score;
          }
        });
        sum = sum / category.games.length;
        results[category.name] = sum;
      });
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) => HomePageView(this);
}

class RawDataSet {
  final String title;
  final Color color;
  final List<double> values;

  RawDataSet({
    required this.title,
    required this.color,
    required this.values,
  });
}
