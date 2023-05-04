import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:hidden_room_backend/database/entity/room_entity.dart';

part 'room_model.freezed.dart';
part 'room_model.g.dart';

@freezed
class RoomModel with _$RoomModel {
  const factory RoomModel({
    @JsonKey(name: '_id') required String id,
    @JsonKey(name: 'roomCode') required String roomCode,
    @JsonKey(name: 'maxUsers') required int maxUsers,
    @JsonKey(name: 'onlineUsers') required int onlineUsers,
  }) = _RoomModel;

  factory RoomModel.fromJson(Map<String, dynamic> json) =>
      _$RoomModelFromJson(json);

  factory RoomModel.fromEntity(RoomEntity roomEntity) => RoomModel(
        id: roomEntity.id.$oid,
        roomCode: roomEntity.roomCode,
        maxUsers: roomEntity.maxUsers,
        onlineUsers: roomEntity.onlineUsers,
      );

}
