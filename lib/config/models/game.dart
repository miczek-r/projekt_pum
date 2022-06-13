import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt_pum/config/models/result.dart';

class Game {
  String name;
  // 2
  List<Result> results;
  // 3
  String? referenceId;
  // 4
  Game(this.name, {this.referenceId, required this.results});
  // 5
  factory Game.fromSnapshot(DocumentSnapshot snapshot) {
    final newGame =
        Game.fromJson(snapshot.data() as Map<String, dynamic>);
    newGame.referenceId = snapshot.reference.id;
    return newGame;
  }
  // 6
  factory Game.fromJson(Map<String, dynamic> json) =>
      _gameFromJson(json);
  // 7
  Map<String, dynamic> toJson() => _gameToJson(this);

  @override
  String toString() => 'Game<$name>';
}

// 1
Game _gameFromJson(Map<String, dynamic> json) {
  return Game(json['name'] as String,
      results: _convertResults(json['results'] as List<dynamic>));
}

// 2
List<Result> _convertResults(List<dynamic> resultMap) {
  final results = <Result>[];

  for (final result in resultMap) {
    results.add(Result.fromJson(result as Map<String, dynamic>));
  }
  return results;
}

// 3
Map<String, dynamic> _gameToJson(Game instance) => <String, dynamic>{
      'name': instance.name,
      'results': _resultList(instance.results),
    };
// 4
List<Map<String, dynamic>>? _resultList(List<Result>? results) {
  if (results == null) {
    return null;
  }
  final resultMap = <Map<String, dynamic>>[];
  results.forEach((result) {
    resultMap.add(result.toJson());
  });
  return resultMap;
}
