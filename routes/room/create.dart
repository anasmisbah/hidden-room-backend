import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:hidden_room_backend/repository/room_repository.dart';

Future<Response> onRequest(RequestContext context) async {
  if (context.request.method != HttpMethod.post) {
    return Response.json(
        body: {'status': false, 'message': 'Method Not Allowed'},
        statusCode: HttpStatus.methodNotAllowed);
  }
  var body = await context.request.json();

  final response = await context.read<RoomRepository>().createRoom(
        maxUser: body['maxUsers'] as int,
      );

  return Response.json(body: {
    'status': true,
    'Message': 'success',
    'data': response.toJson(),
  });
}
