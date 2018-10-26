
import 'package:flutter/foundation.dart';
import 'package:rapidinho/model/product.dart';

class Delivery {
  final String name;
  final DateTime time;
  final String locationName;
  final int locationIndex;
  final ProductCategory category;
  final String vendor;
  final Product details;

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