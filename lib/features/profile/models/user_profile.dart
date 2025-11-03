import 'package:json_annotation/json_annotation.dart';

part 'user_profile.g.dart';

@JsonSerializable()
class UserProfile {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final String? bio;
  final String? location;
  final List<String> interests;
  final Map<String, int> skills;
  final List<String> achievements;
  final int karmaPoints;
  final int rank;

  UserProfile({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    this.bio,
    this.location,
    required this.interests,
    required this.skills,
    required this.achievements,
    required this.karmaPoints,
    required this.rank,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) => _$UserProfileFromJson(json);
  Map<String, dynamic> toJson() => _$UserProfileToJson(this);
}