
import 'package:flutter/foundation.dart';

class Delivery {
  final String name;
  final DateTime time;
  final String locationName;
  final int locationIndex;
  final DeliveryCategory category;
  final String vendor;
  final DeliveryCategoryDetails details;

  Delivery({
    @required this.name,
    @required this.time,
    @required this.locationName,
    @required this.locationIndex,
    @required this.category,
    @required this.vendor,
    @required this.details,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is Delivery &&
              runtimeType == other.runtimeType &&
              name == other.name &&
              time == other.time &&
              locationName == other.locationName &&
              locationIndex == other.locationIndex &&
              category == other.category &&
              vendor == other.vendor &&
              details == other.details;

  @override
  int get hashCode =>
      name.hashCode ^
      time.hashCode ^
      locationName.hashCode ^
      locationIndex.hashCode ^
      category.hashCode ^
      vendor.hashCode ^
      details.hashCode;

  @override
  String toString() {
    return 'Delivery{name: $name, time: $time, locationName: $locationName, locationIndex: $locationIndex, category: $category, vendor: $vendor, details: $details}';
  }
}

class DeliveryCategoryDetails {

  final String imageAsset;
  final String categoryName;

  DeliveryCategoryDetails(this.imageAsset, this.categoryName);

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
          other is DeliveryCategoryDetails &&
              runtimeType == other.runtimeType &&
              imageAsset == other.imageAsset &&
              categoryName == other.categoryName;

  @override
  int get hashCode =>
      imageAsset.hashCode ^
      categoryName.hashCode;

  @override
  String toString() {
    return 'DeliveryCategoryDetails{imageAsset: $imageAsset, categoryName: $categoryName}';
  }
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