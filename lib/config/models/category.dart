import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt_pum/config/models/game.dart';

class Category {
  String name;
  // 2
  List<Game> games;
  // 3
  String? referenceId;
  // 4
  Category(this.name, {this.referenceId, required this.games});
  // 5
  factory Category.fromSnapshot(DocumentSnapshot snapshot) {
    final newCategory =
        Category.fromJson(snapshot.data() as Map<String, dynamic>);
    newCategory.referenceId = snapshot.reference.id;
    return newCategory;
  }
  // 6
  factory Category.fromJson(Map<String, dynamic> json) =>
      _categoryFromJson(json);
  // 7
  Map<String, dynamic> toJson() => _categoryToJson(this);

  @override
  String toString() => 'Category<$name>';
}

// 1
Category _categoryFromJson(Map<String, dynamic> json) {
  return Category(json['name'] as String,
      games: _convertGames(json['games'] as List<dynamic>));
}

// 2
List<Game> _convertGames(List<dynamic> gameMap) {
  final games = <Game>[];

  for (final game in gameMap) {
    games.add(Game.fromJson(game as Map<String, dynamic>));
  }
  return games;
}

// 3
Map<String, dynamic> _categoryToJson(Category instance) => <String, dynamic>{
      'name': instance.name,
      'games': _gameList(instance.games),
    };
// 4
List<Map<String, dynamic>>? _gameList(List<Game>? games) {
  if (games == null) {
    return null;
  }
  final gameMap = <Map<String, dynamic>>[];
  games.forEach((game) {
    gameMap.add(game.toJson());
  });
  return gameMap;
}
