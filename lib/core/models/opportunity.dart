import 'package:json_annotation/json_annotation.dart';

part 'opportunity.g.dart';

@JsonSerializable()
class Opportunity {
  final String id;
  final String title;
  final String company;
  final String description;
  final String type; // job, internship, gig, etc.
  final List<String> skills;
  final String location;
  final String salary;
  final DateTime postedDate;
  final DateTime deadline;
  final String applicationLink;

  Opportunity({
    required this.id,
    required this.title,
    required this.company,
    required this.description,
    required this.type,
    required this.skills,
    required this.location,
    required this.salary,
    required this.postedDate,
    required this.deadline,
    required this.applicationLink,
  });

  factory Opportunity.fromJson(Map<String, dynamic> json) => _$OpportunityFromJson(json);
  Map<String, dynamic> toJson() => _$OpportunityToJson(this);
}