import 'package:rapidinho/database/common.dart';
import 'package:rapidinho/model/menu_item.dart';
import 'package:sqflite/sqflite.dart';

class MenuItemTable {

  MenuItemTable(Database db){
    _createTable(db);
  }

  _createTable(Database database) {
    database.execute(
        "CREATE TABLE $MenuItem ("
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