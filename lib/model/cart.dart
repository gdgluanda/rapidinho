import 'package:rapidinho/model/cart_item.dart';
import 'package:rapidinho/model/profile.dart';

class Cart {
  int id;
  List<CartItem> products;
  DateTime purchasedDate;
  Profile profile;
  double totalAmount;

  Cart(
      {this.id,
      this.products,
      this.purchasedDate,
      this.profile,
      this.totalAmount});
}

Cart cart = new Cart();
