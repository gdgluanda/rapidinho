import 'package:rapidinho/database/common.dart';
import 'package:rapidinho/model/order.dart';
import 'package:sqflite/sqflite.dart';

class PlacedOrderTable {

  final Database database;


  PlacedOrderTable({this.database});

  PlacedOrderTable.createTable(this.database){
    _createTable(database);
  }

  _createTable(Database database) async {
    await database.execute(
        "CREATE TABLE $PlacedOrder ("
            "$ID INTEGER PRIMARY KEY,"
            "$RESTAURANT_ID INTEGER,"
            "$CUSTOMER_ID INTEGER,"
            "$ORDER_TIME INTEGER,"
            "$ESTIMATED_DELIVERY_TIME INTEGER,"
            "$FOOD_READY_AT INTEGER,"
            "$ACTUAL_DELIVERY_TIME INTEGER,"
            "$DELIVERY_ADDRESS TEXT,"
            "$PRICE REAL,"
            "$DISCOUNT REAL,"
            "$FINAL_PRICE REAL,"
            "$COMMENT TEXT"
            ")"
    );
    print('Created $PlacedOrder table');
  }

  addPlacedOrder(PlacedOrder order, {Database database}) async {
    try {
      int orderId = await database.insert('$PlacedOrder', order.toMap());
      order.copyWith(id: orderId);
    } catch(e){
      print(e);
    }
  }

  Future<List<PlacedOrder>> getPlacedOrders({Database database}) async {
    try {
      var databaseClient = await database.query("$PlacedOrder");
      return databaseClient.map((order) => PlacedOrder.fromMap(order));
    } catch(e){
      return [];
    }
  }

  Future<PlacedOrder> getSinglePlacedOrder(int id, {Database database}) async {
    try {
      var result = await database.query('$PlacedOrder', where: "id = ?", whereArgs: [id]);
      return PlacedOrder.fromMap(result[0]);
    } catch(e){
      return null;
    }
  }
}