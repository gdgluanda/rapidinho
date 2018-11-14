import 'package:meta/meta.dart';
import 'package:rapidinho/model/loading_status.dart';
import 'package:rapidinho/model/order.dart';

@immutable
class OrderState {
  final List<PlacedOrder> orders;
  final LoadingStatus loadingStatus;
  OrderState({this.orders, this.loadingStatus});

  factory OrderState.initial(){
    return OrderState(
      orders: [],
      loadingStatus: LoadingStatus.loading,
    );
  }

  OrderState copyWith({List<PlacedOrder> orders, LoadingStatus loadingStatus}) {
    return OrderState(
      orders: orders ?? this.orders,
      loadingStatus: loadingStatus ?? this.loadingStatus,
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is OrderState &&
              runtimeType == other.runtimeType &&
              orders == other.orders &&
              loadingStatus == other.loadingStatus;

  @override
  int get hashCode =>
      orders.hashCode ^
      loadingStatus.hashCode;

  @override
  String toString() {
    return 'OrderState{orders: $orders, loadingStatus: $loadingStatus}';
  }
}