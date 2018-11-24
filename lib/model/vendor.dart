class Vendor {
  int id;
  String name;
  String address;
  int cityId;

  Vendor({this.id, this.name, this.address, this.cityId});
}

class City {
  int id;
  String cityName;

  City({this.id, this.cityName});
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

///ORDER

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
