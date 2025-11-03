import 'package:json_annotation/json_annotation.dart';

part 'karma_points.g.dart';

@JsonSerializable()
class KarmaPoints {
  final int total;
  final List<KarmaActivity> recentActivities;
  final Map<String, int> breakdown;

  KarmaPoints({
    required this.total,
    required this.recentActivities,
    required this.breakdown,
  });

  factory KarmaPoints.fromJson(Map<String, dynamic> json) => _$KarmaPointsFromJson(json);
  Map<String, dynamic> toJson() => _$KarmaPointsToJson(this);
}

@JsonSerializable()
class KarmaActivity {
  final String id;
  final String title;
  final String description;
  final int points;
  final DateTime timestamp;
  final String category;

  KarmaActivity({
    required this.id,
    required this.title,
    required this.description,
    required this.points,
    required this.timestamp,
    required this.category,
  });

  factory KarmaActivity.fromJson(Map<String, dynamic> json) => _$KarmaActivityFromJson(json);
  Map<String, dynamic> toJson() => _$KarmaActivityToJson(this);
}