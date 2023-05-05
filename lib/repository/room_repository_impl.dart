import 'dart:math';

import 'package:hidden_room_backend/database/entity/room_entity.dart';
import 'package:hidden_room_backend/database/mongo_database.dart';
import 'package:hidden_room_backend/models/room_model.dart';
import 'package:hidden_room_backend/repository/room_repository.dart';
import 'package:mongo_dart/mongo_dart.dart';

class RoomRepositoryImpl extends RoomRepository {
  final MongoDatabase database = MongoDatabase.instance;
  @override
  Future<RoomModel> createRoom({required int maxUser}) async {
    String roomId = await generateRandomString(5);

    Db db = await database.db;

    final result = await db.collection('rooms').insertOne({
      'roomCode': roomId,
      'maxUsers': maxUser,
      'onlineUsers': 0,
    });

    return RoomModel.fromEntity(RoomEntity.fromJson(result.document!));
  }

  Future<String> generateRandomString(int len) async {
    final random = Random();
    final result = String.fromCharCodes(
        List.generate(len, (index) => 65 + random.nextInt(26))).toUpperCase();
    if (await checkRoom(roomCode: result) != null) {
      await generateRandomString(len);
    }
    return result;
  }

  @override
  Future<RoomModel?> checkRoom({required String roomCode}) async {
    Db db = await database.db;
    final result =
        await db.collection('rooms').findOne(where.eq('roomCode', roomCode));
    if (result == null) return null;
    return RoomModel.fromEntity(RoomEntity.fromJson(result));
  }
}
