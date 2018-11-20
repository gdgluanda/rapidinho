class Restaurant {
  int id;
  String address;
  int cityId;
}

class City {
  int id;
  String cityName;
  String zipCode;
}

class Customer {
  String customerName;
  int cityId;
  String address;
  String contactPhone;
  String email;
  String confirmationCode;
  String password;
  DateTime timeJoined;
}

class Category {
  int id;
  String categoryName;
}

class MenuItem {
  int id;
  String itemName;
  double price;
  int categoryId;
  String description;
  Map<int, String> ingredients;
  bool isActive;
}

class Offer {
  int id;
  DateTime dateActiveFrom;
  DateTime dateActiveTo;
  DateTime timeActiveFrom;
  DateTime timeActiveTo;
  double offerPrice;
}

class InOffer {
  int id;
  int offerId;
  int menuItemId;
}

///ORDERS

class PlacedOrder {
  int id;
  int restaurant;
  DateTime orderTime;
  DateTime estimatedDeliveryTime;
  DateTime foodReadyAt;
  bool isFoodReady;
  DateTime actualDeliveryTime;
  String deliveryAddress;
  int customerId;
  double price;
  double discount;
  double finalPrice;
  String comment;
  DateTime timeStamp;
}

class InOrder {
  int id;
  int placedOrderId;
  int offerId;
  int menuItemId;
  int quantity;
  double itemPrice;
  double price;
  String comment;
}

class OrderStatus {
  int id;
  int placedOrderId;
  int statusCatalogId;
  DateTime timeStamp;
}

class StatusCatalog {
  int id;
  String statusName;
}

class Comment {
  int id;
  int placedOrderId;
  int customerId;
  String commentText;
  DateTime timeStamp;
  bool isComplaint;
  bool isPraise;
}
