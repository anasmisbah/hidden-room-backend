import 'package:hidden_room_backend/utils/objectid_convertor.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'room_entity.g.dart';

@JsonSerializable(converters: [ObjectIdConvertor()])
class RoomEntity {
  RoomEntity({
    required this.id,
    required this.roomCode,
    required this.maxUsers,
    required this.onlineUsers,
  });
  @JsonKey(name: '_id')
  final ObjectId id;
  @JsonKey(name: 'roomCode')
  final String roomCode;
  @JsonKey(name: 'maxUsers')
  final int maxUsers;
  @JsonKey(name: 'onlineUsers')
  final int onlineUsers;

  factory RoomEntity.fromJson(Map<String, dynamic> json) =>
      _$RoomEntityFromJson(json);

  Map<String, dynamic> toJson() => _$RoomEntityToJson(this);
}
