import 'package:flutter_test/flutter_test.dart';
import 'package:rapidinho/model/order.dart';
import 'package:rapidinho/database/database.dart';
import 'package:rapidinho/database/tables/placed_order_table.dart';

main(){
  group('Placed Order Database Tests', (){
    test('Create Placed Order test',() async {
      var database = await RapidinhoDatabase().initDB();
      var newOrder = PlacedOrder(id: 1);
      var orderTable = PlacedOrderTable.createTable(database);
      orderTable.addPlacedOrder(newOrder);
      expect('', '');
    });
  });
}