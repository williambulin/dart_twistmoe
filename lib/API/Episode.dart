import 'package:json_annotation/json_annotation.dart';

part 'Episode.g.dart';

@JsonSerializable()
class Episode {
  @JsonKey(name: 'anime_id')
  int animeId;

  @JsonKey(name: 'created_at')
  DateTime createdAt;

  int id;
  int number;
  String? source;

  @JsonKey(name: 'updated_at')
  DateTime updatedAt;

  Episode({
    required this.animeId,
    required this.createdAt,
    required this.id,
    required this.number,
    required this.updatedAt,
  });

  factory Episode.fromJson(Map<String, dynamic> json) => _$EpisodeFromJson(json);
  Map<String, dynamic> toJson() => _$EpisodeToJson(this);
}
