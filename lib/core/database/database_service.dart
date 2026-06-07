import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:template_flutter/core/database/user_table.dart';

class DatabaseService {
  static final DatabaseService instance = DatabaseService._internal();

  DatabaseService._internal();

  Database? _database;

  Future<Database> get database async {
    if (_database != null) return _database!;

    _database = await _initDatabase();
    return _database!;
  }

  Future<Database> _initDatabase() async {
    final path = join(await getDatabasesPath(), 'move_your_body.db');

    return openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE ${UserTable.tableName}(
            ${UserTable.id} INTEGER PRIMARY KEY AUTOINCREMENT,
            ${UserTable.username} TEXT,
            ${UserTable.height} REAL,
            ${UserTable.weight} REAL,
            ${UserTable.age} INTEGER,
            ${UserTable.goalTags} TEXT,
            ${UserTable.customGoal} TEXT,
            ${UserTable.healthIssueTags} TEXT,
            ${UserTable.customHealthIssue} TEXT,
            ${UserTable.difficulty} TEXT,
            ${UserTable.intensity} TEXT,
            ${UserTable.targetBodyRegion} TEXT,
            ${UserTable.equipments} TEXT,
            ${UserTable.isOnboarded} INTEGER NOT NULL
          )
        ''');
      },
    );
  }
}
