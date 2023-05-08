import 'package:hidden_room_backend/models/chat_model.dart';

abstract class ChatRepository {
  Future<ChatModel> createChat(
      {required String roomCode,
      required String text,
      required String username,
      required String time});

  Future<List<ChatModel>> getAllChatRoom({required String roomCode});
}
