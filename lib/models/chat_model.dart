import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidden_room_backend/database/entity/chat_entity.dart';

part 'chat_model.freezed.dart';
part 'chat_model.g.dart';

@freezed
class ChatModel with _$ChatModel {
  const factory ChatModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'roomCode') required String roomCode,
    @JsonKey(name: 'username') required String username,
    @JsonKey(name: 'text') required String text,
    @JsonKey(name: 'time') required DateTime time,
  }) = _ChatModel;

  factory ChatModel.fromJson(Map<String, dynamic> json) =>
      _$ChatModelFromJson(json);
  
  factory ChatModel.fromEntity(ChatEntity chatEntity) => ChatModel(
        id: chatEntity.id.$oid,
        roomCode: chatEntity.roomCode,
        username: chatEntity.username,
        text: chatEntity.text,
        time: chatEntity.time,
      );
}
