import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/product.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  final Widget child;
  final VoidCallback onTap;

  ProductCard.small({
    this.product,
    this.onTap,
  }) : child = Container(
    child: Text('Text', style: TextStyle(color: Colors.white),),
  );

  ProductCard.medium({
    this.product,
    this.onTap,
  }) : child = Container(
    child: GestureDetector(
      onTap: onTap,
      child: Card(
        elevation: 4.0,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Stack(
              children: <Widget>[
                ClipRRect(
                    borderRadius: BorderRadius.circular(5.0),
                    child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.contain)
                ),
              ],
            ),
            Container(
              padding: EdgeInsets.only(left: 5.0, top: 4.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    product.itemName,
                    style: RapidinhoTextStyle.smallText,
                  ),
                  Text(
                    'KZ ${product.price}',
                    style: RapidinhoTextStyle.verySmallText.copyWith(fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    ),
  );

  ProductCard.large({
    this.product,
    this.onTap,
  }) : child = Container(

  );

  ProductCard.loading({
    this.product,
    this.onTap,
  }) : child = Container(

  );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
