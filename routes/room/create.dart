import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context)async {
  if (context.request.method != HttpMethod.post) {
    return Response(
        body: jsonEncode({'status': false, 'message': 'Method Not Allowed'}),
        statusCode: HttpStatus.methodNotAllowed);
  }
  var body = await context.request.json();

  return Response.json(body: {
    'status':true,
    'Message':'success',
    'data':body,
  });
}
