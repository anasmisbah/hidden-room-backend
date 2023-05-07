import 'package:freezed_annotation/freezed_annotation.dart';

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
}
