import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:hidden_room_backend/repository/chat_repository.dart';
import 'package:hidden_room_backend/repository/room_repository.dart';

Map<String, List<WebSocketChannel>> roomChannels = {};

Future<Response> onRequest(RequestContext context, String room) async {
  final roomRepo = context.read<RoomRepository>();
  final roomCheck = roomRepo.checkRoom(roomCode: room);

  final params = context.request.uri.queryParameters;

  final chatRepo = context.read<ChatRepository>();

  final handler = webSocketHandler((channel, protocol) async {
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

    // Update new user comming
    await roomRepo.updateOnlineUsersRoom(
      roomCode: room,
      newCountOnlineUser: roomChannels[room]?.length ?? 0,
    );

    // send all previous message
    channel.sink.add(jsonEncode(await chatRepo.getAllChatRoom(roomCode: room)));

    // Send a message to the client.
    roomChannels[room]?.forEach((roomChannel) {
      roomChannel.sink.add(jsonEncode({
        'type': 'joined_room',
        'message': '${params['username']} joined the room $room'
      }));
    });

    // Listen for messages from the client.
    channel.stream.listen(
      (event) async {
        final channelsConnect = roomChannels[room];
        final chat = jsonDecode(event as String) as Map<String, dynamic>;
        print(chat);

        final storedChat = await chatRepo.createChat(
          roomCode: '${chat['roomCode']}',
          text: '${chat['text']}',
          username: '${chat['username']}',
          time: '${chat['time']}',
        );

        channelsConnect?.forEach((channel) {
          channel.sink.add(
            jsonEncode({
              'type': 'message',
              'message': storedChat,
            }),
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
      },
      onError: (_) async {
        roomChannels.update(room, (value) => value..remove(channel));
        await roomRepo.updateOnlineUsersRoom(
          roomCode: room,
          newCountOnlineUser: roomChannels[room]?.length ?? 0,
        );
      },
      cancelOnError: true,
    );
  });
  return handler(context);
}
