
import 'package:flutter/foundation.dart';

class Delivery {
  final String name;
  final DateTime time;
  final String locationName;
  final int locationIndex;
  final DeliveryCategory category;
  final String vendor;

  Delivery({
    @required this.name,
    @required this.time,
    @required this.locationName,
    @required this.locationIndex,
    @required this.category,
    @required this.vendor
  });
}

class DeliveryCategoryDetails {

  final String imageAsset;
  final String categoryName;

  DeliveryCategoryDetails(this.imageAsset, this.categoryName);
}

enum DeliveryCategory {
  Book,
  Drinks,
  Food,
  Hamburger,
  IceCream,
  Invites,
  Mail,
  Pizza,
  Present,
  Wear,
}