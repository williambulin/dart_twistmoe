import 'package:json_annotation/json_annotation.dart';

part 'User.g.dart';

@JsonSerializable()
class User {
  int id;
  String username;
  int rank;

  @JsonKey(name: 'donation_rank')
  int donationRank;

  User({
    required this.id,
    required this.username,
    required this.rank,
    required this.donationRank,
  });

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}
