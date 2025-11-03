import 'package:json_annotation/json_annotation.dart';

part 'interest_group.g.dart';

@JsonSerializable()
class InterestGroup {
  final String id;
  final String name;
  final String description;
  final String imageUrl;
  final int memberCount;
  final List<String> tags;
  final bool isJoined;

  InterestGroup({
    required this.id,
    required this.name,
    required this.description,
    required this.imageUrl,
    required this.memberCount,
    required this.tags,
    required this.isJoined,
  });

  factory InterestGroup.fromJson(Map<String, dynamic> json) => _$InterestGroupFromJson(json);
  Map<String, dynamic> toJson() => _$InterestGroupToJson(this);
}