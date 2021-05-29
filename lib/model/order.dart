import 'package:rapidinho/database/common.dart' as common;

class PlacedOrder {
  int id, restaurantId, customerId;
  DateTime orderTime, estimatedDeliveryTime, foodReadyAt, actualDeliveryTime;
  bool isFoodReady;
  String deliveryAddress, comment;
  double price, discount, finalPrice;

  PlacedOrder({
    this.id,
    this.restaurantId,
    this.customerId,
    this.orderTime,
    this.estimatedDeliveryTime,
    this.foodReadyAt,
    this.actualDeliveryTime,
    this.isFoodReady,
    this.deliveryAddress,
    this.comment,
    this.price,
    this.discount,
    this.finalPrice,
  });

  PlacedOrder copyWith(
      {int id,
      int restaurantId,
      int customerId,
      DateTime orderTime,
      DateTime estimatedDeliveryTime,
      DateTime foodReadyAt,
      DateTime actualDeliveryTime,
      DateTime isFoodReady,
      DateTime deliveryAddress,
      DateTime comment,
      DateTime price,
      DateTime discount,
      DateTime finalPrice}) {
    return PlacedOrder(
        id: id ?? this.id,
        restaurantId: restaurantId ?? this.restaurantId,
        customerId: customerId ?? this.customerId,
        orderTime: orderTime ?? this.orderTime,
        estimatedDeliveryTime:
            estimatedDeliveryTime ?? this.estimatedDeliveryTime,
        foodReadyAt: foodReadyAt ?? this.foodReadyAt,
        actualDeliveryTime: actualDeliveryTime ?? this.actualDeliveryTime,
        isFoodReady: isFoodReady ?? this.isFoodReady,
        deliveryAddress: deliveryAddress ?? this.deliveryAddress,
        comment: comment ?? this.comment,
        price: price ?? this.comment,
        discount: discount ?? this.discount,
        finalPrice: finalPrice ?? this.finalPrice);
  }

  Map toMap() => {
        common.id: id,
        common.restaurantId: restaurantId,
        common.customerId: customerId,
        common.orderTime: orderTime.millisecondsSinceEpoch,
        common.estimatedDeliveryTime:
            estimatedDeliveryTime.millisecondsSinceEpoch,
        common.foodReadyAt: foodReadyAt.millisecondsSinceEpoch,
        common.actualDeliveryTime: actualDeliveryTime.millisecondsSinceEpoch,
        common.deliveryAddress: deliveryAddress,
        common.comment: comment,
        common.price: price,
        common.discount: discount,
        common.finalPrice: finalPrice,
      };

  PlacedOrder.fromMap(Map map) {
    PlacedOrder(
      id: map[common.id],
      restaurantId: map[common.restaurantId],
      customerId: map[common.customerId],
      orderTime: map[common.orderTime],
      estimatedDeliveryTime: map[common.estimatedDeliveryTime],
      foodReadyAt: map[common.foodReadyAt],
      actualDeliveryTime: map[common.actualDeliveryTime],
      deliveryAddress: map[common.deliveryAddress],
      comment: map[common.comment],
      discount: map[common.discount],
      finalPrice: map[common.finalPrice],
    );
  }

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is PlacedOrder &&
          runtimeType == other.runtimeType &&
          id == other.id &&
          restaurantId == other.restaurantId &&
          customerId == other.customerId &&
          orderTime == other.orderTime &&
          estimatedDeliveryTime == other.estimatedDeliveryTime &&
          foodReadyAt == other.foodReadyAt &&
          actualDeliveryTime == other.actualDeliveryTime &&
          isFoodReady == other.isFoodReady &&
          deliveryAddress == other.deliveryAddress &&
          comment == other.comment &&
          price == other.price &&
          discount == other.discount &&
          finalPrice == other.finalPrice;

  @override
  int get hashCode =>
      id.hashCode ^
      restaurantId.hashCode ^
      customerId.hashCode ^
      orderTime.hashCode ^
      estimatedDeliveryTime.hashCode ^
      foodReadyAt.hashCode ^
      actualDeliveryTime.hashCode ^
      isFoodReady.hashCode ^
      deliveryAddress.hashCode ^
      comment.hashCode ^
      price.hashCode ^
      discount.hashCode ^
      finalPrice.hashCode;

  @override
  String toString() {
    return 'PlacedOrder{id: $id, restaurantId: $restaurantId, customerId: $customerId, orderTime: $orderTime, estimatedDeliveryTime: $estimatedDeliveryTime, foodReadyAt: $foodReadyAt, actualDeliveryTime: $actualDeliveryTime, isFoodReady: $isFoodReady, deliveryAddress: $deliveryAddress, comment: $comment, price: $price, discount: $discount, finalPrice: $finalPrice}';
  }
}
