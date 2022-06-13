import 'package:cloud_firestore/cloud_firestore.dart';

class Result {
  final double score;
  final DateTime date;

  Result(this.score, {required this.date});
  // 3
  factory Result.fromJson(Map<String, dynamic> json) =>
      _vaccinationFromJson(json);
  // 4
  Map<String, dynamic> toJson() => _vaccinationToJson(this);

  @override
  String toString() => 'Result<$score>';
}

// 1
Result _vaccinationFromJson(Map<String, dynamic> json) {
  return Result(
    json['score'] as double,
    date: (json['date'] as Timestamp).toDate(),
  );
}

// 2
Map<String, dynamic> _vaccinationToJson(Result instance) => <String, dynamic>{
      'score': instance.score,
      'date': instance.date,
    };
