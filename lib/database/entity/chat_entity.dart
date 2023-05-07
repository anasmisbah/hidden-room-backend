import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidden_room_backend/utils/objectid_convertor.dart';
import 'package:mongo_dart/mongo_dart.dart';

part 'chat_entity.g.dart';

@JsonSerializable(converters: [ObjectIdConvertor()])
class ChatEntity {
  ChatEntity({
    required this.id,
    required this.roomCode,
    required this.username,
    required this.text,
    required this.time,
  });
  @JsonKey(name: '_id')
  final ObjectId id;
  @JsonKey(name: 'roomCode')
  final String roomCode;
  @JsonKey(name: 'username')
  final String username;
  @JsonKey(name: 'text')
  final String text;
  @JsonKey(name: 'time')
  final DateTime time;

  factory ChatEntity.fromJson(Map<String, dynamic> json) =>
      _$ChatEntityFromJson(json);

  Map<String, dynamic> toJson() => _$ChatEntityToJson(this);
}