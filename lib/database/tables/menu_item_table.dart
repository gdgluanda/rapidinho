import 'package:rapidinho/database/common.dart';
import 'package:rapidinho/model/product.dart';
import 'package:sqflite/sqflite.dart';

class MenuItemTable {
  MenuItemTable(Database db) {
    _createTable(db);
  }

  _createTable(Database database) {
    database.execute("CREATE TABLE $Product ("
        "$id INTEGER PRIMARY KEY,"
        "$categoryId INTEGER,"
        "$itemName TEXT,"
        "$description TEXT,"
        "$ingredients TEXT,"
        "$recipe TEXT,"
        "$price REAL,"
        "$active INTEGER"
        ")");
  }
}
