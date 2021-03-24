// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Slug.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Slug _$SlugFromJson(Map<String, dynamic> json) {
  return Slug(
    animeId: json['anime_id'] as int,
    createdAt: DateTime.parse(json['created_at'] as String),
    id: json['id'] as int,
    slug: json['slug'] as String,
    updatedAt: DateTime.parse(json['updated_at'] as String),
  );
}

Map<String, dynamic> _$SlugToJson(Slug instance) => <String, dynamic>{
      'anime_id': instance.animeId,
      'created_at': instance.createdAt.toIso8601String(),
      'id': instance.id,
      'slug': instance.slug,
      'updated_at': instance.updatedAt.toIso8601String(),
    };
