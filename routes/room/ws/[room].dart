import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:hidden_room_backend/models/message_model.dart';
import 'package:hidden_room_backend/repository/chat_repository.dart';
import 'package:hidden_room_backend/repository/room_repository.dart';

Map<String, List<WebSocketChannel>> roomChannels = {};

Future<Response> onRequest(RequestContext context, String room) async {
  final roomRepo = context.read<RoomRepository>();
  final roomCheck = await roomRepo.checkRoom(roomCode: room);

  final params = context.request.uri.queryParameters;

  final chatRepo = context.read<ChatRepository>();

  final handler = webSocketHandler((channel, protocol) async {
    if (roomCheck == null) {
      channel.sink.add(
        jsonEncode(
          const MessageModel(
            msgOwner: MsgOwner.server,
            msgType: MsgType.reject,
            message: 'Room not found',
          ).toJson(),
        ),
      );
      await channel.sink.close();
      return;
    }
    // A new client has connected to our server.
    print('${params['username']} connected to channel, room code $room');
    if (roomChannels.containsKey(room)) {
      roomChannels.update(
        room,
        (value) => value..add(channel),
      );
    } else {
      roomChannels.putIfAbsent(room, () => [channel]);
    }
    if (roomChannels.length > roomCheck.maxUsers) {
      channel.sink.add(
        jsonEncode(
          const MessageModel(
            msgOwner: MsgOwner.server,
            msgType: MsgType.reject,
            message: 'the room is full',
          ).toJson(),
        ),
      );
      await channel.sink.close();
      return;
    }

    // Update new user comming
    await roomRepo.updateOnlineUsersRoom(
      roomCode: room,
      newCountOnlineUser: roomChannels[room]?.length ?? 0,
    );

    // send all previous message
    final previousChat = await chatRepo.getAllChatRoom(roomCode: room);
    final meesageChats = previousChat
        .map(
          (chat) => MessageModel(
            msgOwner: '${params['username']}' == chat.username
                ? MsgOwner.self
                : MsgOwner.other,
            msgType: MsgType.message,
            chat: chat,
          ),
        )
        .toList();
    channel.sink.add(jsonEncode(meesageChats));

    // Send a message to the client.
    roomChannels[room]?.forEach((roomChannel) {
      roomChannel.sink.add(
        jsonEncode(
          MessageModel(
            msgOwner: MsgOwner.server,
            msgType: MsgType.joined,
            message: '${params['username']} joined',
          ).toJson(),
        ),
      );
    });

    // Listen for messages from the client.
    channel.stream.listen(
      (event) async {
        final channelsConnect = roomChannels[room];
        final chat = jsonDecode(event as String) as Map<String, dynamic>;

        final storedChat = await chatRepo.createChat(
          roomCode: '${chat['roomCode']}',
          text: '${chat['text']}',
          username: '${chat['username']}',
          time: '${chat['time']}',
        );

        channelsConnect?.forEach((channelCon) {
          channelCon.sink.add(
            jsonEncode(
              MessageModel(
                msgOwner: channelCon == channel
                    ? MsgOwner.self
                    : MsgOwner.other,
                msgType: MsgType.message,
                chat: storedChat,
              ).toJson(),
            ),
          );
        });
      },
      // The client has disconnected.
      onDone: () async {
        roomChannels.update(room, (value) => value..remove(channel));
        await roomRepo.updateOnlineUsersRoom(
          roomCode: room,
          newCountOnlineUser: roomChannels[room]?.length ?? 0,
        );
        roomChannels[room]?.forEach((channel) {
          channel.sink.add(
            jsonEncode(
              MessageModel(
                msgOwner: MsgOwner.server,
                msgType: MsgType.disconnect,
                message: '${params['username']} Left',
              ).toJson(),
            ),
          );
        });
      },
      onError: (_) async {
        roomChannels.update(room, (value) => value..remove(channel));
        await roomRepo.updateOnlineUsersRoom(
          roomCode: room,
          newCountOnlineUser: roomChannels[room]?.length ?? 0,
        );
        roomChannels[room]?.forEach((channel) {
          channel.sink.add(
            jsonEncode(
              MessageModel(
                msgOwner: MsgOwner.server,
                msgType: MsgType.disconnect,
                message: '${params['username']} Left',
              ).toJson(),
            ),
          );
        });
      },
      cancelOnError: true,
    );
  });
  return handler(context);
}
