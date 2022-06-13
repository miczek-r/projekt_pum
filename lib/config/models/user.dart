import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:projekt_pum/config/models/category.dart';
import 'package:projekt_pum/config/models/category.dart';

class UserResult {
  List<Category> categories;
  String? referenceId;
  UserResult({this.referenceId, required this.categories});
  factory UserResult.fromSnapshot(DocumentSnapshot snapshot) {
    final newCategory =
        UserResult.fromJson(snapshot.data() as Map<String, dynamic>);
    newCategory.referenceId = snapshot.reference.id;
    return newCategory;
  }
  // 6
  factory UserResult.fromJson(Map<String, dynamic> json) =>
      _categoryFromJson(json);
  // 7
  Map<String, dynamic> toJson() => _categoryToJson(this);
}

// 1
UserResult _categoryFromJson(Map<String, dynamic> json) {
  return UserResult(
      categories: _convertCategorys(json['categories'] as List<dynamic>));
}

// 2
List<Category> _convertCategorys(List<dynamic> categoryMap) {
  final categories = <Category>[];

  for (final category in categoryMap) {
    categories.add(Category.fromJson(category as Map<String, dynamic>));
  }
  return categories;
}

// 3
Map<String, dynamic> _categoryToJson(UserResult instance) => <String, dynamic>{
      'categories': _categoryList(instance.categories),
    };
// 4
List<Map<String, dynamic>>? _categoryList(List<Category>? categories) {
  if (categories == null) {
    return null;
  }
  final categoryMap = <Map<String, dynamic>>[];
  categories.forEach((category) {
    categoryMap.add(category.toJson());
  });
  return categoryMap;
}
