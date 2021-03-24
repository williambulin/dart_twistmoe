import 'package:json_annotation/json_annotation.dart';

import 'Episode.dart';
import 'Slug.dart';

part 'Anime.g.dart';

@JsonSerializable()
class Anime {
  @JsonKey(name: 'alt_title')
  String? alternativeTitle;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  String? description;
  List<Episode>? episodes;

  @JsonKey(name: 'hb_id')
  int? hbId;

  int hidden;
  int id;

  @JsonKey(name: 'mal_id')
  int? malId;

  int ongoing;
  int season;
  Slug slug;
  String title;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  Anime({
    required this.createdAt,
    required this.hidden,
    required this.id,
    required this.ongoing,
    required this.season,
    required this.slug,
    required this.title,
    required this.updatedAt,
  });

  factory Anime.fromJson(Map<String, dynamic> json) => _$AnimeFromJson(json);
  Map<String, dynamic> toJson() => _$AnimeToJson(this);
}
