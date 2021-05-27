import 'package:rapidinho/model/product.dart';

class CartItem {
  Product product;
  int totalItem;
  double totalPrice;

  CartItem({this.product, this.totalItem, this.totalPrice});
}

List<CartItem> addedItems = [];
