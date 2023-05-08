import 'package:dart_frog/dart_frog.dart';
import 'package:hidden_room_backend/middleware/chat_middleware.dart';
import 'package:hidden_room_backend/middleware/room_middleware.dart';

Handler middleware(Handler handler) {
  return handler
      .use(
        roomMiddleware(),
      )
      .use(
        chatMiddleware(),
      )
      .use(
        requestLogger(),
      );
}
