import 'package:dart_frog/dart_frog.dart';
import 'package:hidden_room_backend/repository/room_repository.dart';
import 'package:hidden_room_backend/repository/room_repository_impl.dart';

Middleware roomMiddleware() {
  return provider<RoomRepository>((context) => RoomRepositoryImpl());
}
