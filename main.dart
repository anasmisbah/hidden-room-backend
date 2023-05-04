import 'dart:io';

import 'package:dart_frog/dart_frog.dart';
import 'package:dotenv/dotenv.dart';
import 'package:hidden_room_backend/database/mongo_database.dart';


final _mongoDatabase =
    MongoDatabase(mongoUrl: 'mongodb://localhost:27017/hidden_room');
Future<HttpServer> run(Handler handler, InternetAddress ip, int port) async {
  // 1. Execute any custom code prior to starting the server...
  await _mongoDatabase.db;
  // 2. Use the provided `handler`, `ip`, and `port` to create a custom
  // `HttpServer`.
  // Or use the Dart Frog serve method to do that for you.
  return serve(handler, ip, port);
}
