// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RoomEntity _$RoomEntityFromJson(Map<String, dynamic> json) => RoomEntity(
      id: const ObjectIdConvertor().fromJson(json['_id'] as ObjectId),
      roomCode: json['roomCode'] as String,
      maxUsers: json['maxUsers'] as int,
      onlineUsers: json['onlineUsers'] as int,
    );

Map<String, dynamic> _$RoomEntityToJson(RoomEntity instance) =>
    <String, dynamic>{
      '_id': const ObjectIdConvertor().toJson(instance.id),
      'roomCode': instance.roomCode,
      'maxUsers': instance.maxUsers,
      'onlineUsers': instance.onlineUsers,
    };
