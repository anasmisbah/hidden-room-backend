// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'room_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_RoomModel _$$_RoomModelFromJson(Map<String, dynamic> json) => _$_RoomModel(
      id: json['id'] as String,
      roomCode: json['roomCode'] as String,
      maxAttendes: json['maxAttendes'] as int,
      count: json['count'] as int,
    );

Map<String, dynamic> _$$_RoomModelToJson(_$_RoomModel instance) =>
    <String, dynamic>{
      'id': instance.id,
      'roomCode': instance.roomCode,
      'maxAttendes': instance.maxAttendes,
      'count': instance.count,
    };
