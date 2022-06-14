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
    2: "math",
    3: "word",
    4: "memory"
  };

  Map<String, double> results = {
    "reaction": 1,
    "concentration": 1,
    "math": 1,
    "word": 1,
    "memory": 1
  };

  final Map<String, double> gameScoreMultiplier={
    "reaction_view": 150,
    "reaction_sound": 250,
    "reaction_vibration": 200,

    "concentration_aim_lab": 1000/150,
    "concentration_color_match": 1000/100,

    "math_equations": 1000/60,
    "math_which_is_more": 1000/60,

    "word_char_shuffle": 1000/20,

    "memory_card_match": 100,
    "memory_numbers": 1000/15
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

  updateUser(){
    currentUser = FirebaseAuth.instance.currentUser;
    setState(() {
      
    });
  }

  //781573995

  List<RawDataSet> rawDataSets() {
    return [
      RawDataSet(
        title: 'Results',
        color: Colors.red,
        values: results.entries.map((key) => key.value).toList(),
      ),
      RawDataSet(
        title: 'Hidden',
        color: Colors.transparent,
        values: [1100.0, 1.0, 1.0, 1.0, 1.0],
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
            double gameResult=1;
            if(category.name=="reaction"){
              gameResult = 1000/element.results.first.score * gameScoreMultiplier["${category.name}_${element.name}"]!;
            }else{
              gameResult = element.results.first.score * gameScoreMultiplier["${category.name}_${element.name}"]!;
            }
            sum += gameResult>1000?1000:gameResult;
          }
        });
        sum = sum / category.games.length;
        results[category.name] = sum;
      });
      if(mounted){

      setState(() {});
      }
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
