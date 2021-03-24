// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Episode.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Episode _$EpisodeFromJson(Map<String, dynamic> json) {
  return Episode(
    animeId: json['anime_id'] as int,
    createdAt: DateTime.parse(json['created_at'] as String),
    id: json['id'] as int,
    number: json['number'] as int,
    updatedAt: DateTime.parse(json['updated_at'] as String),
  )..source = json['source'] as String?;
}

Map<String, dynamic> _$EpisodeToJson(Episode instance) => <String, dynamic>{
      'anime_id': instance.animeId,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'number': instance.number,
      'source': instance.source,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
