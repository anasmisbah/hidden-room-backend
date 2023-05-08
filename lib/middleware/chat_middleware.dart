import 'package:dart_frog/dart_frog.dart';
import 'package:hidden_room_backend/repository/chat_repository.dart';
import 'package:hidden_room_backend/repository/chat_repository_impl.dart';

Middleware chatMiddleware() {
  return provider<ChatRepository>((context) => ChatRepositoryImpl());
}
