// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'Message.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Message _$MessageFromJson(Map<String, dynamic> json) {
  return Message(
    user: User.fromJson(json['user'] as Map<String, dynamic>),
    msg: json['msg'] as String,
  )..timestamp = json['timestamp'] == null
      ? null
      : DateTime.parse(json['timestamp'] as String);
}

Map<String, dynamic> _$MessageToJson(Message instance) => <String, dynamic>{
      'user': instance.user,
      'msg': instance.msg,
      'timestamp': instance.timestamp?.toIso8601String(),
    };
