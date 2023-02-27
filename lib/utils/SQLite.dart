// ignore_for_file: non_constant_identifier_names

import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io' as io;
import 'package:path_provider/path_provider.dart';

class DatabaseHelper {
  static final DatabaseHelper _instance = new DatabaseHelper.internal();
  factory DatabaseHelper() => _instance;

  static Database? _db;

  Future<Database> get db async {
    if (_db != null) {
      return _db!;
    }
    _db = await initDb();
    return _db!;
  }

  String TABLE = "MY_TABLE_NAME";

  DatabaseHelper.internal();

  initDb() async {
    io.Directory documnentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documnentDirectory.path, "main.db");
    var database = await openDatabase(path, version: 1, onCreate: _onCreate);
    return database;
  }

  void _onCreate(Database db, int version) async {
    await db.execute("CREATE TABLE " +
        TABLE +
        "(id INTEGER PRIMARY KEY, firstname TEXT, lastname TEXT, avatar TEXT, role TEXT);");
    print(" Table is created");
  }

  //fetch
  Future<List<Map<String, dynamic>>> getDataToList() async {
    var dbClient = await db;

    var result = await dbClient.query(TABLE);
    return result;
  }

  //insertion
  Future<int> saveItemToDB(Map<String, Object?> object) async {
    var dbClient = await db;
    int result = await dbClient.insert(TABLE, object);
    return result;
  }

  //Deletion.
  Future<int> deleteItemFromDB(String table, int id) async {
    var dbClient = await db;
    int result = await dbClient.delete(table, where: "id = ?", whereArgs: [id]);
    return result;
  }
}
