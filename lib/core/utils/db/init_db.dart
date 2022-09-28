import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart' as path;

class LocalDBUtils {
  static Future<Database> init({required bool devMode}) async {
    var databasesPath = await getDatabasesPath();
    String dbPath = path.join(databasesPath, 'data.db');

    Database database = await openDatabase(dbPath, version: 1,
        onCreate: (Database db, int version) async {
      await db.execute(
        '''CREATE TABLE Posts(
            id INTEGER PRIMARY KEY, 
            post_id INTEGER, 
            user_id INTEGER, 
            jsonField TEXT,
            UNIQUE(post_id)
          )''',
      );
    });

    return database;
  }
}
