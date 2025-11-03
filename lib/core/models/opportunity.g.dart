// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'opportunity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Opportunity _$OpportunityFromJson(Map<String, dynamic> json) => Opportunity(
      id: json['id'] as String,
      title: json['title'] as String,
      company: json['company'] as String,
      description: json['description'] as String,
      type: json['type'] as String,
      skills:
          (json['skills'] as List<dynamic>).map((e) => e as String).toList(),
      location: json['location'] as String,
      salary: json['salary'] as String,
      postedDate: DateTime.parse(json['postedDate'] as String),
      deadline: DateTime.parse(json['deadline'] as String),
      applicationLink: json['applicationLink'] as String,
    );

Map<String, dynamic> _$OpportunityToJson(Opportunity instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'company': instance.company,
      'description': instance.description,
      'type': instance.type,
      'skills': instance.skills,
      'location': instance.location,
      'salary': instance.salary,
      'postedDate': instance.postedDate.toIso8601String(),
      'deadline': instance.deadline.toIso8601String(),
      'applicationLink': instance.applicationLink,
    };
