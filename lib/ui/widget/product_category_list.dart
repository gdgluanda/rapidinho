import 'package:flutter/material.dart';
import 'package:rapidinho/data/data.dart';
import 'package:rapidinho/model/product_category.dart';
import 'package:rapidinho/styling/rapidinho_style.dart';
import 'package:rapidinho/ui/product/products_page.dart';

class ProductCategoryList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
      return SizedBox(
        height: 110.0,
        child: Container(
          margin: EdgeInsets.only(top: 40.0),
          child: ListView(
            physics: BouncingScrollPhysics(),
            scrollDirection: Axis.horizontal,
            children: MockData.productCategoryList.map((ProductType product){
              return Container(
                margin: EdgeInsets.symmetric(horizontal: 10.0),
                child: Column(
                  children: <Widget>[
                    Text(product.name, style: RapidinhoTextStyle.normalText),
                    InkWell(
                      onTap: (){
                        Navigator.push(context, MaterialPageRoute(builder: (context){
                          return ProductsPage(product);
                        }));
                      },
                      child: CircleAvatar(
                        radius: 25.0,
                        backgroundColor: Colors.red,
                        child: Image.asset(product.assetPath),
                      ),
                    ),
                  ],
                ),
              );
            }).toList(),
          ),
        )
      );
  }
}
