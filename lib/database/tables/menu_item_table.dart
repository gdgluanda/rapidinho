import 'package:rapidinho/database/common.dart';
import 'package:rapidinho/model/product.dart';
import 'package:sqflite/sqflite.dart';

class MenuItemTable {

  MenuItemTable(Database db){
    _createTable(db);
  }

  _createTable(Database database) {
    database.execute(
        "CREATE TABLE $Product ("
            "$ID INTEGER PRIMARY KEY,"
            "$CATEGORY_ID INTEGER,"
            "$ITEM_NAME TEXT,"
            "$DESCRIPTION TEXT,"
            "$INGREDIENTS TEXT,"
            "$RECIPE TEXT,"
            "$PRICE REAL,"
            "$ACTIVE INTEGER"
            ")"
    );
  }
}