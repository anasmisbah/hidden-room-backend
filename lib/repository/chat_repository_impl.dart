import 'package:hidden_room_backend/database/entity/chat_entity.dart';
import 'package:hidden_room_backend/database/mongo_database.dart';
import 'package:hidden_room_backend/models/chat_model.dart';
import 'package:hidden_room_backend/repository/chat_repository.dart';
import 'package:mongo_dart/mongo_dart.dart';

class ChatRepositoryImpl extends ChatRepository {
  final MongoDatabase _database = MongoDatabase.instance;
  @override
  Future<ChatModel> createChat({
    required String roomCode,
    required String text,
    required String username,
    required String time,
  }) async {
    final db = await _database.db;
    final result = await db.collection('chats').insertOne({
      'roomCode': roomCode,
      'text': text,
      'username': username,
      'time': time,
    });
    print(result.document!['time'].runtimeType);
    return ChatModel.fromEntity(ChatEntity.fromJson(result.document!));
  }

  @override
  Future<List<ChatModel>> getAllChatRoom({required String roomCode}) async {
    final db = await _database.db;
    final result = await db
        .collection('chats')
        .find(where.eq('roomCode', roomCode))
        .toList();
    final chats = result
        .map(
          (chat) => ChatModel.fromEntity(
            ChatEntity.fromJson(chat),
          ),
        )
        .toList();

    return chats;
  }
}
