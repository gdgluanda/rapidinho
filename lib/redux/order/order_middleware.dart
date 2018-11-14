import 'package:rapidinho/database/tables/placed_order_table.dart';
import 'package:rapidinho/model/order.dart';
import 'package:rapidinho/redux/app_state.dart';
import 'package:rapidinho/redux/order/order_actions.dart';
import 'package:redux/redux.dart';

class OrderMiddleware extends MiddlewareClass<AppState> {
  @override
  void call(Store<AppState> store, action, NextDispatcher next) {
    next(action);
    if(action is LoadOrders){
      _loadCachedOrders(store);
    }
  }

  void _loadCachedOrders(Store<AppState> store){
    var orderTable = PlacedOrderTable();
    orderTable.addPlacedOrder(PlacedOrder(price: 200.0), database: store.state.database);
  }
}