import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
  final String id;
  final String name;
  final String email;
  final String? avatar;
  final int karma;
  final List<String> interests;
  final String? bio;

  User({
    required this.id,
    required this.name,
    required this.email,
    this.avatar,
    required this.karma,
    required this.interests,
    this.bio,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}