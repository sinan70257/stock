import 'dart:developer';

import 'package:sqflite/sqflite.dart';

late Database _db;
Future<void> initDatabase() async {
  _db = await openDatabase(
    "stocks.db",
    version: 1,
    onCreate: (db, version) async {
      await db.execute(
          "CREATE TABLE stock(symbol TEXT PRIMARY KEY,name TEXT,matchscore TEXT )");
    },
  );
}

Future<List<Map<String, dynamic>>> getStocksData() async {
  final values = await _db.rawQuery("SELECT * FROM stock");
  log(values.toString());
  return values;
}

Future<void> addStocksData(
    String symbol, String name, String matchscore) async {
  _db.rawInsert("INSERT INTO stock(symbol,name,matchscore) VALUES(?,?,?)",
      [symbol, name, matchscore]);
}

Future<void> deleteStocksData(String symbol) async {
  _db.rawInsert(
    "DELETE FROM stock WHERE symbol = ?",
    [symbol],
  );
}
