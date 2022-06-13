import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:projekt_pum/config/models/category.dart';
import 'package:projekt_pum/config/models/game.dart';
import 'package:projekt_pum/config/models/result.dart';
import 'package:projekt_pum/config/models/user.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.dart';
import 'package:projekt_pum/modules/games/shared/results/game.results.view.dart';
import 'package:projekt_pum/utils/repositories/data_repository.dart';
import 'package:collection/collection.dart';

class GameResultsPageController extends State<GameResultsPage> {
  final GameResult result;
  final VoidCallback restartFunction;
  GameResultsPageController(this.result, this.restartFunction);

  User? currentUser = FirebaseAuth.instance.currentUser;
  final DataRepository repository = DataRepository();

  @override
  void initState() {
    super.initState();
    saveResult();
  }

  void saveResult() async {
    var dataSnapshot = await repository.getData(currentUser!.uid);
    if (dataSnapshot == null) return;
    UserResult userResult = UserResult.fromSnapshot(dataSnapshot);
    Category? category = userResult.categories
        .firstWhereOrNull((element) => element.name == result.category);
    if (category == null) {
      category = new Category(result.category, games: []);
    }
    if (category.games
            .firstWhereOrNull((element) => element.name == result.gameName) ==
        null) {
      category.games.add(new Game(result.gameName, results: []));
    }
    category.games
        .firstWhere((element) => element.name == result.gameName)
        .results
        .add(new Result(result.score, date: DateTime.now()));
    repository.updateUser(userResult);
  }

  @override
  Widget build(BuildContext context) => GameResultsPageView(this);
}
