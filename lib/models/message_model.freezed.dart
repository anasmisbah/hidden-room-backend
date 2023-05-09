// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'message_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

MessageModel _$MessageModelFromJson(Map<String, dynamic> json) {
  return _MessageModel.fromJson(json);
}

/// @nodoc
mixin _$MessageModel {
  MsgOwner get msgOwner => throw _privateConstructorUsedError;
  MsgType get msgType => throw _privateConstructorUsedError;
  ChatModel? get chat => throw _privateConstructorUsedError;
  String? get message => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MessageModelCopyWith<MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MessageModelCopyWith<$Res> {
  factory $MessageModelCopyWith(
          MessageModel value, $Res Function(MessageModel) then) =
      _$MessageModelCopyWithImpl<$Res, MessageModel>;
  @useResult
  $Res call(
      {MsgOwner msgOwner, MsgType msgType, ChatModel? chat, String? message});

  $ChatModelCopyWith<$Res>? get chat;
}

/// @nodoc
class _$MessageModelCopyWithImpl<$Res, $Val extends MessageModel>
    implements $MessageModelCopyWith<$Res> {
  _$MessageModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msgOwner = null,
    Object? msgType = null,
    Object? chat = freezed,
    Object? message = freezed,
  }) {
    return _then(_value.copyWith(
      msgOwner: null == msgOwner
          ? _value.msgOwner
          : msgOwner // ignore: cast_nullable_to_non_nullable
              as MsgOwner,
      msgType: null == msgType
          ? _value.msgType
          : msgType // ignore: cast_nullable_to_non_nullable
              as MsgType,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $ChatModelCopyWith<$Res>? get chat {
    if (_value.chat == null) {
      return null;
    }

    return $ChatModelCopyWith<$Res>(_value.chat!, (value) {
      return _then(_value.copyWith(chat: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$_MessageModelCopyWith<$Res>
    implements $MessageModelCopyWith<$Res> {
  factory _$$_MessageModelCopyWith(
          _$_MessageModel value, $Res Function(_$_MessageModel) then) =
      __$$_MessageModelCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {MsgOwner msgOwner, MsgType msgType, ChatModel? chat, String? message});

  @override
  $ChatModelCopyWith<$Res>? get chat;
}

/// @nodoc
class __$$_MessageModelCopyWithImpl<$Res>
    extends _$MessageModelCopyWithImpl<$Res, _$_MessageModel>
    implements _$$_MessageModelCopyWith<$Res> {
  __$$_MessageModelCopyWithImpl(
      _$_MessageModel _value, $Res Function(_$_MessageModel) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? msgOwner = null,
    Object? msgType = null,
    Object? chat = freezed,
    Object? message = freezed,
  }) {
    return _then(_$_MessageModel(
      msgOwner: null == msgOwner
          ? _value.msgOwner
          : msgOwner // ignore: cast_nullable_to_non_nullable
              as MsgOwner,
      msgType: null == msgType
          ? _value.msgType
          : msgType // ignore: cast_nullable_to_non_nullable
              as MsgType,
      chat: freezed == chat
          ? _value.chat
          : chat // ignore: cast_nullable_to_non_nullable
              as ChatModel?,
      message: freezed == message
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$_MessageModel implements _MessageModel {
  const _$_MessageModel(
      {required this.msgOwner, required this.msgType, this.chat, this.message});

  factory _$_MessageModel.fromJson(Map<String, dynamic> json) =>
      _$$_MessageModelFromJson(json);

  @override
  final MsgOwner msgOwner;
  @override
  final MsgType msgType;
  @override
  final ChatModel? chat;
  @override
  final String? message;

  @override
  String toString() {
    return 'MessageModel(msgOwner: $msgOwner, msgType: $msgType, chat: $chat, message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_MessageModel &&
            (identical(other.msgOwner, msgOwner) ||
                other.msgOwner == msgOwner) &&
            (identical(other.msgType, msgType) || other.msgType == msgType) &&
            (identical(other.chat, chat) || other.chat == chat) &&
            (identical(other.message, message) || other.message == message));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, msgOwner, msgType, chat, message);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_MessageModelCopyWith<_$_MessageModel> get copyWith =>
      __$$_MessageModelCopyWithImpl<_$_MessageModel>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$_MessageModelToJson(
      this,
    );
  }
}

abstract class _MessageModel implements MessageModel {
  const factory _MessageModel(
      {required final MsgOwner msgOwner,
      required final MsgType msgType,
      final ChatModel? chat,
      final String? message}) = _$_MessageModel;

  factory _MessageModel.fromJson(Map<String, dynamic> json) =
      _$_MessageModel.fromJson;

  @override
  MsgOwner get msgOwner;
  @override
  MsgType get msgType;
  @override
  ChatModel? get chat;
  @override
  String? get message;
  @override
  @JsonKey(ignore: true)
  _$$_MessageModelCopyWith<_$_MessageModel> get copyWith =>
      throw _privateConstructorUsedError;
}
