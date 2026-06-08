import 'package:path/path.dart';
import 'package:sqflite/sqflite.dart';
import 'package:template_flutter/core/database/schema/exercise_schema.dart';
import 'package:template_flutter/core/database/schema/user_schema.dart';

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
    print('DB PATH: $path');
    return openDatabase(
      path,
      version: 2,
      onCreate: (db, version) async {
        print('ON CREATE CALLED');
        await UserDatabaseService.createTable(db);
        await ExerciseDatabaseService.createTable(db);
        print('TABLES CREATED');
      },
      onUpgrade: (db, oldVersion, newVersion) async {
        print('ON UPGRADE CALLED');

        if (oldVersion < 2) {
          await ExerciseDatabaseService.createTable(db);
        }
      },
    );
  }
}
