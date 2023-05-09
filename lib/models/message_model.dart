import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidden_room_backend/models/chat_model.dart';

part 'message_model.g.dart';
part 'message_model.freezed.dart';

@freezed
class MessageModel with _$MessageModel {
  const factory MessageModel({
    required MsgOwner msgOwner,
    required MsgType msgType,
    ChatModel? chat,
    String? message,
  }) = _MessageModel;

  factory MessageModel.fromJson(Map<String, dynamic> json) =>
      _$MessageModelFromJson(json);
}

enum MsgOwner { self, other, server, client }

enum MsgType { joined, message, disconnect, reject }
