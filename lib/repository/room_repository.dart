import 'package:hidden_room_backend/models/room_model.dart';

abstract class RoomRepository {
  Future<RoomModel> createRoom({required int maxUser});

  Future<RoomModel?> checkRoom({required String roomCode});

  Future<void> updateOnlineUsersRoom({
    required String roomCode,
    required int newCountOnlineUser,
  });
}
