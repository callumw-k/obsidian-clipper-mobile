

import 'package:injectable/injectable.dart';
import 'package:logging/logging.dart';
import 'package:obsidian_clipper/models/link.dart';
import 'package:sqflite/sqflite.dart';

@singleton
class DatabaseContext {
  Database database;
  DatabaseContext(this.database);

  @FactoryMethod(preResolve: true)
  static Future<DatabaseContext> create() async {
    var logger = Logger('DatabaseContextFactoryMethod');
    var databasePath = await getDatabasesPath();
    String path = '$databasePath/demo.db';
    logger.fine('The database path is $path');
    Database database = await openDatabase(path, version: 1,
        onCreate: (Database db, int version) async {
          await db.execute(
              'CREATE TABLE IF NOT EXISTS $linkTable (id INTEGER PRIMARY KEY, title TEXT, original_url string, image string)');
        });
    final dbContext = DatabaseContext(database);
    return dbContext;
  }
}