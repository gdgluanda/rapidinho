import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';

class ProductCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 100.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 40.0),
              height: 50.0,
              child: ListView(
                physics: BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                children: MockData.products.map((product){
                  return Container(
                    margin: EdgeInsets.symmetric(horizontal: 10.0),
                    child: CircleAvatar(
                      radius: 25.0,
                      backgroundColor: Colors.red,
                      child: Image.asset(product.assetPath),
                    ),
                  );
                }).toList(),
              ),
            ),
          ],
        )
      );
  }
}
