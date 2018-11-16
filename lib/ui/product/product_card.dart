import 'package:flutter/material.dart';
import 'package:rapidinho/model/product_item.dart';

class ProductCard extends StatelessWidget {

  final Product product;
  final Widget child;
  final VoidCallback onTap;

  ProductCard.small({
    this.product,
    this.onTap,
  }) : child = Container(

  );


  ProductCard.medium({
    this.product,
    this.onTap,
  }) : child = Container(
    child: GestureDetector(
      onTap: onTap,
      child: GridTile(
        child: Card(
          child: Container(
            color: Colors.orange,
          ),
        ),
        footer: Container(
          color: Colors.white.withOpacity(0.5),
          child: Padding(
            padding: EdgeInsets.all(8.0),
            child: Text(
              'Grid tile',
              style: TextStyle(color: Colors.black),
            ),
          ),
        ),
      ),
    ),
  );

  ProductCard.large({
    this.product,
    this.onTap,
  }) : child = Container(

  );

  @override
  Widget build(BuildContext context) {
    return child;
  }
}
