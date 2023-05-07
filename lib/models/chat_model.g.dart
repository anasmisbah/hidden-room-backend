// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'chat_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_ChatModel _$$_ChatModelFromJson(Map<String, dynamic> json) => _$_ChatModel(
      id: json['_id'] as String,
      roomCode: json['roomCode'] as String,
      username: json['username'] as String,
      text: json['text'] as String,
      time: DateTime.parse(json['time'] as String),
    );

Map<String, dynamic> _$$_ChatModelToJson(_$_ChatModel instance) =>
    <String, dynamic>{
      '_id': instance.id,
      'roomCode': instance.roomCode,
      'username': instance.username,
      'text': instance.text,
      'time': instance.time.toIso8601String(),
    };
