// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'interest_group.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

InterestGroup _$InterestGroupFromJson(Map<String, dynamic> json) =>
    InterestGroup(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String,
      imageUrl: json['imageUrl'] as String,
      memberCount: (json['memberCount'] as num).toInt(),
      tags: (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      isJoined: json['isJoined'] as bool,
    );

Map<String, dynamic> _$InterestGroupToJson(InterestGroup instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'description': instance.description,
      'imageUrl': instance.imageUrl,
      'memberCount': instance.memberCount,
      'tags': instance.tags,
      'isJoined': instance.isJoined,
    };
