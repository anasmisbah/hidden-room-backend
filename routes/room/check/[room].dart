import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:hidden_room_backend/repository/room_repository.dart';

Future<Response> onRequest(RequestContext context, String room) async {
  final response = await context.read<RoomRepository>().checkRoom(
        roomCode: room.toUpperCase(),
      );
  if (response == null) {
    return Response.json(
      body: {
        'status': false,
        'Message': 'room not found',
        'data': null,
      },
      statusCode: HttpStatus.badRequest,
    );
  }

  return Response.json(
    body: {
      'status': true,
      'Message': 'success',
      'data': response,
    },
  );
}
