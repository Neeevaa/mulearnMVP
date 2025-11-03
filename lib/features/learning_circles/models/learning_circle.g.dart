// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'learning_circle.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LearningCircle _$LearningCircleFromJson(Map<String, dynamic> json) =>
    LearningCircle(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      memberCount: (json['memberCount'] as num).toInt(),
      category: json['category'] as String,
      mentor: json['mentor'] as String,
      isJoined: json['isJoined'] as bool,
      nextMeeting: DateTime.parse(json['nextMeeting'] as String),
    );

Map<String, dynamic> _$LearningCircleToJson(LearningCircle instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'memberCount': instance.memberCount,
      'category': instance.category,
      'mentor': instance.mentor,
      'isJoined': instance.isJoined,
      'nextMeeting': instance.nextMeeting.toIso8601String(),
    };
