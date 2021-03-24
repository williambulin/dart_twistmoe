import 'package:json_annotation/json_annotation.dart';

part 'Slug.g.dart';

@JsonSerializable()
class Slug {
  @JsonKey(name: 'anime_id')
  int animeId;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  int id;

  String slug;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  Slug({
    required this.animeId,
    required this.createdAt,
    required this.id,
    required this.slug,
    required this.updatedAt,
  });

  factory Slug.fromJson(Map<String, dynamic> json) => _$SlugFromJson(json);
  Map<String, dynamic> toJson() => _$SlugToJson(this);
}
