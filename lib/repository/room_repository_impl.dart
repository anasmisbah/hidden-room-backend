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
    String roomId = generateRandomString(5);

    Db db = await database.db;

    final result = await db.collection('rooms').insertOne({
      'roomCode': roomId,
      'maxUsers': maxUser,
      'onlineUsers': 0,
    });

    return RoomModel.fromEntity(RoomEntity.fromJson(result.document!));
  }

  String generateRandomString(int len) {
    final random = Random();
    final result = String.fromCharCodes(
        List.generate(len, (index) => 65 + random.nextInt(26)));
    return result.toUpperCase();
  }
}
