// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Anime.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Anime _$AnimeFromJson(Map<String, dynamic> json) {
  return Anime(
    createdAt: DateTime.parse(json['created_at'] as String),
    hidden: json['hidden'] as int,
    id: json['id'] as int,
    ongoing: json['ongoing'] as int,
    season: json['season'] as int,
    slug: Slug.fromJson(json['slug'] as Map<String, dynamic>),
    title: json['title'] as String,
    updatedAt: DateTime.parse(json['updated_at'] as String),
  )
    ..alternativeTitle = json['alt_title'] as String?
    ..description = json['description'] as String?
    ..episodes = (json['episodes'] as List<dynamic>?)
        ?.map((e) => Episode.fromJson(e as Map<String, dynamic>))
        .toList()
    ..hbId = json['hb_id'] as int?
    ..malId = json['mal_id'] as int?;
}

Map<String, dynamic> _$AnimeToJson(Anime instance) => <String, dynamic>{
      'alt_title': instance.alternativeTitle,
      'created_at': instance.createdAt.toIso8601String(),
      'description': instance.description,
      'episodes': instance.episodes,
      'hb_id': instance.hbId,
      'hidden': instance.hidden,
      'id': instance.id,
      'mal_id': instance.malId,
      'ongoing': instance.ongoing,
      'season': instance.season,
      'slug': instance.slug,
      'title': instance.title,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
