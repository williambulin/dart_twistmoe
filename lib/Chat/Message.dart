import 'package:json_annotation/json_annotation.dart';

import 'User.dart';

part 'Message.g.dart';

@JsonSerializable()
class Message {
  User user;
  String msg;
  DateTime? timestamp;

  Message({
    required this.user,
    required this.msg,
  });

  factory Message.fromJson(Map<String, dynamic> json) => _$MessageFromJson(json);
  Map<String, dynamic> toJson() => _$MessageToJson(this);
}
