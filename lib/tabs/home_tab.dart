import 'package:flutter/material.dart';
import 'package:rapidinho/ui/widget/home_card_item.dart';

class HomeTab extends StatefulWidget {
  @override
  _HomeTabState createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    final Size screenSize = MediaQuery.of(context).size;
    return Container(
      alignment: Alignment.topCenter,
      margin: EdgeInsets.only(top: kToolbarHeight),
      child: CustomScrollView(
        slivers: <Widget>[
          SliverToBoxAdapter(
            child: SizedBox(
              height: screenSize.width > screenSize.height
                  ? (screenSize.height - kToolbarHeight) * 0.55
                  : (screenSize.height - kToolbarHeight) * 0.35,
              child: Image.asset(
                'assets/images/featured_meal.jpg',
                fit: BoxFit.cover,
                //height: 200.0,
              ),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.0,
              child: HomeItem(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.0,
              child: HomeItem(),
            ),
          ),
          SliverToBoxAdapter(
            child: SizedBox(
              height: 150.0,
              child: HomeItem(),
            ),
          ),
        ],
      ),
    );
  }
}
