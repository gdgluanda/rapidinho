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
                          product.imagePath,
                          fit: BoxFit.contain,
                          width: 200.0,
                      ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
//                  Text.rich(
//                    '${MockData.vendorList.firstWhere((vendor) => vendor.id == product.vendorId).name}',
//                    style: RapidinhoTextStyle.largeText.copyWith(fontWeight: FontWeight.w600, color: Colors.black54),
//                    maxLines: 2,
//                  ),
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
                              'Kz ${product.price.floor()}',
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
                    style: RapidinhoTextStyle.mediumText.copyWith(fontWeight: FontWeight.w600, color: Colors.black),
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
                          '6 ',
                          style: RapidinhoTextStyle.mediumText.copyWith(fontWeight: FontWeight.w600),
                        ),
                        Text(
                          'itens',
                          style: RapidinhoTextStyle.mediumText,
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 50.0, maxHeight: 30.0),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            border: Border.all(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0), bottomLeft: Radius.circular(10.0)),
                          ),
                          child: FlatButton(
                            child:  Text(
                                '-',
                                style: RapidinhoTextStyle.displayText.copyWith(color: Colors.red)),
                            onPressed: (){
                              //TODO decrement quantity
                            },
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          constraints: BoxConstraints(maxWidth: 50.0, maxHeight: 30.0),
                          decoration: BoxDecoration(
                            color: Colors.red,
                            border: Border.all(color: Colors.red, width: 2.0),
                            borderRadius: BorderRadius.only(topRight: Radius.circular(10.0), bottomRight: Radius.circular(10.0)),
                          ),
                          child: FlatButton(
                            child:  Text(
                                '+',
                                style: RapidinhoTextStyle.displayText.copyWith(color: Colors.white)),
                            onPressed: (){
                              //TODO increment quantity
                            },
                          ),
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
                      'Kz 110,${product.price}0',
                      style: RapidinhoTextStyle.mediumText.copyWith(fontWeight: FontWeight.w600),
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
