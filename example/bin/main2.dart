import 'dart:convert';
import 'dart:io';

import 'package:dart_twistmoe/Twist.dart' as twist;
import 'package:dart_discord/Discord.dart' as discord;

class DiscordRelay extends twist.Listener {
  var webhook = discord.Webhook(utf8.decode(File('webhook.secret').readAsBytesSync()));

  @override
  Future<void> onMessage(twist.Message message) async {
    try {
      await webhook.send(
        discord.WebhookMessage(
          username: message.user.username,
          content: message.msg,
          avatarUrl: 'https://pbs.twimg.com/profile_images/1040274899854606338/f-VmanYZ_400x400.jpg',
        ),
      );
    } catch (e) {
      print('An error has occured: $e');
      print('Message was ${message.user.username} (${message.user.id}): ${message.msg}');
    }
  }

  @override
  Future<void> onUserJoin(twist.User user) async {}

  @override
  Future<void> onUserPart(twist.User user) async {}
}

void main() async {
  var client = twist.Client();
  client.listeners.add(DiscordRelay());
}
