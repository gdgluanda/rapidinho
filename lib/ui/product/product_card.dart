import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/product.dart';
import 'package:rapidinho/styling/rapidinho_icon.dart';
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
    padding: EdgeInsets.symmetric(horizontal: 8.0),
    child: Stack(
      children: <Widget>[
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            ClipRRect(
                borderRadius: BorderRadius.circular(10.0),
                child: Image.asset(
                    product.imagePath,
                    fit: BoxFit.contain,
                    width: 200.0,
                ),
            ),
            Container(
              height: 135.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      children: filterList.map((filter)
                          => Stack(
                            children: [
                              Icon(Icons.star, size: 20.0, color: Colors.black54),
                              Icon(Icons.star, size: 19.0, color: Colors.yellow[700]),
                            ],
                          ),
                      ).toList()
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 8.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        Text(
                          'Kz 110,${product.price.floor()}',
                          style: RapidinhoTextStyle.largeText.copyWith(fontWeight: FontWeight.w600, color: Colors.black54),
                          overflow: TextOverflow.ellipsis,
                          softWrap: false,
                        ),
                        Text(
                          '.00',
                          style: RapidinhoTextStyle.normalText.copyWith(fontWeight: FontWeight.w600, color: Colors.black54),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
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
                onPressed: (){
                  //TODO add to cart action
                },
                color: Colors.grey[900],
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Text('Adicionar ',
                      style: RapidinhoTextStyle.largeText.copyWith(fontWeight: FontWeight.w500, color: Colors.white)),
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
