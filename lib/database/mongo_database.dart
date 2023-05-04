import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  MongoDatabase._private();

  static MongoDatabase instance = MongoDatabase._private();

  Db? _db;

  Future<Db> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Db> _initDb() async {
    print('Try Open Database');
    final db = Db('mongodb://localhost:27017/hidden_room');
    await db.open();
    print('Success Opened Database');

    return db;
  }

  Future<void> close() async => _db != null ? await _db!.close() : null;
}
