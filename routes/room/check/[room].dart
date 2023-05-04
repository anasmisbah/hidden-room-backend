import 'dart:convert';
import 'dart:io';

import 'package:dart_frog/dart_frog.dart';

Future<Response> onRequest(RequestContext context,String room)async {
    
  return Response.json(body: {
    'status':true,
    'Message':'success',
    'data':room,
  });
}