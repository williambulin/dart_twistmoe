import 'dart:async';
import 'dart:convert';

import 'package:web_socket_channel/io.dart';

import 'Listener.dart';
import 'User.dart';
import 'Message.dart';

class Client {
  late IOWebSocketChannel _channel;
  late StreamSubscription _streamSubscription;

  List<User> users = [];
  List<Message> messages = [];
  List<Listener> listeners = [];

  Client() {
    _connect();
  }

  Future<void> _connect() async {
    _channel = IOWebSocketChannel.connect('wss://ws.twist.moe');

    _streamSubscription = _channel.stream.listen(
      (event) async => _receive(event),
      onDone: () async {
        print('Connection terminated');
        await dispose();
        await _connect();
      },
      onError: (e) async {
        print('Socket error: $e');
        await dispose();
        await _connect();
      },
    );
  }

  Future<void> _receive(String event) async {
    var data = jsonDecode(event);

    switch (data['type']) {
      case 'msg':
        var msg = Message.fromJson(data['content']);
        msg.timestamp = DateTime.tryParse(data['timestamp']);
        if (messages.any((message) => message.msg == msg.msg && message.timestamp == msg.timestamp && message.user.id == msg.user.id)) break;
        messages.add(msg);
        for (var listener in listeners) {
          // ignore: unawaited_futures
          listener.onMessage(msg);
        }
        break;
      default:
        break;
    }

    print(data);
  }

  Future<void> dispose() async {
    await _streamSubscription.cancel();
    await _channel.sink.close();
  }
}
