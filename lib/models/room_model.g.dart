// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomModel _$$_RoomModelFromJson(Map<String, dynamic> json) => _$_RoomModel(
      id: json['_id'] as String,
      roomCode: json['roomCode'] as String,
      maxUsers: json['maxUsers'] as int,
      onlineUsers: json['onlineUsers'] as int,
    );

Map<String, dynamic> _$$_RoomModelToJson(_$_RoomModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'roomCode': instance.roomCode,
      'maxUsers': instance.maxUsers,
      'onlineUsers': instance.onlineUsers,
    };
