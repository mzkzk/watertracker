import 'package:flutter/material.dart';
import '../models/water_record.dart';
import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

class WaterService extends ChangeNotifier {
  int _dailyGoal = 2000; // Default goal in ml
  int _currentIntake = 0;
  Database? _db;

  int get dailyGoal => _dailyGoal;
  int get currentIntake => _currentIntake;

  Future<void> initDb() async {
    final dbPath = await getDatabasesPath();
    final path = join(dbPath, 'watertracker.db');
    _db = await openDatabase(
      path,
      version: 1,
      onCreate: (db, version) async {
        await db.execute('''
          CREATE TABLE water_records(
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            date TEXT,
            amount INTEGER,
            note TEXT
          )
        ''');
      },
    );
    await _updateCurrentIntake();
    notifyListeners();
  }

  Future<void> addWater(int amount, {String? note}) async {
    if (_db == null) await initDb();
    final now = DateTime.now();
    await _db!.insert('water_records', {
      'date': now.toIso8601String(),
      'amount': amount,
      'note': note,
    });
    await _updateCurrentIntake();
    notifyListeners();
  }

  Future<void> _updateCurrentIntake() async {
    if (_db == null) return;
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(Duration(days: 1));
    final result = await _db!.rawQuery(
      'SELECT SUM(amount) as total FROM water_records WHERE date >= ? AND date < ?',
      [today.toIso8601String(), tomorrow.toIso8601String()],
    );
    _currentIntake =
        result.first['total'] != null ? result.first['total'] as int : 0;
  }

  void setDailyGoal(int goal) {
    _dailyGoal = goal;
    notifyListeners();
  }

  Future<void> resetDailyIntake() async {
    _currentIntake = 0;
    notifyListeners();
  }

  Future<List<WaterRecord>> getTodayRecords() async {
    if (_db == null) await initDb();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(Duration(days: 1));
    final maps = await _db!.query(
      'water_records',
      where: 'date >= ? AND date < ?',
      whereArgs: [today.toIso8601String(), tomorrow.toIso8601String()],
    );
    return maps.map((map) => WaterRecord.fromMap(map)).toList();
  }

  Future<List<WaterRecord>> getAllRecords() async {
    if (_db == null) await initDb();
    final maps = await _db!.query('water_records');
    return maps.map((map) => WaterRecord.fromMap(map)).toList();
  }

  Future<void> resetTodayRecords() async {
    if (_db == null) await initDb();
    final now = DateTime.now();
    final today = DateTime(now.year, now.month, now.day);
    final tomorrow = today.add(Duration(days: 1));
    await _db!.delete(
      'water_records',
      where: 'date >= ? AND date < ?',
      whereArgs: [today.toIso8601String(), tomorrow.toIso8601String()],
    );
    await _updateCurrentIntake();
    notifyListeners();
  }
}
