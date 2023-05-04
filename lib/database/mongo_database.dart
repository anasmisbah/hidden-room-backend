import 'dart:developer';

import 'package:mongo_dart/mongo_dart.dart';

class MongoDatabase {
  MongoDatabase({required this.mongoUrl});

  final String mongoUrl;
  Db? _db;

  Future<Db> get db async {
    _db ??= await _initDb();
    return _db!;
  }

  Future<Db> _initDb() async {
    log('Try Open Database');
    final db = Db(mongoUrl);
    await db.open();
    log('Success Opened Database');

    return db;
  }

  Future<void> close() async => _db != null ? await _db!.close() : null;
}
