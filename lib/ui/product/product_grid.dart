import 'package:flutter/material.dart';
import 'package:flutter_sticky_header/flutter_sticky_header.dart';
import 'package:rapidinho/model/product.dart';
import 'package:rapidinho/model/product_category.dart';
import 'product_card.dart';
import 'package:rapidinho/data/data.dart';

class ProductGrid extends StatelessWidget {

  final VoidCallback onTap;
  final ProductType productType;

  ProductGrid({
    this.onTap,
    this.productType,
  });

  Widget _buildSideHeader(BuildContext context, int index, {String text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
      child: Align(
        alignment: Alignment.centerLeft,
        child: new SizedBox(
          height: 50.0,
          width: 90.0,
          child: GestureDetector(
            onTap: () => Scaffold.of(context).showSnackBar(new SnackBar(content: Text('$index'))),
            child: new Text('${productType.name}', textAlign: TextAlign.right),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    int i = 0;
    return CustomScrollView(
      slivers: List.generate(i += 10, (sliverIndex) {
        sliverIndex += i;
        return SliverStickyHeader(
          overlapsContent: true,
          header: _buildSideHeader(context, sliverIndex),
          sliver: SliverPadding(
            padding: EdgeInsets.only(left: 100.0),
            sliver: SliverGrid(
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 4.0,
                  mainAxisSpacing: 4.0,
                  childAspectRatio: 1.0
              ),
              delegate: SliverChildBuilderDelegate((context, i) =>
                  ProductCard.medium(
                      product: MockData.productList.firstWhere((Product product) => product.categoryId == productType.category.index),
                      onTap: onTap
                  ),
                childCount: 12,
              ),
            ),
          ),
        );
      }),
    );
  }
}
