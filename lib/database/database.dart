import 'dart:io';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';
import 'package:rapidinho/database/tables/placed_order_table.dart';
import 'package:sqflite/sqflite.dart';

class RapidinhoDatabase {
  static final RapidinhoDatabase _instance = RapidinhoDatabase._internal();
  static Database db;
  factory RapidinhoDatabase() => _instance;

  Future<Database> get database async {
    if(db != null){
      return db;
    }
    db = await initDB();
    return db;
  }

  RapidinhoDatabase._internal();

  Future<Database> initDB() async {
    Directory documentDirectory = await getApplicationDocumentsDirectory();
    String path = join(documentDirectory.path, "rapidinho.db");
    var thDB = await openDatabase(path, version: 1, onCreate: _onCreate);
    return thDB;
  }
  _onCreate(Database db, int version) async {
    PlacedOrderTable.createTable(db);
  }
}