// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'karma_points.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

KarmaPoints _$KarmaPointsFromJson(Map<String, dynamic> json) => KarmaPoints(
      total: (json['total'] as num).toInt(),
      recentActivities: (json['recentActivities'] as List<dynamic>)
          .map((e) => KarmaActivity.fromJson(e as Map<String, dynamic>))
          .toList(),
      breakdown: Map<String, int>.from(json['breakdown'] as Map),
    );

Map<String, dynamic> _$KarmaPointsToJson(KarmaPoints instance) =>
    <String, dynamic>{
      'total': instance.total,
      'recentActivities': instance.recentActivities,
      'breakdown': instance.breakdown,
    };

KarmaActivity _$KarmaActivityFromJson(Map<String, dynamic> json) =>
    KarmaActivity(
      id: json['id'] as String,
      title: json['title'] as String,
      description: json['description'] as String,
      points: (json['points'] as num).toInt(),
      timestamp: DateTime.parse(json['timestamp'] as String),
      category: json['category'] as String,
    );

Map<String, dynamic> _$KarmaActivityToJson(KarmaActivity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'points': instance.points,
      'timestamp': instance.timestamp.toIso8601String(),
      'category': instance.category,
    };
