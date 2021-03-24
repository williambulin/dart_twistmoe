import 'Message.dart';
import 'User.dart';

abstract class Listener {
  Future<void> onMessage(Message message);
  Future<void> onUserJoin(User user);
  Future<void> onUserPart(User user);
}
