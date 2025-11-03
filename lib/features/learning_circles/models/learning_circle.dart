import 'package:json_annotation/json_annotation.dart';

part 'learning_circle.g.dart';

@JsonSerializable()
class LearningCircle {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int memberCount;
  final String category;
  final String mentor;
  final bool isJoined;
  final DateTime nextMeeting;

  LearningCircle({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.memberCount,
    required this.category,
    required this.mentor,
    required this.isJoined,
    required this.nextMeeting,
  });

  factory LearningCircle.fromJson(Map<String, dynamic> json) => _$LearningCircleFromJson(json);
  Map<String, dynamic> toJson() => _$LearningCircleToJson(this);
}