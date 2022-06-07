import 'package:flutter/material.dart';
import 'package:projekt_pum/modules/main/training/training.dart';
import 'package:projekt_pum/modules/main/training/training.view.dart';

class TrainingPageController extends State<TrainingPage> {
  TrainingPageController();

  final Map<String, Set<String>> games = {
    "reaction": {"view", "sound"},
    "memory": {},
    "word": {"char_shuffle"},
    "concentration": {},
    "mathematics": {}
  };

  @override
  Widget build(BuildContext context) => TrainingPageView(this);
}
