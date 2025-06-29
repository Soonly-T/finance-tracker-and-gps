import 'package:sqflite/sqflite.dart';
import 'package:path/path.dart';

import 'MoneyFlowOperations.dart' show MoneyFlowOperations;

class DatabaseHelper {
  static final DatabaseHelper instance = DatabaseHelper._instance();
  static Database? _database;

  DatabaseHelper._instance();

  Future<Database> get db async {
    _database ??= await initDb();
    return _database!;
  }

  Future<Database> initDb() async {
    String databasePath = await getDatabasesPath();
    String path = join(databasePath, "./intell1slt-database.sqlite3");
    return await openDatabase(path, version: 1);
  }

  Future<int> insertTransaction(MoneyFlowOperations transaction) async {
    Database db = await instance.db;
    return await db.insert("MoneyFlow", transaction.toMap());
  }

  Future<int> updateTransaction(MoneyFlowOperations transaction) async {
    Database db = await instance.db;
    if (transaction.id == null) {
      throw Exception(
        "Cannot update a transaction without an ID. The ID must be populated from a retrieved record.",
      );
    }
    return await db.update(
      "MoneyFlow",
      transaction.toMap(),
      where: "ID = ?",
      whereArgs: [transaction.id],
      conflictAlgorithm: ConflictAlgorithm.replace,
    );
  } //find a way to add ID

  Future<int> deleteTransaction(MoneyFlowOperations transaction) async {
    Database db = await instance.db;
    if (transaction.id == null) {
      throw Exception(
        "Cannot update a transaction without an ID. The ID must be populated from a retrieved record.",
      );
    }
    return await db.delete(
      "MoneyFlow",
      where: "ID = ?",
      whereArgs: [transaction.id],
    );
  } //find a way to add ID

  Future<List<Map<String, dynamic>>> retrieveTransactions() async {
    Database db = await instance.db;
    return await db.query('MoneyFlow');
  }

  Future<List<Map<String, dynamic>>> retrieveTransaction(
    MoneyFlowOperations transaction,
  ) async {
    Database db = await instance.db;
    if (transaction.id == null) {
      throw Exception(
        "Cannot update a transaction without an ID. The ID must be populated from a retrieved record.",
      );
    }
    return await db.query(
      'MoneyFlow',
      where: "ID = ?",
      whereArgs: [transaction.id],
    );
  }

  Future<List<Map<String, dynamic>>> retrieveCoordinates() async {
    Database db = await instance.db;
    return await db.query("Coordinates");
  }
}
