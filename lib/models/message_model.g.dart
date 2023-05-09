// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'message_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_MessageModel _$$_MessageModelFromJson(Map<String, dynamic> json) =>
    _$_MessageModel(
      msgOwner: $enumDecode(_$MsgOwnerEnumMap, json['msgOwner']),
      msgType: $enumDecode(_$MsgTypeEnumMap, json['msgType']),
      chat: json['chat'] == null
          ? null
          : ChatModel.fromJson(json['chat'] as Map<String, dynamic>),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$$_MessageModelToJson(_$_MessageModel instance) =>
    <String, dynamic>{
      'msgOwner': _$MsgOwnerEnumMap[instance.msgOwner]!,
      'msgType': _$MsgTypeEnumMap[instance.msgType]!,
      'chat': instance.chat,
      'message': instance.message,
    };

const _$MsgOwnerEnumMap = {
  MsgOwner.self: 'self',
  MsgOwner.other: 'other',
  MsgOwner.server: 'server',
  MsgOwner.client: 'client',
};

const _$MsgTypeEnumMap = {
  MsgType.joined: 'joined',
  MsgType.message: 'message',
  MsgType.disconnect: 'disconnect',
  MsgType.reject: 'reject',
};
