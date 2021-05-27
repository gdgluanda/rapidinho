import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/cart.dart';
import 'package:rapidinho/model/cart_item.dart';
import 'package:rapidinho/model/product.dart';
import 'package:rapidinho/model/profile.dart';
import 'package:rapidinho/styling/rapidinho_icon.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:rapidinho/ui/home_page.dart';

class ProductAddToCart extends StatefulWidget {
  final Product product;
  final CartItem cartItem;
  ProductAddToCart({@required this.product, @required this.cartItem});
  @override
  _ProductAddToCartState createState() => _ProductAddToCartState();
}

class _ProductAddToCartState extends State<ProductAddToCart> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 8.0),
      child: Stack(
        children: <Widget>[
          Column(
            children: <Widget>[
              Container(
                height: 135.0,
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10.0),
                      child: Image.asset(
                        widget.product.imagePath,
                        fit: BoxFit.contain,
                        width: 175.0,
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                              children: filterList
                                  .map(
                                    (filter) => Stack(
                                      children: [
                                        Icon(Icons.star,
                                            size: 20.0, color: Colors.black54),
                                        Icon(Icons.star,
                                            size: 19.0,
                                            color: Colors.yellow[700]),
                                      ],
                                    ),
                                  )
                                  .toList()),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 8.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: <Widget>[
                              Text(
                                'Kz ${widget.product.price.floor()}',
                                style: RapidinhoTextStyle.largeText.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                                overflow: TextOverflow.ellipsis,
                                softWrap: false,
                              ),
                              Text(
                                '.00',
                                style: RapidinhoTextStyle.normalText.copyWith(
                                    fontWeight: FontWeight.w600,
                                    color: Colors.black54),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Text(
                      'Quantidade',
                      style: RapidinhoTextStyle.mediumText.copyWith(
                          fontWeight: FontWeight.w600, color: Colors.black),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(bottom: 8.0),
                    child: Divider(color: Colors.black54, height: 5.0),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: <Widget>[
                          Text(
                            '${widget.cartItem.totalItem.toString()} ',
                            style: RapidinhoTextStyle.mediumText
                                .copyWith(fontWeight: FontWeight.w600),
                          ),
                          Text(
                            'itens',
                            style: RapidinhoTextStyle.mediumText,
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(0.0),
                              minimumSize: Size(50.0, 30.0),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topLeft: Radius.circular(10.0),
                                    bottomLeft: Radius.circular(10.0)),
                                side: BorderSide(color: Colors.red, width: 2.0),
                              ),
                            ),
                            child: Text(
                              '-',
                              style: TextStyle(fontSize: 24.0),
                            ),
                            onPressed: _decreaseItemCount,
                          ),
                          TextButton(
                            style: TextButton.styleFrom(
                              padding: EdgeInsets.all(0.0),
                              minimumSize: Size(50.0, 30.0),
                              backgroundColor: Colors.red,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.only(
                                    topRight: Radius.circular(10.0),
                                    bottomRight: Radius.circular(10.0)),
                                side: BorderSide(color: Colors.red, width: 2.0),
                              ),
                            ),
                            child: Text(
                              '+',
                              style: TextStyle(
                                  fontSize: 24.0, color: Colors.white),
                            ),
                            onPressed: _increaseItemCount,
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(
                    children: <Widget>[
                      Text(
                        'Total: ',
                        style: RapidinhoTextStyle.mediumText,
                      ),
                      Text(
                        'Kz ${widget.cartItem.totalPrice}',
                        style: RapidinhoTextStyle.mediumText
                            .copyWith(fontWeight: FontWeight.w600),
                      ),
                    ],
                  ),
                ],
              ),
            ],
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 50.0, vertical: 16.0),
              height: 50.0,
              child: ClipRRect(
                borderRadius: new BorderRadius.circular(50.0),
                child: MaterialButton(
                    minWidth: 70.0,
                    onPressed: _addToCart,
                    color: Colors.grey[900],
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text('Adicionar ',
                            style: RapidinhoTextStyle.largeText.copyWith(
                                fontWeight: FontWeight.w500,
                                color: Colors.white)),
                        Icon(
                          RapidinhoIcon.shoppingCart,
                          color: Colors.white,
                          size: 20.0,
                        )
                      ],
                    )),
              ),
            ),
          )
        ],
      ),
    );
  }

  _increaseItemCount() {
    setState(() {
      widget.cartItem.totalItem += 1;
      widget.cartItem.totalPrice =
          widget.product.price * widget.cartItem.totalItem;
    });
  }

  _decreaseItemCount() {
    if (widget.cartItem.totalItem > 1) {
      setState(() {
        widget.cartItem.totalItem -= 1;
        widget.cartItem.totalPrice =
            widget.product.price * widget.cartItem.totalItem;
      });
    }
  }

  _addToCart() {
    double totalAmount = 0;
    addedItems.add(widget.cartItem);
    for (var item in addedItems) {
      totalAmount += item.totalPrice;
    }
    cart = Cart(
        id: 1,
        products: addedItems,
        profile: currentProfile,
        purchasedDate: DateTime.now(),
        totalAmount: totalAmount);
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text('Added'),
        action: SnackBarAction(
          label: 'View',
          onPressed: () {
            Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(
                    index: 2,
                  ),
                ),
                (Route<dynamic> route) => false);
          },
        ),
      ),
    );
  }
}
