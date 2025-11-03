// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_profile.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UserProfile _$UserProfileFromJson(Map<String, dynamic> json) => UserProfile(
      id: json['id'] as String,
      name: json['name'] as String,
      email: json['email'] as String,
      avatar: json['avatar'] as String?,
      bio: json['bio'] as String?,
      location: json['location'] as String?,
      interests:
          (json['interests'] as List<dynamic>).map((e) => e as String).toList(),
      skills: Map<String, int>.from(json['skills'] as Map),
      achievements: (json['achievements'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      karmaPoints: (json['karmaPoints'] as num).toInt(),
      rank: (json['rank'] as num).toInt(),
    );

Map<String, dynamic> _$UserProfileToJson(UserProfile instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'email': instance.email,
      'avatar': instance.avatar,
      'bio': instance.bio,
      'location': instance.location,
      'interests': instance.interests,
      'skills': instance.skills,
      'achievements': instance.achievements,
      'karmaPoints': instance.karmaPoints,
      'rank': instance.rank,
    };
