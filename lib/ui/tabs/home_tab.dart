import 'package:flutter/material.dart';
import 'package:rapidinho/ui/place/nearby_places.dart';
import 'package:rapidinho/ui/widget/product_category_list.dart';
import 'package:rapidinho/ui/widget/featured_image.dart';

class HomeTab extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: kToolbarHeight),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: FeaturedImage(),
          ),
          SliverToBoxAdapter(
            child: ProductCategoryList(),
          ),
          SliverToBoxAdapter(
            child: NearbyPlaces(),
          ),
        ],
      ),
    );
  }
}