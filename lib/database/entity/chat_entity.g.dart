// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ChatEntity _$ChatEntityFromJson(Map<String, dynamic> json) => ChatEntity(
      id: const ObjectIdConvertor().fromJson(json['_id'] as ObjectId),
      roomCode: json['roomCode'] as String,
      username: json['username'] as String,
      text: json['text'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$ChatEntityToJson(ChatEntity instance) =>
    <String, dynamic>{
      '_id': const ObjectIdConvertor().toJson(instance.id),
      'roomCode': instance.roomCode,
      'username': instance.username,
      'text': instance.text,
      'time': instance.time.toIso8601String(),
    };
