import 'dart:convert';

import 'package:dart_frog/dart_frog.dart';
import 'package:dart_frog_web_socket/dart_frog_web_socket.dart';
import 'package:hidden_room_backend/repository/room_repository.dart';

Map<String, List<WebSocketChannel>> roomChannels = {};

Future<Response> onRequest(RequestContext context, String room) async {
  final roomRepo = context.read<RoomRepository>();
  final roomCheck = roomRepo.checkRoom(roomCode: room);

  final params = context.request.uri.queryParameters;

  final handler = webSocketHandler((channel, protocol) {
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
    // Send a message to the client.
    roomChannels[room]?.forEach((roomChannel) {
      roomChannel.sink.add(jsonEncode({
        'type': 'joined_room',
        'message': '${params['username']} joined the room $room'
      }));
    });

    // Listen for messages from the client.
    channel.stream.listen(
      (event) {
        final channelsConnect = roomChannels[room];
        final chat = jsonDecode(event as String);
        print(chat);

        channelsConnect?.forEach((channel) {
          channel.sink.add(
            jsonEncode({
              'type': 'message',
              'message': chat,
            }),
          );
        });
      },
      // The client has disconnected.
      onDone: () {
        roomChannels.update(room, (value) => value..remove(channel));
      },
      onError: (_) {
        roomChannels.update(room, (value) => value..remove(channel));
      },
      cancelOnError: true,
    );
  });
  return handler(context);
}
