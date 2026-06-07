import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:sqflite/sqflite.dart';

import '../database/database_service.dart';
import '../database/exercise_table.dart';
import '../model/exercise_data.dart';

class SeedService {
  Future<void> seedExercises() async {
    final db = await DatabaseService.instance.database;

    final existingExercises = await db.rawQuery(
      'SELECT COUNT(*) as count FROM ${ExerciseTable.tableName}',
    );

    final count = existingExercises.first['count'] as int;

    if (count > 0) {
      print('Exercises already seeded. Skipping seeding.');
      return;
    }

    print('Loading exercise json...');

    final jsonString = await rootBundle.loadString(
      'assets/exercises/exercises.json',
    );

    final List<dynamic> decodedJson = jsonDecode(jsonString);

    final exercises = decodedJson
        .map((json) => Exercise.fromJson(json as Map<String, dynamic>))
        .toList();

    final Batch batch = db.batch();

    for (final exercise in exercises) {
      batch.insert(
        ExerciseTable.tableName,
        exercise.toMap(),
        conflictAlgorithm: ConflictAlgorithm.ignore,
      );
    }

    await batch.commit(noResult: true);

    print('${exercises.length} exercises seeded successfully.');
  }

  Future<void> printExerciseCount() async {
    final db = await DatabaseService.instance.database;

    final result = await db.rawQuery(
      'SELECT COUNT(*) as count FROM ${ExerciseTable.tableName}',
    );

    print('Total exercises: ${result.first['count']}');
  }
}
