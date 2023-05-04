import 'package:hidden_room_backend/models/room_model.dart';

void main() {
  RoomModel roomModel =
      const RoomModel(id: 'aa', roomCode: 'NKPL', maxUsers: 4, onlineUsers: 4);

  RoomModel roomModel2 = roomModel.copyWith(roomCode: '232323');
  print(roomModel);
  print(roomModel2);

  print(roomModel.toJson());

  RoomModel roomModelFromJson = RoomModel.fromJson({
    'id': 'qweqwe',
    'roomCode': 'KLOK',
    'maxAttendes': 4,
    'count': 9,
  });

  print(roomModelFromJson);
}
