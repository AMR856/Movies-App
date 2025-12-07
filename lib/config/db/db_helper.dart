import 'package:injectable/injectable.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';
import 'dart:io';

@injectable
class DatabaseHelper {
  static final DatabaseHelper _instance = DatabaseHelper._internal();
  static final String historyTable = 'history';
  static final String dbName = 'app.db';
  factory DatabaseHelper() => _instance;
  DatabaseHelper._internal();
  static Database? _database;
  Future<Database> get database async {
    if (_database != null) return _database!;
    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    Directory documentsDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentsDirectory.path, dbName);

    return await openDatabase(
      path,
      version: 1,
      onCreate: _onCreate,
    );
  }
  Future _onCreate(Database db, int version) async {
    await db.execute('''
      CREATE TABLE history (
        id INTEGER PRIMARY KEY,
        rating DOUBLE NOT NULL,
        imageUrl TEXT
      )
    ''');
  }
  Future<int> insertHistory(Map<String, dynamic> row) async {
    Database db = await database;
    return await db.insert(historyTable, row);
  }
  Future<List<Map<String, dynamic>>> getHistory() async {
    Database db = await database;
    return await db.query(historyTable);
  }
  Future<int> deleteHistory(int id) async {
    Database db = await database;
    return await db.delete(historyTable, where: 'id = ?', whereArgs: [id]);
  }
}
