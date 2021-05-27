import 'package:flutter/material.dart';
import 'package:rapidinho/model/cart.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class ShoppingCartTab extends StatefulWidget {
  final Cart cart;
  ShoppingCartTab({this.cart});
  @override
  _ShoppingCartTabState createState() => _ShoppingCartTabState();
}

class _ShoppingCartTabState extends State<ShoppingCartTab> {
  double totalAmount = cart.totalAmount;
  @override
  Widget build(BuildContext context) {
    return widget.cart.products == null
        ? Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Image.asset('assets/images/empty_cart_state.png', height: 200.0),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child:
                    Text('Lista Vasia!', style: RapidinhoTextStyle.largeText),
              ),
              Text('Nada foi adicionado a lista de compras',
                  style: RapidinhoTextStyle.normalText),
            ],
          )
        : Column(
            children: [
              Container(
                color: Colors.red,
                height: 50.0,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          "Items",
                          style: TextStyle(color: Colors.white),
                        ),
                      ),
                    ),
                    Container(
                      alignment: Alignment.center,
                      width: 35.0,
                      child: Text(
                        "Qty",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                    Container(
                      alignment: Alignment.centerRight,
                      padding: EdgeInsets.only(right: 16.0),
                      width: 100.0,
                      child: Text(
                        "Amount",
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                itemCount: cart.products.length,
                itemBuilder: (BuildContext context, int index) =>
                    itemWidget(context, index),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.bottomCenter,
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border(
                        top: BorderSide(width: 1.0, color: Colors.black12),
                      ),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Expanded(
                          child: Container(
                            padding: EdgeInsets.only(left: 16.0),
                            alignment: Alignment.centerLeft,
                            height: 50.0,
                            child: Text("Total Amount"),
                          ),
                        ),
                        Container(
                          width: 100.0,
                          alignment: Alignment.center,
                          height: 50.0,
                          child: Text(totalAmount.toString()),
                        ),
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
  }

  Widget itemWidget(BuildContext context, int index) {
    return Dismissible(
      key: UniqueKey(),
      direction: DismissDirection.endToStart,
      background: Container(
        padding: EdgeInsets.only(right: 16.0),
        alignment: Alignment.centerRight,
        color: Colors.red,
        child: Text(
          "Remove",
          style: TextStyle(color: Colors.white),
        ),
      ),
      onDismissed: (_) {
        displayDialog(context, index);
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(width: .5, color: Colors.black12),
          ),
        ),
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 16.0),
                child: Text(cart.products[index].product.itemName),
              ),
            ),
            Container(
              alignment: Alignment.center,
              width: 35.0,
              child: Text(cart.products[index].totalItem.toString()),
            ),
            Container(
              alignment: Alignment.centerRight,
              padding: EdgeInsets.only(right: 16.0),
              width: 100.0,
              child: Text(cart.products[index].totalPrice.toString()),
            ),
          ],
        ),
      ),
    );
  }

  displayDialog(BuildContext context, int index) {
    showDialog<String>(
      context: context,
      builder: (BuildContext context) => AlertDialog(
        title: const Text('Remove'),
        content: const Text('Are you sure to remove item from cart?'),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                cart.products = cart.products;
              });
              Navigator.pop(context, 'Cancel');
            },
            child: const Text('No'),
          ),
          TextButton(
            onPressed: () {
              updateCart(index);
            },
            child: const Text('Yes'),
          ),
        ],
      ),
    );
  }

  updateCart(int index) {
    setState(() {
      totalAmount -= cart.products.elementAt(index).totalPrice;
      cart.totalAmount = totalAmount;
      cart.products.removeAt(index);
    });
    Navigator.pop(context);
  }
}
